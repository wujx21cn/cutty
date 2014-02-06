<@bravo.Page name="configFile_add" title="新增ConfigFile">
	<@bravo.Viewport  layout="border">
		<@bravo.FormPanel name="configFileAddForm" region="center" border="false" width="800" tbar="toolBar"  dataProxy="./configFile!saveAndRendJsonData.action">  
			<@bravo.Toolbar name="toolBar" valign="bottom">
				<@bravo.Button name="Save" tooltip="'保存'" text="保存" iconCls="add" handler="ajaxSubmitForm(\\'configFileAddForm\\')"/>
			</@bravo.Toolbar>
                         <@bravo.FieldSet cols="1;1" rows="1;1" >		
					<@bravo.ComboBox fieldLabel="" name="configFileTemplateId.id" allowBlank="false" editable="false" dataProxy="hql[from Enumeration]" displayField="id" valueField="id" />
					<@bravo.ComboBox fieldLabel="" name="hadoopClusterId.id" allowBlank="false" editable="false" dataProxy="hql[from Enumeration]" displayField="id" valueField="id" />
			</@bravo.FieldSet>
		</@bravo.FormPanel>
    </@bravo.Viewport>
</@bravo.Page>

