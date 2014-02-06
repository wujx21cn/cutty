<@bravo.Page name="configItem_add" title="新增ConfigItem">
	<@bravo.Viewport  layout="border">
		<@bravo.FormPanel name="configItemAddForm" region="center" border="false" width="800" tbar="toolBar"  dataProxy="./configItem!saveAndRendJsonData.action">  
			<@bravo.Toolbar name="toolBar" valign="bottom">
				<@bravo.Button name="Save" tooltip="'保存'" text="保存" iconCls="add" handler="ajaxSubmitForm(\\'configItemAddForm\\')"/>
			</@bravo.Toolbar>
                         <@bravo.FieldSet cols="1;1;1;1" rows="1;1;1;1" >		
					<@bravo.TextField fieldLabel="" name="value" width="165"/>
					<@bravo.ComboBox fieldLabel="" name="configItemTemplateId.id" allowBlank="false" editable="false" dataProxy="hql[from Enumeration]" displayField="id" valueField="id" />
					<@bravo.ComboBox fieldLabel="" name="configFileId.id" allowBlank="false" editable="false" dataProxy="hql[from Enumeration]" displayField="id" valueField="id" />
					<@bravo.TextField fieldLabel="" name="isFinal" width="165"/>
			</@bravo.FieldSet>
		</@bravo.FormPanel>
    </@bravo.Viewport>
</@bravo.Page>

