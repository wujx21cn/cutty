<@bravo.Page name="configFileTemplateManager" title="配置文件模板管理">
	<@bravo.Viewport  layout="border">
		    <@bravo.FormPanel name="configFileTemplateQueryForm" tbar="Toolbar" region="north" dataProxy="./configFileTemplate!find.action"  ajaxPass="true"  frame="true" autoScroll="true" height="160" width="800"  title="ConfigFileTemplate管理查询列表"  collapsible="true" >  
			<@bravo.Toolbar name="Toolbar" valign="top">
				<@bravo.Button name="View" text="查找" iconCls="search" handler="searchForGrid(\\'configFileTemplateQueryForm\\',\\'configFileTemplateGrid\\')"/>
				<@bravo.Button text="重置" iconCls="reset" handler="resetForm(\\'configFileTemplateQueryForm\\')"/>
			</@bravo.Toolbar>
				<@bravo.FieldSet labelWidth="80"  cols="1;1" rows="1;1" >		
					<@bravo.TextField fieldLabel="文件名" name="name" width="165"/>
					<@bravo.TextField fieldLabel="安装路径" name="location" width="165"/>
				</@bravo.FieldSet>
			 </@bravo.FormPanel>    

		<@bravo.EditorGridPanel  region="center" tbar="Toodddlbar"  name="configFileTemplateGrid"  contextDataName="enumerationTypes" dataProxy="./configFileTemplate!findAndRendJsonData.action" stripeRows="true"   collapsible="true" split="true">
			<@bravo.Toolbar name="Toodddlbar" valign="top" defaults="{bodyStyle:'margin-top: 0px;padding:0px 0px 0px 0px'}" >
				<@bravo.Button name="Add" text="新增" iconCls="add" handler="grid_doAdd(\\'configFileTemplateGrid\\')"/>	
				<@bravo.Button name="Save" text="保存" iconCls="save" handler="grid_doSave(\\'./configFileTemplate!batchSave.action\\',\\'configFileTemplateGrid\\')"/>	
				<@bravo.Button text="删除" iconCls="delete" handler="grid_doDel(\\'./configFileTemplate!batchRemove.action\\',\\'configFileTemplateGrid\\')"/>	
			</@bravo.Toolbar>               
				<@bravo.Column dataIndex="id" hidden="true" name="id" header="ID" width="176"  sortable="true"  resizable="true"/>
				<@bravo.Column dataIndex="name" name="name" header="文件名"  width="175"  sortable="true" resizable="true">
					<@bravo.TextField/> 
				</@bravo.Column>
				<@bravo.Column dataIndex="location" name="location" header="安装路径" width="275"  sortable="true"  resizable="true"    >
					<@bravo.TextField/> 
				</@bravo.Column>        
				<@bravo.Column dataIndex="comments" name="comments" header="描述" width="275"  sortable="true"  resizable="true"    >
					<@bravo.TextField/> 
				</@bravo.Column>        
		</@bravo.EditorGridPanel>
    </@bravo.Viewport>
</@bravo.Page>

