/*-- Yeon encode the xml generated by mxCodec into jpdl xml -- 2008.10.7 --*/   
   mxEditor.prototype.jpdlCodec = function(enc, node, jpdlElement)
   {   
      //jpdlElement.setAttribute("xmlns", "urn:jbpm.org:jpdl-3.2");
      //jpdlElement.setAttribute("name", "example");
      var elementList = null;
      var tempElement = null;
      var textElement = null;
      var verList = new Array();
      var verId = null;

      //get the name of the workflow
      elementList = node.getElementsByTagName("Workflow");
      if(elementList.length > 0)
      {
         jpdlElement.setAttribute("name", elementList[0].getAttribute("label"));
		 tempElement = enc.document.createElement("description");
		 textElement = enc.document.createTextNode(elementList[0].getAttribute("description"));
		 tempElement.appendChild(textElement);
		 jpdlElement.appendChild(tempElement);		 
      }

      // get the "Start" tag to "start-state" tag
      elementList = node.getElementsByTagName('Start');
      if(elementList.length > 0)
      {
         tempElement = enc.document.createElement('start-state');
         tempElement.setAttribute("name", elementList[0].getAttribute("label"));
         jpdlElement.appendChild(tempElement);

         verId =  parseInt(elementList[0].getAttribute("id"));
         verList[verId] = tempElement;
      }

      // get the "State" tag to "state" tag
      elementList = node.getElementsByTagName('State');
      for(i = 0; i < elementList.length; i ++ )
      {
         tempElement = enc.document.createElement("state");
         tempElement.setAttribute("name", elementList[i].getAttribute("label"));
         textElement = enc.document.createTextNode(elementList[i].getAttribute("description"));
         tempElement.appendChild(textElement);
         jpdlElement.appendChild(tempElement);

         verId = parseInt(elementList[i].getAttribute("id"));
         verList[verId] = tempElement;
      }
      
      // get the "Task" tag to "task-node" tag
      elementList = node.getElementsByTagName('Task_Node');
      for(i = 0; i < elementList.length; i ++ )
      {
         tempElement = enc.document.createElement("task-node");
         tempElement.setAttribute("name", elementList[i].getAttribute("label"));
         
         if(null!==elementList[i].getAttribute('task') && elementList[i].getAttribute('task')!='')
         {
           	var taskXmlDocument = mxUtils.parseXml(elementList[i].getAttribute('task'));
           	var taskXmlElement = taskXmlDocument.getElementsByTagName('task')[0];
           	tempElement.appendChild(taskXmlElement);
         }
         
         if(null!==elementList[i].getAttribute('event') && elementList[i].getAttribute('event')!='')
         {
           	var eventXmlDocument = mxUtils.parseXml(elementList[i].getAttribute('event'));
           	var eventXmlElement = eventXmlDocument.getElementsByTagName('event')[0];
           	if( eventXmlElement.getAttribute('type')!='' )
           	{
           		tempElement.appendChild(eventXmlElement);
           	}
         }
         
         jpdlElement.appendChild(tempElement);

         verId = parseInt(elementList[i].getAttribute("id"));
         verList[verId] = tempElement;
      }
      
      // get the "Fork" tag to "fork" tag
      elementList = node.getElementsByTagName('Fork');
      for(i = 0; i < elementList.length; i ++ )
      {
         tempElement = enc.document.createElement("fork");
         tempElement.setAttribute("name", elementList[i].getAttribute("label"));
         textElement = enc.document.createTextNode(elementList[i].getAttribute("description"));
         tempElement.appendChild(textElement);
         jpdlElement.appendChild(tempElement);

         verId = parseInt(elementList[i].getAttribute("id"));
         verList[verId] = tempElement;
      }
      
      // get the "Join" tag to "join" tag
      elementList = node.getElementsByTagName('Join');
      for(i = 0; i < elementList.length; i ++ )
      {
         tempElement = enc.document.createElement("join");
         tempElement.setAttribute("name", elementList[i].getAttribute("label"));
         textElement = enc.document.createTextNode(elementList[i].getAttribute("description"));
         tempElement.appendChild(textElement);
         jpdlElement.appendChild(tempElement);

         verId = parseInt(elementList[i].getAttribute("id"));
         verList[verId] = tempElement;
      }

      // get the "End" tag to "end-state" tag
      elementList = node.getElementsByTagName('End');
      if(elementList.length > 0)
      {
         tempElement = enc.document.createElement('end-state');
         tempElement.setAttribute("name", elementList[0].getAttribute("label"));
         jpdlElement.appendChild(tempElement);

         verId = parseInt(elementList[0].getAttribute("id"));
         verList[verId] = tempElement;
      }

      // get the Transition Tag
      elementList = node.getElementsByTagName('Edge');
      for(i = 0; i < elementList.length; i ++ )
      {
         tempElement = enc.document.createElement("transition");
         tempElement.setAttribute("name", elementList[i].getAttribute("label"));

         // set the "to" attribute
         verId = parseInt(elementList[i].getElementsByTagName("mxCell")[0].getAttribute("target"));
         if( !isNaN(verId) )
         {
         	tempElement.setAttribute("to", verList[verId].getAttribute("name"));
         }
         else
         {
         	Ext.MessageBox.alert('消息','边的终点未连接!');
         	return false;
         }

         // put it into the source state tag
         verId = parseInt(elementList[i].getElementsByTagName("mxCell")[0].getAttribute("source"));
         if( !isNaN(verId) )
         {
         	verList[verId].appendChild(tempElement);
         }
         else
         {
         	Ext.MessageBox.alert('消息','边的起点未连接!');
         	return false;
         }
         
         // set the "condition" child node
         textElement = enc.document.createTextNode(elementList[i].getAttribute("condition"));
         if(elementList[i].getAttribute("condition")!="")
         {
            var conditionElement = enc.document.createElement("condition");
            conditionElement.appendChild(textElement);
            tempElement.appendChild( conditionElement );
         }
      }
      
      return true;
   }
   ;

   // Yeon over write the save method to convert the xml codes
   mxEditor.prototype.save = function(isAutomatic, linefeed, url)
   {
      if(isAutomatic == null || isAutomatic == this.autoSaving)
      {
         this.dispatchEvent('beforeSave', this, isAutomatic);
         this.lastSnapshot = new Date().getTime();
         this.ignoredChanges = 0;
         this.modified = false;
         var e = null;
         try
         {
            url = url || this.getUrlPost(isAutomatic);
            if(url != null && url.length > 0)
            {
               var data = this.writeGraphModel();
               this.postDiagram(url, data);
            }
            else if( ! isAutomatic)
            {
               var enc = new mxCodec();
               var node = enc.encode(this.graph.getModel());
               //var xml = mxUtils.getPrettyXml(node);
               //mxUtils.popup(xml);
			   //alert(node.xml);

/* -- Yeon Add some codes here to build our jpdl xml document
               by the information in the graph xml document -- */
               var jpdlElement = enc.document.createElement("process-definition");
               var codecSucce = this.jpdlCodec(enc,node,jpdlElement);
               //mxUtils.popup(mxUtils.getPrettyXml(jpdlElement));
			   //alert(jpdlElement.xml);

			   
/* -- Okid -- */
			   
/* -- Yeon use Ext to post the processDigram codes and processDefinition codes -- */
	            if( isValid(node) && true==codecSucce )
				{
				   Ext.Ajax.request
				   ({
						method: 'POST',
						url: './processDefinition!deployProcessDefinition.action',
						params: 
						{
							processdefinition : getXml(jpdlElement),
							processdigram : getXml(node)					     
						},
						success: function(o) { 
							if ("success" == o.responseText){
								Ext.MessageBox.alert('消息', '发布流程成功!');
							} else {
								Ext.MessageBox.alert('消息', '发布流程失败!<br/><font color=red>'+o.responseText+'</font>');
							}}
						,failure: function(form, action) { Ext.Msg.alert('消息', '发布流程成功!') }
					});
				}
/* -- Okid -- */

            }
            this.dispatchEvent('save', this, isAutomatic, url);
         }
         catch(ex)
         {
            e = ex;
         }
         this.dispatchEvent('afterSave', this, isAutomatic, e);
      }
   }
   ;

   mxEditor.prototype.showProperties = function(cell)
   {
      cell = cell || this.graph.getSelectionCell();


      if(cell == null)
      {
         cell = this.graph.getCurrentRoot();
         if(cell == null)
         {
            cell = this.graph.getModel().getRoot();
         }
      }
      if(cell != null)
      {
         this.graph.showProperties(cell);
/*-- Yeon  comment it cause I have transplant it to the mxGraph object      
         this.graph.editor.stopEditing(true);
         var offset = mxUtils.getOffset(this.graph.container);
         var x = offset.x + 10;
         var y = offset.y;
         if(this.properties != null && ! this.movePropertiesDialog)
         {
            x = this.properties.getX();
            y = this.properties.getY();
         }
         else
         {
            var bounds = this.graph.getCellBounds(cell);
            if(bounds != null)
            {
               x += bounds.x + Math.min(200, bounds.width);
               y += bounds.y;
            }
         }
         this.hideProperties();
         var node = this.createProperties(cell);
         if(node != null)
         {
            this.properties = new mxWindow(mxResources.get(this.propertiesResource) || this.propertiesResource, node, x, y, this.propertiesWidth, this.propertiesHeight, false);
            this.properties.setVisible(true);
         }
-- Okid --*/
      }
   }
   ;
