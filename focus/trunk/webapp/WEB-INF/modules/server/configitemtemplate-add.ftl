<@bravo.Page name="configItemTemplate_add" title="新增配置项模板">
	<@bravo.Viewport  layout="border">
		<@bravo.FormPanel name="configItemTemplateAddForm" region="center" border="false" width="800" tbar="toolBar"  dataProxy="./configItemTemplate!save.action">  
			<@bravo.Toolbar name="toolBar" valign="bottom">
				<@bravo.Button name="Save" tooltip="'保存'" text="保存" iconCls="add" handler="submitForm(\\'configItemTemplateAddForm\\')"/>
			</@bravo.Toolbar>
                         <@bravo.FieldSet  labelWidth="80"  cols="1,1;1,1;1,1;2" rows="1,1;1,1;1,1;1" >		
					<@bravo.TextField fieldLabel="名称" name="name" width="200" allowBlank="false" />
					<@bravo.TextField fieldLabel="编码" name="code" width="200" allowBlank="false" />
					<@bravo.ComboBox fieldLabel="所属配置文件" name="configFileTemplate.id" allowBlank="false" editable="false" dataProxy="hql[from ConfigFileTemplate]" displayField="name" valueField="id" />
					<@bravo.Checkbox fieldLabel="是否final" name="isFinal" width="165" inputValue="1"/>
					<@bravo.Checkbox fieldLabel="是否默选" name="choosed" width="165" inputValue="1"/>
					<@bravo.TextField fieldLabel="默认值" name="defaultValue" width="165"/>
					<@bravo.TextArea fieldLabel="描述" name="comments" width="600" height="120"/>i
			</@bravo.FieldSet>
		</@bravo.FormPanel>
    </@bravo.Viewport>
</@bravo.Page>

