<@bravo.Page name="EnumerationTypeManager" title="基础数据管理">
	<@bravo.Viewport  layout="border">
		    <@bravo.FormPanel name="enumeration_find" tbar="Toolbar" region="north"  frame="true" autoScroll="true" height="130" width="750"   title="基础数据查询列表" >  
			<@bravo.Toolbar name="Toolbar" valign="top">
				<@bravo.Button name="View" text="查询" iconCls="search" handler="searchForGrid(\\'enumeration_find\\',\\'enumeration_grid\\')"/>
				<@bravo.Button text="重置" iconCls="reset" handler="resetForm(\\'enumeration_find\\')"/>
			</@bravo.Toolbar>
				<@bravo.FieldSet  cols="1,1" rows="1,1" >		
					<@bravo.TextField fieldLabel="名称" fieldName="name" width="160"/>
					<@bravo.TextField fieldLabel="编码" fieldName="code" width="160"/>
				</@bravo.FieldSet>
			 </@bravo.FormPanel>    

			 <@bravo.GridPanel  region="center" tbar="Toodddlbar" name="enumeration_grid"  contextDataName="enumerations" stripeRows="true"  dataProxy="./chooseHadoopVersion!findAndRendJsonData.action?enumType.id=18"  collapsible="true" split="true" >
			     <@bravo.Toolbar name="Toodddlbar" valign="top" >
				 <@bravo.Button name="Add" text="新增" iconCls="add" handler="gridOpenNewWin(\\'./chooseHadoopVersion!add.action\\',\\'新增hadoop版本号\\',\\'enumeration_grid\\')"/>
				 <@bravo.Button name="Delete" text="删除" iconCls="delete" handler="grid_doDel(\\'./chooseHadoopVersion!batchRemove.action\\',\\'enumeration_grid\\')"/>
			     </@bravo.Toolbar>               
			     <@bravo.Column hidden="true" name="id" header="ID" width="0"  sortable="true"  resizable="true"     />
			     <@bravo.Column  name="code" header="编码"  width="175"  sortable="true" resizable="true"     />
                             <@bravo.Column name="name" header="名称" width="175"  sortable="true" resizable="true" /> 
                             <@bravo.Column name="comments" header="描述" width="175"  sortable="true"  resizable="true"     />
	                </@bravo.GridPanel>

    </@bravo.Viewport>
</@bravo.Page>