/*-- Okid --*/
/**
 * kukuxia.kevin.hw 2008-12-15
 */
function isValid(node){
	  var taskElementList = node.getElementsByTagName('Task_Node');
      for(var i = 0; i < taskElementList.length; i ++ )
      {     
         if(taskElementList[i].getAttribute('task')!='')
         {
           	var taskXmlDocument = mxUtils.parseXml(taskElementList[i].getAttribute('task'));
//			alert(taskXmlDocument.xml);
           	var taskXmlElement = taskXmlDocument.getElementsByTagName('task')[0];
			var taskName = taskXmlElement.getAttribute('name'); 
//			alert(taskXmlElement.xml);
            var variableXmlElement = taskXmlElement.getElementsByTagName('variable');
			var isTaskUrlExist = false;
			if(variableXmlElement!=null){
				for(var j = 0; j < variableXmlElement.length; j ++ )
				 {  
					 var colName = variableXmlElement[j].getAttribute('name');
					 if(colName=='workflow_task_url'){
						   isTaskUrlExist = true;
					   var colValue = getText(variableXmlElement[j]);
					   if(colValue==''||colValue==null)
					   {
							 Ext.MessageBox.alert('消息', '任务节点:\"'+taskName+'\"variable的workflow_task_url属性值为空，请填写');
							 return false;
					   }
					 }
				 }
				if(!isTaskUrlExist){
							 Ext.MessageBox.alert('消息', '任务节点:\"'+taskName+'\"variable的workflow_task_url属性值为空，请填写');
							 return false;
				}
			}else{
							 Ext.MessageBox.alert('消息', '任务节点:\"'+taskName+'\"variable的workflow_task_url属性值为空，请填写');
							 return false;
			}

/**
 * Cathy.Lin 2008-12-15
 */
            var assignmentXmlElement = taskXmlElement.getElementsByTagName('assignment')[0];
			if(assignmentXmlElement!=null)
			 {
			 if((assignmentXmlElement.getAttribute('expression')==''||
				 assignmentXmlElement.getAttribute('expression')==null)&&
				 (assignmentXmlElement.getAttribute('actor-id')==''||
				 assignmentXmlElement.getAttribute('actor-id')==null)&&
				  (assignmentXmlElement.getAttribute('pooled-actors')==''||
				 assignmentXmlElement.getAttribute('pooled-actors')==null))

			   {
				   Ext.MessageBox.alert('消息', '任务节点:\"'+taskName+'\"assignment的三个属性值不能全为空，请填写');
				   return false;
			   }
			 }else {
				   Ext.MessageBox.alert('消息', '任务节点:\"'+taskName+'\"assignment的三个属性值不能全为空，请填写');
				   return false;
			 }

       }else{
		   Ext.MessageBox.alert('消息', '任务节点:\"'+taskName+'\"variable的workflow_task_url属性值为空，请填写');
           return false;
	   }
     }
	  return true;
}
