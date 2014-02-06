<@bravo.Page name="hadoopNodeView" title="节点查看" cache="false">
	<@bravo.Viewport  layout="border">
		<@bravo.FormPanel name="hadoopNodeForm" region="center" border="false"  tbar="toolBar" frame="true" autoScroll="true" height="160"  collapsible="false"   dataProxy="./hadoopNode!saveAndRendJsonData.action?id=%{formValue.id?c}" width="820"   labelWidth="100"> 
			<@bravo.Toolbar name="toolBar" valign="top">
				<@bravo.Button name="Save" tooltip="'保存'" text="保存" iconCls="add" handler="ajaxSubmitForm(\\'hadoopNodeForm\\')"/>
			</@bravo.Toolbar>
			<@bravo.FieldSet cols="2;1,1;1,1;1,1;1,1;1,1;2" rows="1;1,1;1,1;1,1;1,1;1,1;1" >
				<@bravo.TextField fieldLabel="名称" name="name" allowBlank="false" width="550"/>
				<@bravo.TextField fieldLabel="机器名" name="hostName"  width="165"/>
				<@bravo.TextField fieldLabel="IP" name="hostIP" allowBlank="false" width="165"/>
				<@bravo.TextField fieldLabel="root id" name="rootId" allowBlank="false" width="165" value="root"/>  
				<@bravo.TextField fieldLabel="root密码" name="rootPassword" allowBlank="false" width="165"   inputType="password"/> 
				<@bravo.TextField fieldLabel="hadoop id" name="hadoopId" width="165"   value="hadoop"/>  
				<@bravo.TextField fieldLabel="hadoop 密码" name="hadoopPassword"  width="165"  inputType="password"/>
				<@bravo.ComboBox name="nodeType.id" fieldLabel="类型" editable="false"  dataProxy="hql[from Enumeration where enumType.id=15]" displayField="name" valueField="id"  allowBlank="false"  />
				<@bravo.ComboBox name="operationSystem.id" fieldLabel="操作系统" editable="false"  dataProxy="hql[from Enumeration where enumType.id=17]" displayField="name" valueField="id"  allowBlank="false"  />
				<@bravo.ComboBox name="hadoopVersion.id" fieldLabel="版本号" editable="false"  dataProxy="hql[from Enumeration where enumType.id=18]" displayField="name" valueField="id"  allowBlank="false"  />
				<@bravo.ComboBox name="nameNode.id" fieldLabel="名称节点" editable="false"  dataProxy="hql[from HadoopNode where nodeType.id=27]" displayField="name" valueField="id"  />
				<@bravo.TextField fieldLabel="Hadoop安装路径" name="installPath" allowBlank="false" width="550" /> 
			</@bravo.FieldSet>
		</@bravo.FormPanel>

<!--如果是名称节点-->
<#if formValue.nodeType.id==27>
		<@bravo.TabPanel activeTab="0" region="south" name="tab" height="250" collapsible="true">
			<@bravo.GridPanel title="数据节点列表" name="dataNodeGrid" dataProxy="./hadoopNode!findAndRendJsonData.action?nameNode.id=%{formValue.id?c}"  contextDataName="users">	  
				<@bravo.Column  hidden="true" name="id" header="ID" width="10"  sortable="true" />
			       <@bravo.Column  name="name" header="节点名"  width="175"  sortable="true" resizable="true"     />
			       <@bravo.Column  name="hostName" header="计算机名" width="175"  sortable="true" resizable="true" />     
				 <@bravo.Column name="nameNode.name" header="对应NameNode" width="175"  sortable="true"  resizable="true"     />
				 <@bravo.Column name="nodeType.name" header="节点类型" width="175"  sortable="true"  resizable="true"     />
			</@bravo.GridPanel>
		</@bravo.TabPanel>
</#if>
	</@bravo.Viewport>
</@bravo.Page>
