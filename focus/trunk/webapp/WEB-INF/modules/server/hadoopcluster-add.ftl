<@bravo.Page name="hadoopCluster_add" title="新增HadoopCluster">
	<@bravo.Viewport  layout="border">
		<@bravo.FormPanel name="hadoopClusterAddForm" region="center" border="false" width="800" tbar="toolBar"  dataProxy="./hadoopCluster!saveAndRendJsonData.action">  
			<@bravo.Toolbar name="toolBar" valign="bottom">
				<@bravo.Button name="Save" tooltip="'保存'" text="保存" iconCls="add" handler="ajaxSubmitForm(\\'hadoopClusterAddForm\\')"/>
			</@bravo.Toolbar>
                         <@bravo.FieldSet cols="2;1,1;2" rows="1;1,1;1" >		
					<@bravo.TextField fieldLabel="名称" allowBlank="false" name="name" width="600"/>
					<@bravo.ComboBox fieldLabel="版本号" name="hadoopVersion.id" allowBlank="false" editable="false" dataProxy="hql[from Enumeration where enumType.id=18]" displayField="name" valueField="id" />
					<@bravo.ComboBox fieldLabel="名称节点" name="nameNode.id" allowBlank="false" editable="false" dataProxy="hql[from HadoopNode where nodeType.id=27]" displayField="name" valueField="id" />
					<@bravo.TextArea fieldLabel="描述" name="comments" width="600" height="120"/>
			</@bravo.FieldSet>
		</@bravo.FormPanel>
    </@bravo.Viewport>
</@bravo.Page>

