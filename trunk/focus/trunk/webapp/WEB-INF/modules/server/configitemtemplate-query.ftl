<@bravo.Page name="configItemTemplateManager" title="配置项模板管理">
	<@bravo.Viewport  layout="border">
		    <@bravo.FormPanel name="configItemTemplateQueryForm" tbar="Toolbar" region="north" dataProxy="./configItemTemplate!find.action"  ajaxPass="true"  frame="true" autoScroll="true" height="160" width="800"  title="ConfigItemTemplate管理查询列表"  collapsible="true" >  
			<@bravo.Toolbar name="Toolbar" valign="top">
				<@bravo.Button name="View" text="查找" iconCls="search" handler="searchForGrid(\\'configItemTemplateQueryForm\\',\\'configItemTemplateGrid\\')"/>
				<@bravo.Button text="重置" iconCls="reset" handler="resetForm(\\'configItemTemplateQueryForm\\')"/>
			</@bravo.Toolbar>
				<@bravo.FieldSet labelWidth="80"  cols="1,1;1" rows="1,1;1" >		
					<@bravo.TextField fieldLabel="名称" name="name" width="165"/>
					<@bravo.TextField fieldLabel="编码" name="code" width="165"/>
					<@bravo.ComboBox fieldLabel="对应配置文件" name="configFileId.id" dataProxy="hql[from ConfigFileTemplate]" displayField="name" valueField="id" />
				</@bravo.FieldSet>
			 </@bravo.FormPanel>    

			 <@bravo.GridPanel  region="center" tbar="Toodddlbar" name="configItemTemplateGrid"  contextDataName="configItemTemplates"   dataProxy="./configItemTemplate!findAndRendJsonData.action"  collapsible="true" split="true" stripeRows="true" >
			     <@bravo.Toolbar name="Toodddlbar" valign="top" >
				 <@bravo.Button name="Add" text="新增" iconCls="add" handler="gridOpenNewWin(\\'./configItemTemplate!add.action\\',\\'新增\\',\\'configItemTemplateGrid\\')"/>
				 <@bravo.Button name="Delete" text="删除" iconCls="delete" handler="grid_doDel(\\'./configItemTemplate!batchRemove.action\\',\\'configItemTemplateGrid\\')"/>
			     </@bravo.Toolbar>               
			     <@bravo.Column hidden="true" name="id" header="ID" width="0"  sortable="true"  resizable="true"     />
				    <@bravo.Column  name="name" header="名称"  width="175"  sortable="true" resizable="true" />
				    <@bravo.Column  name="code" header="编码"  width="175"  sortable="true" resizable="true" />
				    <@bravo.Column  name="configFileTemplate.name" header="所属文件"  width="175"  sortable="true" resizable="true" />
				<@bravo.Column name="view" header="查看" sortable="true" >
			         <a href=\'javascript:gridOpenNewWin(\\"./configItemTemplate!view.action?id=@{rowValue.id?c}\\",\\"查看configItemTemplate[@{rowValue.id}]\\",\\"configItemTemplateGrid\\")\' style=\\"TEXT-DECORATION:none\\"><span style=color:red;>查看</span></a>
			     </@bravo.Column>			   
	                </@bravo.GridPanel>
    </@bravo.Viewport>
</@bravo.Page>

