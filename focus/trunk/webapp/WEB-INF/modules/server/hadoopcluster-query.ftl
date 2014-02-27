<@bravo.Page name="hadoopClusterManager" title="Hadoop集群管理">
	<@bravo.Viewport  layout="border">
		    <@bravo.FormPanel name="hadoopClusterQueryForm" tbar="Toolbar" region="north" dataProxy="./hadoopCluster!find.action"  ajaxPass="true"  frame="true" autoScroll="true" height="160" width="800"  title="HadoopCluster管理查询列表"  collapsible="true" >  
			<@bravo.Toolbar name="Toolbar" valign="top">
				<@bravo.Button name="View" text="查找" iconCls="search" handler="searchForGrid(\\'hadoopClusterQueryForm\\',\\'hadoopClusterGrid\\')"/>
				<@bravo.Button text="重置" iconCls="reset" handler="resetForm(\\'hadoopClusterQueryForm\\')"/>
			</@bravo.Toolbar>
				<@bravo.FieldSet labelWidth="80"  cols="2;1,1" rows="1;1,1" >		
					<@bravo.TextField fieldLabel="名称" name="name" width="600"/>
					<@bravo.ComboBox fieldLabel="版本号" name="hadoopVersion.id"   dataProxy="hql[from Enumeration where enumType.id=18]" displayField="name" valueField="id" />
					<@bravo.ComboBox fieldLabel="名称节点" name="nameNode.id"  dataProxy="hql[from HadoopNode where nodeType.id=27]" displayField="name" valueField="id" />
				</@bravo.FieldSet>
			 </@bravo.FormPanel>    

			 <@bravo.GridPanel  region="center" tbar="Toodddlbar" name="hadoopClusterGrid"  contextDataName="hadoopClusters"   dataProxy="./hadoopCluster!findAndRendJsonData.action"  collapsible="true" split="true" stripeRows="true" >
			     <@bravo.Toolbar name="Toodddlbar" valign="top" >
				 <@bravo.Button name="Add" text="新增" iconCls="add" handler="gridOpenNewWin(\\'./hadoopCluster!add.action\\',\\'新增\\',\\'hadoopClusterGrid\\')"/>
				 <@bravo.Button name="Delete" text="删除" iconCls="delete" handler="grid_doDel(\\'./hadoopCluster!batchRemove.action\\',\\'hadoopClusterGrid\\')"/>
			     </@bravo.Toolbar>               
			     <@bravo.Column hidden="true" name="id" header="ID" width="0"  sortable="true"  resizable="true"     />
				    <@bravo.Column  name="name" header=""  width="175"  sortable="true" resizable="true" />
				    <@bravo.Column  name="hadoopVersion.name" header="版本号"  width="175"  sortable="true" resizable="true" />
				    <@bravo.Column  name="nameNode.name" header="名称节点"  width="175"  sortable="true" resizable="true" />
				<@bravo.Column name="view" header="查看" sortable="true" >
			         <a href=\'javascript:gridOpenNewWinWithId(\\"hadoopViewWin@{rowValue.id?c}\\",\\"./hadoopCluster!view.action?id=@{rowValue.id?c}\\",\\"查看hadoopCluster[@{rowValue.id}]\\",\\"hadoopClusterGrid\\")\' style=\\"TEXT-DECORATION:none\\"><span style=color:red;>查看</span></a>
			     </@bravo.Column>			   
	                </@bravo.GridPanel>
    </@bravo.Viewport>
    
</@bravo.Page>

