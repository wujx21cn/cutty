<@bravo.Page name="configItemTemplate_add" title="新增配置项模板">
	<@bravo.Viewport  layout="border">
		<@bravo.FormPanel name="configItemTemplateAddForm" region="center" border="false" width="800" tbar="toolBar"  dataProxy="./configItemTemplate!saveAndRendJsonData.action">  
			<@bravo.Toolbar name="toolBar" valign="bottom">
				<@bravo.Button name="Save" tooltip="'保存'" text="保存" iconCls="add" handler="ajaxSubmitForm(\\'configItemTemplateAddForm\\')"/>
			</@bravo.Toolbar>
                         <@bravo.FieldSet  labelWidth="80"  cols="1,1;1,1;1,1;2" rows="1,1;1,1;1,1;1" >		
					<@bravo.TextField fieldLabel="名称" name="name" width="200" allowBlank="false" />
					<@bravo.TextField fieldLabel="编码" name="code" width="200" allowBlank="false" />
					<@bravo.ComboBox fieldLabel="所属配置文件" name="configFileTemplate.id" allowBlank="false" editable="false" dataProxy="hql[from ConfigFileTemplate]" displayField="name" valueField="id" />
					<@bravo.Checkbox fieldLabel="是否final" name="finalled" width="165" inputValue="true" value="%{formVaue.finalled}" checked="%{formVaue.finalled}"/>
					<@bravo.Checkbox fieldLabel="是否默选" name="choosed" width="165" inputValue="true" value="%{formVaue.choosed}" checked="%{formVaue.choosed}"/>
					<@bravo.TextField fieldLabel="默认值" name="defaultValue" width="165"/>
					<@bravo.TextArea fieldLabel="描述" name="comments" width="600" height="120"/>
			</@bravo.FieldSet>
			<@bravo.Hidden fieldLabel="id" name="id"  readOnly="true" value="%{formValue.id?c}" />
		</@bravo.FormPanel>
		<@bravo.TabPanel activeTab="0" region="south" name="tab" height="250" split="true" collapsible="true">
			<@bravo.GridPanel title="对应Hadoop版本列表" tbar="hadoopVersionToolBar" name="hadoopVersionGrid" dataProxy="./configItemTemplate!getRelatedHadoopVersions.action?id=%{formValue.id?c}"  contextDataName="hadoopVersions">
				<@bravo.Toolbar name="hadoopVersionToolBar" valign="top">	
					<@bravo.M2MSelectButton text="选择添加Hadoop版本" iconCls="add" targetProxy="./chooseHadoopVersion!query.action?enumType.id=18" targetGridName="enumeration_grid" originGridName="hadoopVersionGrid" entityName="ConfigItemTemplate" fieldName="hadoopVersions" entityId="%{formValue.id?c}"/>
					<@bravo.M2MRemoveButton text="删除Hadoop版本" iconCls="delete" originGridName="hadoopVersionGrid" entityName="ConfigItemTemplate" fieldName="hadoopVersions" entityId="%{formValue.id?c}"/>
				</@bravo.Toolbar>			  
				<@bravo.Column  hidden="true" name="id" header="ID" width="10"  sortable="true" />
				<@bravo.Column name="name" header="名称" width="100" sortable="true" />
				<@bravo.Column name="comments" header="备注" width="400"  sortable="true"/>
			</@bravo.GridPanel>
		</@bravo.TabPanel>
    </@bravo.Viewport>
</@bravo.Page>

