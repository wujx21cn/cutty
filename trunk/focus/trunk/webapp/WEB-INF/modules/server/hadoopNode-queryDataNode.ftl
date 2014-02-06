<@bravo.Page name="hadoopNodeManager" title="Hadoop节点管理" >
	<@bravo.Viewport  layout="border">
		    <@bravo.FormPanel name="hadoopNode_Find" tbar="Toolbar" region="north" dataProxy="./hadoopNode!find.action"  ajaxPass="true"  frame="true" autoScroll="true" height="180" width="780" title="Hadoop节点列表" collapsible="true" >  
			<@bravo.Toolbar name="Toolbar" valign="top">
				<@bravo.Button name="View" text="查找" iconCls="search" handler="searchForGrid(\\'hadoopNode_Find\\',\\'hadoopNode_Grid\\')"/>
				<@bravo.Button text="重置" iconCls="reset" handler="resetForm(\\'hadoopNode_Find\\')"/>
			</@bravo.Toolbar>
				<@bravo.FieldSet labelWidth="80" cols="2;1,1;2" rows="1;1,1;1" >		
					<@bravo.TextField fieldLabel="节点名" name="name" width="500"/>
					<@bravo.TextField fieldLabel="计算机名" name="userName" width="160" />
					<@bravo.TextField fieldLabel="节点IP" name="engName" width="160" />
					<@bravo.ComboBox name="nameNode.id" fieldLabel="NameNode" width="160" editable="false" dataProxy="hql[from HadoopNode where nodeType.id=27]" displayField="name" valueField="id" />
				</@bravo.FieldSet>
			 </@bravo.FormPanel>    

			 <@bravo.GridPanel name="hadoopNode_Grid" region="center" tbar="Toodddlbar" contextDataName="users" stripeRows="true" dataProxy="./hadoopNode!findAndRendJsonData.action?nodeType.id=26"  collapsible="true" split="true" >
			     <@bravo.Toolbar name="Toodddlbar" valign="top" >
				 <@bravo.Button name="Add" text="新增" iconCls="add" handler="gridOpenNewWin(\\'./hadoopNode!add.action\\',\\'新增节点\\',\\'hadoopNode_Grid\\')"/>
				 <@bravo.Button name="Delete" text="删除" iconCls="delete" handler="grid_doDel(\\'./hadoopNode!batchRemove.action\\',\\'hadoopNode_Grid\\')"/>
			     </@bravo.Toolbar>               
			     <@bravo.Column hidden="true" name="id" header="ID" width="0"  sortable="true"  resizable="true"     />
			     <@bravo.Column  name="name" header="节点名"  width="175"  sortable="true" resizable="true"     />
			     <@bravo.Column  name="hostName" header="计算机名" width="175"  sortable="true" resizable="true" />     
			     
				 <@bravo.Column name="nameNode.name" header="对应NameNode" width="175"  sortable="true"  resizable="true"     />
				 <@bravo.Column name="nodeType.name" header="节点类型" width="175"  sortable="true"  resizable="true"     />
			     <@bravo.Column name="view" header="查看" sortable="true" >
			         <a href=\'javascript:gridOpenNewWin(\\"./hadoopNode!view.action?id=@{rowValue.id?c}\\",\\"查看节点[@{rowValue.name}]\\",\\"hadoopNode_Grid\\")\' style=\\"TEXT-DECORATION:none\\"><span style=color:red;>查看</span></a>
			     </@bravo.Column>			   
	        </@bravo.GridPanel>
    </@bravo.Viewport>
</@bravo.Page>