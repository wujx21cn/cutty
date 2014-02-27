<@bravo.Page name="configFile_add" title="新增ConfigFile">
	<@bravo.Viewport  layout="border">
		<@bravo.FormPanel name="configFileAddForm" region="center" border="false" width="300" tbar="toolBar"  dataProxy="./configFile!saveConfigFileAndRendJsonData.action">  
			<@bravo.Toolbar name="toolBar" valign="bottom">
				<@bravo.Button name="Save" tooltip="'保存'" text="保存" iconCls="add" handler="addConfigFileSubmitForm(\\'configFileAddForm\\')"/>
			</@bravo.Toolbar>
					<@bravo.ComboBox fieldLabel="文件名"  name="configFileTemplate.id"   dataProxy="list[toBeAddedFileTemplates]" displayField="name" valueField="id" allowBlank="false" editable="false"/>
					<@bravo.TextField fieldLabel="文件路径" name="location" width="500"  allowBlank="false" />
					<@bravo.Hidden fieldLabel="id" name="hadoopCluster.id"  readOnly="true" value="%{formValue.id?c}" />
		</@bravo.FormPanel>
    </@bravo.Viewport>
    

  <@bravo.Script>

  var configFileTemplateArrayData = [
<#list toBeAddedFileTemplates as toBeAddedFileTemplate>
<#if toBeAddedFileTemplate_index != 0>,</#if>['${toBeAddedFileTemplate.id}','${toBeAddedFileTemplate.location}']
</#list>
]; 
configFileTemplate___id.addListener('change', function(box, newv, oldv) {
	for (var i=0;i<configFileTemplateArrayData.length;i++)
	{
		if (newv == configFileTemplateArrayData[i][0]) {
			location.setValue(configFileTemplateArrayData[i][1] );
		}
	}
    });

  </@bravo.Script>
</@bravo.Page>
<script language="javascript">

function addConfigFileSubmitForm(formName)
{    
    var formPanel = Ext.getCmp(formName); 
	if(formPanel.form.isValid()){
              formPanel.form.doAction('submit', {
                   url : formPanel.dataProxy,
                   method : 'post',
		           params : {jsonFormData:'Y'},
			  success : function(form, action) {
				    Ext.MessageBox.show({
				   title:'保存成功',
				   msg: '是否关闭该当前窗口',
				   buttons: {yes:'是', no:'否'},
				   fn: function(btn) {addConfigFileCloseWin(btn)},
				   icon: Ext.MessageBox.QUESTION
			       });  
		      },
		      failure : function(form, action) {
		              Ext.Msg.alert('错误',action.result.msg);
                        }
                    });
      }else{
    	Ext.Msg.alert('提示', '红色波浪线标识为必填信息，请完成');
	}
}

function  addConfigFileCloseWin(btn){
	if (btn == 'yes') {
	 var clusterNewConfigWin = parent.Ext.getCmp('clusterNewConfigWinID'); 
	 if(clusterNewConfigWin!=undefined){
        clusterNewConfigWin.close();
	 }
	}     
	else if(btn == 'no') {
      return;
	}
}
</script>


