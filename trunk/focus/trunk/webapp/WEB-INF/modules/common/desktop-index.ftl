<@bravo.Page name="sds"    title="BRAVO open platform">
	<@bravo.Viewport  layout="border">
		<@bravo.Panel name="Pnorth" region="north" height="66" border="false" innerHtml="<div id='Pnorth_div'  class='headpanel'><img alt='logo' src='../logo.gif'/></div>">
			<@bravo.Toolbar valign="right">
				<@bravo.Menu text ="工作导航" iconCls="" hidden="true" menuId="10003"/>
				<@bravo.Menu text ="流程管理" iconCls="" hidden="true" menuId="10002"/>
				<@bravo.Menu text ="系统管理" iconCls="" hidden="true" menuId="10001"/>
				<@bravo.Menu text ="数据统计" iconCls="" hidden="true" menuId="10004"/>
				<@bravo.Fill/>
				<@bravo.Menu text ="个人设置"  iconCls="profile" >
			     	<@bravo.Menu text ="test"  handler="doRemote()"/>
					<@bravo.Menu text ="恢复个人设置"  iconCls="recover" handler="loadUserProfileCookie()"/>
					<@bravo.Menu text ="保存个人设置"  iconCls="favorite" handler="saveUserProfileCookie()"/>
					<#----
					<@bravo.Menu text ="Cookie  调试"  iconCls="debug" handler="alert(document.cookie)"/>
					<@bravo.Menu text ="session 过期"  iconCls="overdue" handler="sessionExpired()"/>
					---->
					<@bravo.Menu text ="快捷菜单设置"  iconCls="shortcut" handler="openUserProfileWin()"/>
					<@bravo.Menu text ="更换皮肤"  iconCls="changeskin">					
						<@bravo.Menu text ="青涩年华"  iconCls="greenskin" handler="changeCss(\\'xtheme-green.css\\')"/>
						<@bravo.Menu text ="黑色物语"  iconCls="blackskin" handler="changeCss(\\'xtheme-darkgray.css\\')"/>
						<@bravo.Menu text ="银色舞台"  iconCls="grayskin" handler="changeCss(\\'xtheme-gray.css\\')"/>
						<@bravo.Menu text ="蜜桃清香"  iconCls="pepperskin" handler="changeCss(\\'xtheme-peppermint.css\\')"/>
						<@bravo.Menu text ="深紫诱惑"  iconCls="pinkskin" handler="changeCss(\\'xtheme-pink.css\\')"/>
						<@bravo.Menu text ="幽兰月影"  iconCls="purpleskin" handler="changeCss(\\'xtheme-purple.css\\')"/>
						<@bravo.Menu text ="岩灰古朴"  iconCls="slateskin" handler="changeCss(\\'xtheme-slate.css\\')"/>
						<@bravo.Menu text ="原味经典"  iconCls="blueskin" handler="changeCss(\\'\\')"/>
					</@bravo.Menu>					
				</@bravo.Menu>
				<@bravo.Button tooltip="'退出'" text="退出登陆" iconCls="doorout" handler="loginOut()"/>
				</@bravo.Toolbar>
		</@bravo.Panel>
   <@bravo.Panel title="${requestHandler.currentUser.userName?default('')}, 您好!" iconCls="logininskin" split="true" width="200" collapsible="true" name="pWest" region="west" margins="0 0 0 5" constrainHeader="true" layout="accordion" collapseMode="mini" border="false" autoScroll="true" animCollapse="false">
		<@bravo.Panel      title="快捷菜单"                region="west"              border="false" draggable="false" autoLoad="../common/profileMenu!viewProfileMenu.action"/>
		<@bravo.TreePanel  title="工作导航" text="工作导航" region="west" innerHtml="" border="false" draggable="false" margins="0 0 0 5" dataProxy="../common/menuFunction!viewTree.action" contextData="treeData" nodeId="10003" />
		<@bravo.TreePanel  title="Hadoop集群管理" text="Hadoop集群管理" region="west" innerHtml="" border="false" draggable="false" margins="0 0 0 5" dataProxy="../common/menuFunction!viewTree.action" contextData="treeData" nodeId="10002" />
		<@bravo.TreePanel  title="Hadoop文件管理" text="Hadoop文件管理" region="west" innerHtml="" border="false" draggable="false" margins="0 0 0 5" dataProxy="../hdfs/filesTree!getClusterTree.action" contextData="treeData"  nodeId="10007"/>
		<@bravo.TreePanel  title="系统管理" text="系统管理" region="west" innerHtml="" border="false" draggable="false" margins="0 0 0 5" dataProxy="../common/menuFunction!viewTree.action" contextData="treeData" nodeId="10001" />
		<@bravo.TreePanel  title="数据统计" text="数据统计" region="west" innerHtml="" border="false" draggable="false" margins="0 0 0 5" dataProxy="../common/menuFunction!viewTree.action" contextData="treeData" nodeId="10004" />
    </@bravo.Panel>
	<@bravo.TabPanel name="deskPanel" region="center" deferredRender="false" activeTab="0"> 
		<@bravo.Portal  region="center" margins="35 5 5 0" name="center" title="我的桌面"> 
			<@bravo.PortalColumn columnWidth=".33" name="portal1" title="portal1" style="padding:10px 0 10px 10px"> 
				<@bravo.Portlet autoLoad="../common/notice!viewNotice.action" title="产品成本分布图"/> 
			</@bravo.PortalColumn>
			<@bravo.PortalColumn columnWidth=".33" title="portal2" style="padding:10px 0 10px 10px"> 
				<@bravo.Portlet autoLoad="../common/notice!viewNotice.action"  name="portal21" title="服务器本周负载明细"/> 
			</@bravo.PortalColumn>
			<@bravo.PortalColumn columnWidth=".33" title="portal3" style="padding:10px 0 10px 10px"> 
				<@bravo.Portlet autoLoad="../common/notice!viewNotice.action" title="当日网络负载明细"/> 
			</@bravo.PortalColumn>
			<@bravo.PortalColumn height="130" columnWidth=".33" title="porta21" style="padding:10px 0 10px 10px"> 
				<@bravo.Portlet height="120" autoLoad="../common/news!viewNews.action" title="新闻"/> 
			</@bravo.PortalColumn>
			<@bravo.PortalColumn height="130" columnWidth=".33" title="porta22" style="padding:10px 0 10px 10px"> 
				<@bravo.Portlet height="120" autoLoad="../common/notice!viewNotice.action" title="公告"/> 
			</@bravo.PortalColumn>
			<@bravo.PortalColumn columnWidth=".33" title="porta31" style="padding:10px 0 10px 10px"> 
				<@bravo.Portlet html="../report/depthAreaChart!chart.action" title="说明"/> 
			</@bravo.PortalColumn>
		</@bravo.Portal>	
		<@bravo.Portal title="待办工作" region="center" border="false" />
	</@bravo.TabPanel>
    </@bravo.Viewport>
</@bravo.Page>

<script type="text/javascript">
window.onload = function() {
  dwr.engine.setActiveReverseAjax(true);
}
function doRemote()   
{   
  Remote.getFlightInfo();//获取信息
}   

function receiveMessages(id)   
{   

   var win=new Ext.Window({title:"窗口"+id++,
	width:400,
	height:300,
	modal:true,
	maximizable:true
	});
	win.show();
}


	//设置当前页面每隔30秒定时执行一次checkSession()函数，用于定时侦查当前页面与服务器的会话是否过期
	setInterval("checkSession()",30000);

</script>
