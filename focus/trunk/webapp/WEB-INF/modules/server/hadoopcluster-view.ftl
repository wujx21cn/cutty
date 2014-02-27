<@bravo.Page name="hadoopCluster_add" title="Hadoop集群">
	<@bravo.Viewport  layout="border">
		<@bravo.FormPanel name="hadoopClusterViewForm" region="center" border="false" width="800" tbar="toolBar"  dataProxy="./hadoopCluster!saveAndRendJsonData.action">  
			<@bravo.Toolbar name="toolBar" valign="bottom">
				<@bravo.Button name="Save" tooltip="'保存'" text="保存" iconCls="add" handler="ajaxSubmitForm(\\'hadoopClusterAddForm\\')"/>
			<#if notToBeAddedFileTemplates == "false">
				<@bravo.Button name="newConfiFile" tooltip="'新增配置文件'" text="新增配置文件" iconCls="task" handler="openNewWin(\\'clusterNewConfigWinID\\',\\'./hadoopCluster!addConfigFile.action?id=%{formValue.id?c}\\',\\'新增集群配置文件\\')"/>
			</#if>
			</@bravo.Toolbar>
                         <@bravo.FieldSet cols="2;1,1;2" rows="1;1,1;1" >		
					<@bravo.TextField fieldLabel="名称" allowBlank="false" name="name" width="600"/>
					<@bravo.ComboBox fieldLabel="版本号" name="hadoopVersion.id" allowBlank="false" editable="false" dataProxy="hql[from Enumeration where enumType.id=18]" displayField="name" valueField="id" />
					<@bravo.ComboBox fieldLabel="名称节点" name="nameNode.id" allowBlank="false" editable="false" dataProxy="hql[from HadoopNode where nodeType.id=27]" displayField="name" valueField="id" />
					<@bravo.TextArea fieldLabel="描述" name="comments" width="600" height="120"/>
			</@bravo.FieldSet>
			<@bravo.Hidden fieldLabel="id" name="id"  readOnly="true" value="%{formValue.id?c}" />
		</@bravo.FormPanel>
		<@bravo.TabPanel activeTab="0" region="south" name="tab" height="250" split="true" collapsible="true">
			<@bravo.GridPanel title="对应节点列表" tbar="hadoopVersionToolBar" name="clusterNodeGrid"  dataProxy="./hadoopCluster!getClusterNodeList.action?id=%{formValue.id?c}"  contextDataName="hadoopNodes">
				<@bravo.Toolbar name="hadoopVersionToolBar" valign="top">	
					<@bravo.M2MSelectButton text="添加数据节点" iconCls="add" targetProxy="./hadoopNode!queryDataNode.action?enumType.id=18" targetGridName="hadoopNode_Grid" originGridName="clusterNodeGrid" entityName="HadoopCluster" fieldName="dataNodes" entityId="%{formValue.id?c}"/>
					<@bravo.M2MRemoveButton text="删除数据节点" iconCls="delete" originGridName="clusterNodeGrid" entityName="HadoopCluster" fieldName="dataNodes" entityId="%{formValue.id?c}"/>
				</@bravo.Toolbar>			  
			      <@bravo.Column hidden="true" name="id" header="ID" width="0"  sortable="true"  resizable="true"     />
			       <@bravo.Column  name="name" header="节点名"  width="175"  sortable="true" resizable="true"     />
			       <@bravo.Column  name="hostName" header="计算机名" width="175"  sortable="true" resizable="true" />  
				 <@bravo.Column name="nodeType.name" header="节点类型" width="175"  sortable="true"  resizable="true"     />
			     <@bravo.Column name="view" header="查看" sortable="true" >
			         <a href=\'javascript:gridOpenNewWin(\\"./hadoopNode!view.action?id=@{rowValue.id?c}\\",\\"查看节点[@{rowValue.name}]\\",\\"hadoopNode_Grid\\")\' style=\\"TEXT-DECORATION:none\\"><span style=color:red;>查看</span></a>
			     </@bravo.Column>			   
			</@bravo.GridPanel>

<#list existConfigFiles as existConfigFile>

			<@bravo.GridPanel title="配置[${existConfigFile.configFileTemplate.name}]" tbar="configFileToolBar_${existConfigFile_index}" name="configFileGrid_${existConfigFile_index}" dataProxy="./user!findAndRendJsonData.action?roles.id=%{formValue.id?c}"  contextDataName="Users">
					<@bravo.Toolbar name="configFileToolBar_${existConfigFile_index}" valign="top">
						<@bravo.M2MSelectButton text="选择添加配置项" iconCls="add" targetProxy="./configItemTemplate!query.action?configFileTemplate.id=${existConfigFile.configFileTemplate.id}" targetGridName="configFileGrid_${existConfigFile_index}" originGridName="configItemTemplateGrid" entityName="ConfigFile" fieldName="configItems" entityId="%{formValue.id?c}"/>
						<@bravo.M2MRemoveButton text="删除配置项" iconCls="delete" originGridName="roleUserGrid" entityName="Role" fieldName="users" entityId="%{formValue.id?c}"/>
					</@bravo.Toolbar>			  
					<@bravo.Column hidden="true" name="id" header="ID" width="0"  sortable="true"  resizable="true"     />
					<@bravo.Column  name="loginid" header="登陆名"  width="175"  sortable="true" resizable="true"     />
					<@bravo.Column dataIndex="userName" name="userName" header="用户名" width="175"  sortable="true" resizable="true" />     
					<@bravo.Column name="department.name" header="部门名称" width="175"  sortable="true"  resizable="true"     />
					<@bravo.Column name="view" header="查看" sortable="true" >
						<a href=\'javascript:gridOpenNewWin(\\"./user!view.action?id=@{rowValue.id?c}\\",\\"查看人员[@{rowValue.userName}]\\",\\"roleUserGrid\\")\' style=\\"TEXT-DECORATION:none\\"><span style=color:red;>查看</span></a>
					</@bravo.Column>		
				</@bravo.GridPanel>
</#list>

		</@bravo.TabPanel>
    </@bravo.Viewport>
</@bravo.Page>

<script language="javascript">
function openNewWin(winId,url,title){
var currentHadoopCluster = parent.Ext.getCmp('hadoopViewWin#{formValue.id}');
var html = "<iframe id='frmForm' name='frmForm' src='"+url+"' width='100%' height='100%'></iframe>";	
newsTitle=title;
			var tabs = new Ext.Panel({
					region: 'center',
					margins:'3 3 3 0', 
					defaults:{autoScroll:true},
					html: html
				});
			if(Ext.getCmp(winId)!=undefined){
				Ext.getCmp(winId).close();
			}
			win = new Ext.Window({
				title:newsTitle,
				width:620,
				height:500,
				closable:true,
				maximizable:true,
				border:false,
				plain:true,
				//modal:true,
				id:winId,
				constrain :false,
			    collapsible:true,
				layout: 'border',
				items: [tabs]
			});
			win.show();	
			win.on('close', function(){
				currentHadoopCluster.items.itemAt(0).body.update('<iframe scrolling="auto"   frameborder="0" width="100%" height="100%"   src="./hadoopCluster!view.action?id=#{formValue.id}"></iframe>');    
			});	
}

</script>
