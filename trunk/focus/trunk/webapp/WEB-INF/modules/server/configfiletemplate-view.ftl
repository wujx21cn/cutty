<@bravo.Page name="configFileTemplate_add" title="新增配置文件模板">
	<@bravo.Viewport  layout="border">
		<@bravo.FormPanel name="configFileTemplateAddForm" region="center" border="false" width="800" tbar="toolBar"  dataProxy="./configFileTemplate!saveAndRendJsonData.action">  
			<@bravo.Toolbar name="toolBar" valign="bottom">
				<@bravo.Button name="Save" tooltip="'保存'" text="保存" iconCls="add" handler="ajaxSubmitForm(\\'configFileTemplateAddForm\\')"/>
			</@bravo.Toolbar>
                         <@bravo.FieldSet cols="1;1;1" rows="1;1;1" >		
					<@bravo.TextField fieldLabel="" name="location" width="165"/>
					<@bravo.TextField fieldLabel="" name="comments" width="165"/>
					<@bravo.TextField fieldLabel="" name="name" width="165"/>
			</@bravo.FieldSet>
		</@bravo.FormPanel>
    </@bravo.Viewport>
</@bravo.Page>

