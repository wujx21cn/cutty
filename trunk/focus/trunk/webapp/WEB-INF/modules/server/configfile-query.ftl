<@bravo.Page name="configFileManager" title="ConfigFile管理">
	<@bravo.Viewport  layout="border">
		    <@bravo.FormPanel name="configFileQueryForm" tbar="Toolbar" region="north" dataProxy="./configFile!find.action"  ajaxPass="true"  frame="true" autoScroll="true" height="160" width="800"  title="ConfigFile管理查询列表"  collapsible="true" >  
			<@bravo.Toolbar name="Toolbar" valign="top">
				<@bravo.Button name="View" text="查找" iconCls="search" handler="searchForGrid(\\'configFileQueryForm\\',\\'configFileGrid\\')"/>
				<@bravo.Button text="重置" iconCls="reset" handler="resetForm(\\'configFileQueryForm\\')"/>
			</@bravo.Toolbar>
				<@bravo.FieldSet labelWidth="80"  cols="" rows="" >		
				</@bravo.FieldSet>
			 </@bravo.FormPanel>    

			 <@bravo.GridPanel  region="center" tbar="Toodddlbar" name="configFileGrid"  contextDataName="configFiles"   dataProxy="./configFile!findAndRendJsonData.action"  collapsible="true" split="true" stripeRows="true" >
			     <@bravo.Toolbar name="Toodddlbar" valign="top" >
				 <@bravo.Button name="Add" text="新增" iconCls="add" handler="gridOpenNewWin(\\'./configFile!add.action\\',\\'新增\\',\\'configFileGrid\\')"/>
				 <@bravo.Button name="Delete" text="删除" iconCls="delete" handler="grid_doDel(\\'./configFile!batchRemove.action\\',\\'configFileGrid\\')"/>
			     </@bravo.Toolbar>               
			     <@bravo.Column hidden="true" name="id" header="ID" width="0"  sortable="true"  resizable="true"     />
				<@bravo.Column name="view" header="查看" sortable="true" >
			         <a href=\'javascript:gridOpenNewWin(\\"./configFile!view.action?id=@{rowValue.id?c}\\",\\"查看configFile[@{rowValue.id}]\\",\\"configFileGrid\\")\' style=\\"TEXT-DECORATION:none\\"><span style=color:red;>查看</span></a>
			     </@bravo.Column>			   
	                </@bravo.GridPanel>
    </@bravo.Viewport>
</@bravo.Page>

