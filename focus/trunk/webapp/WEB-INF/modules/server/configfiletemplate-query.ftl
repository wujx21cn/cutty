<@bravo.Page name="configFileTemplateManager" title="ConfigFileTemplate管理">
	<@bravo.Viewport  layout="border">
		    <@bravo.FormPanel name="configFileTemplateQueryForm" tbar="Toolbar" region="north" dataProxy="./configFileTemplate!find.action"  ajaxPass="true"  frame="true" autoScroll="true" height="160" width="800"  title="ConfigFileTemplate管理查询列表"  collapsible="true" >  
			<@bravo.Toolbar name="Toolbar" valign="top">
				<@bravo.Button name="View" text="查找" iconCls="search" handler="searchForGrid(\\'configFileTemplateQueryForm\\',\\'configFileTemplateGrid\\')"/>
				<@bravo.Button text="重置" iconCls="reset" handler="resetForm(\\'configFileTemplateQueryForm\\')"/>
			</@bravo.Toolbar>
				<@bravo.FieldSet labelWidth="80"  cols="1;1" rows="1;1" >		
					<@bravo.TextField fieldLabel="" name="location" width="165"/>
					<@bravo.TextField fieldLabel="" name="name" width="165"/>
				</@bravo.FieldSet>
			 </@bravo.FormPanel>    

			 <@bravo.GridPanel  region="center" tbar="Toodddlbar" name="configFileTemplateGrid"  contextDataName="configFileTemplates"   dataProxy="./configFileTemplate!findAndRendJsonData.action"  collapsible="true" split="true" stripeRows="true" >
			     <@bravo.Toolbar name="Toodddlbar" valign="top" >
				 <@bravo.Button name="Add" text="新增" iconCls="add" handler="gridOpenNewWin(\\'./configFileTemplate!add.action\\',\\'新增\\',\\'configFileTemplateGrid\\')"/>
				 <@bravo.Button name="Delete" text="删除" iconCls="delete" handler="grid_doDel(\\'./configFileTemplate!batchRemove.action\\',\\'configFileTemplateGrid\\')"/>
			     </@bravo.Toolbar>               
			     <@bravo.Column hidden="true" name="id" header="ID" width="0"  sortable="true"  resizable="true"     />
				    <@bravo.Column  name="location" header=""  width="175"  sortable="true" resizable="true" />
				    <@bravo.Column  name="comments" header=""  width="175"  sortable="true" resizable="true" />
				    <@bravo.Column  name="name" header=""  width="175"  sortable="true" resizable="true" />
				<@bravo.Column name="view" header="查看" sortable="true" >
			         <a href=\'javascript:gridOpenNewWin(\\"./configFileTemplate!view.action?id=@{rowValue.id?c}\\",\\"查看configFileTemplate[@{rowValue.id}]\\",\\"configFileTemplateGrid\\")\' style=\\"TEXT-DECORATION:none\\"><span style=color:red;>查看</span></a>
			     </@bravo.Column>			   
	                </@bravo.GridPanel>
    </@bravo.Viewport>
</@bravo.Page>

