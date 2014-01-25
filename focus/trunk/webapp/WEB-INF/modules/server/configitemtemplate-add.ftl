<@bravo.Page name="configItemTemplate_add" title="新增ConfigItemTemplate">
	<@bravo.Viewport  layout="border">
		<@bravo.FormPanel name="configItemTemplateAddForm" region="center" border="false" width="800" tbar="toolBar"  dataProxy="./configItemTemplate!saveAndRendJsonData.action">  
			<@bravo.Toolbar name="toolBar" valign="bottom">
				<@bravo.Button name="Save" tooltip="'保存'" text="保存" iconCls="add" handler="ajaxSubmitForm(\\'configItemTemplateAddForm\\')"/>
			</@bravo.Toolbar>
                         <@bravo.FieldSet cols="1;1;1;1;1;1;1" rows="1;1;1;1;1;1;1" >		
					<@bravo.TextField fieldLabel="描述" name="comments" width="165"/>
					<@bravo.TextField fieldLabel="编码" name="code" width="165"/>
					<@bravo.TextField fieldLabel="名称" name="name" width="165"/>
					<@bravo.ComboBox fieldLabel="所属配置文件" name="configFileId.id" allowBlank="false" editable="false" dataProxy="hql[from ConfigFileTemplate]" displayField="name" valueField="id" />
					<@bravo.TextField fieldLabel="是否final" name="isFinal" width="165"/>
					<@bravo.TextField fieldLabel="默选" name="choosed" width="165"/>
					<@bravo.TextField fieldLabel="默认值" name="defaultValue" width="165"/>
			</@bravo.FieldSet>
		</@bravo.FormPanel>
    </@bravo.Viewport>
</@bravo.Page>

