<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">       
    <title>Hadoop集群文件管理</title>
    <script type="text/javascript" src="/focus/ui/dynamicJs!CreateDynamicJs.action"></script>   
    <LINK href="${bravoHome}/${extjsWidgetPath}/resources/css/ext-all.css" type="text/css" rel="stylesheet">    
    <LINK href="" type="text/css" rel="stylesheet">    
    <script type="text/javascript" src="${bravoHome}/${extjsWidgetPath}/adapter/ext/ext-base.js"></script> 
    <script type="text/javascript" src="${bravoHome}/${extjsWidgetPath}/ext-all.js"></script>      
    <script type="text/javascript" src="${bravoHome}/${extjsWidgetPath}/source/locale/ext-lang-zh_CN.js"></script>   

    <script type="text/javascript" src="${bravoHome}/${extjsWidgetPath}/ux/extjs-bravo-ux.js"></script>
    <link rel="stylesheet" type="text/css" href="${bravoHome}/${extjsWidgetPath}/extjs-bravo.css" /> 
    <script type="text/javascript" src="${bravoHome}/${extjsWidgetPath}/extjs-bravo.js"></script>  
    <link rel="stylesheet" type="text/css" href="${bravoHome}/${extjsWidgetPath}/ux/extjs-bravo-ux.css"/>

	<script type='text/javascript' src='/focus/dwr/interface/Remote.js'></script>  
    <script type='text/javascript' src='/focus/dwr/engine.js'></script>  
    <script type='text/javascript' src='/focus/dwr/util.js'></script>  
	<script type='text/javascript' src='${bravoHome}/${extjsWidgetPath}/ux/Ext.ux.LocationBar.js'></script>  
	<link rel="stylesheet" type="text/css" href="${bravoHome}/${extjsWidgetPath}/ux/LocationBar.css" /> 
	<script type='text/javascript' src='${bravoHome}/${extjsWidgetPath}/ux/ext-statusbar.js'></script>  
	
</head>    
    <body> 
	<div id="locationbar-panel"></div>
	<div id="item-grid"></div>
	<div id="ext_statusbar" class="ext_statusbar"></div>
</div>
    </body>
</html>
<script language="javascript">
var datastore;
function chDir( directory, loadGridOnly ) {
		alert("chDir"+directory);
    	if( datastore.directory.replace( /\//g, '' ) == directory.replace( /\//g, '' )
    		&& datastore.getTotalCount() > 0 && directory != '') {
    		// Prevent double loading
    		return false;
    	}
    	datastore.directory = directory;
    	var conn = datastore.proxy.getConnection();
    	if( directory == '' || conn && !conn.isLoading()) {
    		datastore.load({params:{start:0, limit:150, dir: directory, option:'com_extplorer', action:'getdircontents', sendWhat: datastore.sendWhat }});
    	}
		/*
		Ext.Ajax.request({
			url: '<?php echo basename( $GLOBALS['script_name']) ?>',
			params: { action:'chdir_event', dir: directory, option: 'com_extplorer' },
			callback: function(options, success, response ) {
				if( success ) {
					checkLoggedOut( response ); // Check if current user is logged off. If yes, Joomla! sends a document.location redirect, which will be eval'd here
					var result = Ext.decode( response.responseText );						
					document.title = 'eXtplorer - ' + datastore.directory;
					Ext.get('bookmark_container').update( result.bookmarks );
				}
			}
		});

	    if( !loadGridOnly ) {
			expandTreeToDir( null, directory );
    	}*/
	}

	    function handleNodeClick( node ) {
    	if( node && node.id ) {
    		chDir( node.id.replace( /_RRR_/g, '/' ) );
    	}
    } 

Ext.onReady(
  function(){
    Ext.QuickTips.init();
    Ext.state.Manager.setProvider(new Ext.state.CookieProvider());


    datastore = new Ext.data.Store({
        proxy: new Ext.data.HttpProxy({
            url: "../hdfs/fileExplorer!listFiles.action",
            directory: "/",
            params:{start:0, limit:150, dir: this.directory, option:"com_extplorer", action:"getdircontents" }
        }),
		directory: "/",
		sendWhat: "both",
        // create reader that reads the File records
        reader: new Ext.data.JsonReader({
            root: "items",
            totalProperty: "totalCount"
        }, Ext.data.Record.create([
            {name: "name"},
            {name: "size"},
            {name: "type"},
            {name: "modified"},
            {name: "perms"},
            {name: "icon"},
            {name: "owner"},
            {name: "is_deletable"},
            {name: "is_file"},
            {name: "is_archive"},
            {name: "is_writable"},
            {name: "is_chmodable"},
            {name: "is_readable"},
            {name: "is_deletable"},
            {name: "is_editable"}
        ])),

        // turn on remote sorting
        remoteSort: true
    });
    datastore.paramNames["dir"] = "direction";
    datastore.paramNames["sort"] = "order";
    
    datastore.on("beforeload", function(ds, options) {
    								options.params.dir = options.params.dir ? options.params.dir : ds.directory;
    								options.params.option = "com_extplorer";
    								options.params.action = "getdircontents";
    								options.params.sendWhat = datastore.sendWhat;    								
    								}
    							 );
    // pluggable renders
    function renderFileName(value,p, record){
        var t = new Ext.Template("<img src=\"{0}\" alt=\"* \" align=\"absmiddle\" />&nbsp;<b>{1}</b>");
        return t.apply([record.get('icon'), value] );
    }
    function renderType(value){
        var t = new Ext.Template("<i>{0}</i>");
        return t.apply([value]);
    }			
	    var gridtb = new Ext.Toolbar([
                         	{
                             	xtype: "tbbutton",
                         		id: 'tb_home',
                         		icon: '../images/hadoop/_home.png',
                         		text: '集群根目录',
                         		tooltip: '集群根目录',
                         		cls:'x-btn-text-icon',
                         		handler: function() {chDir('') }
                         	},
                            {
                         		xtype: "tbbutton",
                         		id: 'tb_reload',
                              	icon: '../images/hadoop/_reload.png',
                              	text: '刷新',
                            	tooltip: '刷新',
                              	cls:'x-btn-text-icon',
                              	handler: function() {alert('okok') }
                            },
                           {
                              		xtype: "tbbutton",
                             		id: 'tb_search',
                              		icon: '../images/hadoop/_filefind.png',
                              		text: '搜索',
                              		tooltip: '搜索',
                              		cls:'x-btn-text-icon',
                              		handler: function() {alert('okok') ; }
                              	},
                                                        '-',
                            {
                            	xtype: "tbbutton",
                         		id: 'tb_new',
                              		icon: '../images/hadoop/_filenew.png',
                              		tooltip: 'New File/Directory',
                              		cls:'x-btn-icon',
                              		disabled: false,
                              		handler: function() {alert('okok') ; }
                              	},
                              	{
                              		xtype: "tbbutton",
                             		id: 'tb_edit',
                              		icon: '../images/hadoop/_edit.png',
                              		tooltip: '编辑',
                              		cls:'x-btn-icon',
                              		disabled: false,
                              		handler: function() {alert('okok') ; }
                              	},
                              	{
                              		xtype: "tbbutton",
                             		id: 'tb_copy',
                              		icon: '../images/hadoop/_editcopy.png',
                              		tooltip: '复制',
                              		cls:'x-btn-icon',
                              		disabled: false,
                              		handler: function() {alert('okok') }
                              	},
                              	{
                              		xtype: "tbbutton",
                             		id: 'tb_move',
                              		icon: '../images/hadoop/_move.png',
                              		tooltip: '移动',
                              		cls:'x-btn-icon',
                              		disabled: false,
                              		handler: function() {alert('okok') }
                              	},
                              	{
                              		xtype: "tbbutton",
                             		id: 'tb_delete',
                              		icon: '../images/hadoop/_editdelete.png',
                              		tooltip: '删除',
                              		cls:'x-btn-icon',
                              		disabled: false,
                              		handler: function() {alert('okok') }
                              	},
                              	{
                              		xtype: "tbbutton",
                             		id: 'tb_rename',
                              		icon: '../images/hadoop/_fonts.png',
                              		tooltip: '重命名',
                              		cls:'x-btn-icon',
                              		disabled: false,
                              		handler: function() {alert('okok') }
                              	},
                              	{
                              		xtype: "tbbutton",
                             		id: 'tb_chmod',
                              		icon: '../images/hadoop/_chmod.png',
                              		tooltip: '改变 (chmod) 权限 (目录/文件)',
                              		cls:'x-btn-icon',
                              		disabled: false,
                              		handler:function() {alert('okok') }
                              	},
                              	'-',
                              	{
                              		xtype: "tbbutton",
                             		id: 'tb_view',
                              		icon: '../images/hadoop/_view.png',
                              		tooltip: '查看',
                              		cls:'x-btn-icon',
                              		handler:function() {alert('okok') }
                              	},
                              	{
                              		xtype: "tbbutton",
                             		id: 'tb_diff',
                              		icon: '../images/hadoop/extension/document.png',
                              		tooltip: 'difflink',
                              		cls:'x-btn-icon',
                              		disabled: false,
                              		handler: function() {alert('okok') }
                              	},
                              	{
                              		xtype: "tbbutton",
                             		id: 'tb_download',
                              		icon: '../images/hadoop/_down.png',
                              		tooltip: '下载',
                              		cls:'x-btn-icon',
                              		disabled: false,
                              		handler: function() {alert('okok') }
                              	},
                              	'-',
                              	{
                              		xtype: "tbbutton",
                             		id: 'tb_upload',
                              		icon: '../images/hadoop/_up.png',
                              		tooltip: '上传',
                              		cls:'x-btn-icon',
                              		disabled: false,
                              		handler: function() { 
                                  		Ext.ux.OnDemandLoad.load("http://localhost/extplorer/scripts/extjs3-ext/ux.swfupload/SwfUploadPanel.css");
                              			Ext.ux.OnDemandLoad.load("http://localhost/extplorer/scripts/extjs3-ext/ux.swfupload/SwfUpload.js" );
                              			Ext.ux.OnDemandLoad.load("http://localhost/extplorer/scripts/extjs3-ext/ux.swfupload/SwfUploadPanel.js",
                              		    	function(options) { alert( 'upload'); }); 
                          		    }
                              	},
                              	{
                              		xtype: "tbbutton",
                             		id: 'tb_archive',
                              		icon: '../images/hadoop/_archive.png',
                              		tooltip: '压缩',
                          			cls:'x-btn-icon',
                          			handler: function() {alert('okok') }
                          			                              	},{
                              		xtype: "tbbutton",
                             		id: 'tb_extract',
                              		icon: '../images/hadoop/_extract.gif',
                              		tooltip: '解压缩',
                              		cls:'x-btn-icon',
                          			                              		handler:function() {alert('okok') }
                          			                          		},
                              	'-',
                          					
                            	new Ext.Toolbar.Button( {
                            		text: 'Show Directories',
                            		enableToggle: true,
                            		pressed: true,
                            		handler: function(btn,e) { 
                            					if( btn.pressed ) {
                            						datastore.sendWhat= 'both';
                            						loadDir();
                            					} else {
                            						datastore.sendWhat= 'files';
                            						loadDir();
                            					}
                            			}
                            	}), '-',
                            	new Ext.form.TextField( { 
                                	name: "filterValue", 
                                	id: "filterField",
                                	enableKeyEvents: true,
                                	title: "Filter",
                            		listeners: { 
                            			"keypress": { fn: 	function(textfield, e ) {
					                            		    	if( e.getKey() == Ext.EventObject.ENTER ) {
					                            		    		filterDataStore();
					                            		    	}
	                            							}
                            						}
                            		}
                                }),
                            	new Ext.Toolbar.Button( {
                            		text: '&nbsp;X&nbsp;',
                            	handler: function() { 
                                	datastore.clearFilter();
                                	Ext.getCmp("filterField").setValue(""); 
                                	}
                            	})

                            ]);  
    function filterDataStore(btn,e) { 
		var filterVal = Ext.getCmp("filterField").getValue();
		if( filterVal.length > 1 ) {
			datastore.filter( 'name', eval('/'+filterVal+'/gi') );
		} else {
			datastore.clearFilter();
		}
	}
   // add a paging toolbar to the grid's footer
   
    var gridbb = new Ext.PagingToolbar({
        store: datastore,
        pageSize: 150,
        displayInfo: true,
        displayMsg: 'Displaying Items {0} - {1} of {2}',
        emptyMsg: 'No items to display',
        beforePageText: 'Page',
		afterPageText: 'of {0}',
		firstText: 'First Page',
		lastText: 'Last Page',
		nextText: 'Next Page',
		prevText: 'Previous Page',
		refreshText: '刷新',
		items: ['-',' ',' ',' ',' ',' ',
			new Ext.ux.StatusBar({
			    defaultText: 'Done.',
			    id: 'statusPanel'
			})]
    });	

    var cm = new Ext.grid.ColumnModel({
		columns: [{
           id: 'gridcm', // id assigned so we can apply custom css (e.g. .x-grid-col-topic b { color:#333 })
           header: "名称",
           dataIndex: 'name',
           width: 250,
		   sortable: true,
           renderer: renderFileName,
           editor: new Ext.form.TextField({
					allowBlank: false
				}),
           css: 'white-space:normal;'
        },{
           header: "大小",
           dataIndex: 'size',
           width: 50,
		   sortable: true
        },{
           header: "类型",
           dataIndex: 'type',
           width: 70,
		   sortable: true,
           align: 'right',
           renderer: renderType
        },{
           header: "最后更新",
           dataIndex: 'modified',
           width: 150,
		   sortable: true
        },{
           header: "权限",
           dataIndex: 'perms',
           width: 100,
		   sortable: true
        },{
           header: "所有者",
           dataIndex: 'owner',
           width: 100,
           sortable: false
        }, 
        { dataIndex: 'is_deletable', header: "is_deletable", hidden: true, hideable: false },
        {dataIndex: 'is_file', hidden: true, hideable: false },
        {dataIndex: 'is_archive', hidden: true, hideable: false },
        {dataIndex: 'is_writable', hidden: true, hideable: false },
        {dataIndex: 'is_chmodable', hidden: true, hideable: false },
        {dataIndex: 'is_readable', hidden: true, hideable: false },
        {dataIndex: 'is_deletable', hidden: true, hideable: false },
        {dataIndex: 'is_editable', hidden: true, hideable: false }],
	defaults: {
		sortable: true
		}
        });


    // Unregister the default double click action (which makes the name field editable - we want this when the user clicks "Rename" in the menu)
    //ext_itemgrid.un('celldblclick', ext_itemgrid.onCellDblClick);
    
    function handleRowClick(sm, rowIndex) {
    	var selections = sm.getSelections();
    	tb = ext_itemgrid.getTopToolbar();
    	if( selections.length > 1 ) {
    		tb.items.get('tb_edit').disable();
    		tb.items.get('tb_delete').enable();
    		tb.items.get('tb_rename').disable();
    		tb.items.get('tb_chmod').enable();
    		tb.items.get('tb_download').disable();
    		tb.items.get('tb_extract').disable();
    		tb.items.get('tb_archive').enable();
    		tb.items.get('tb_view').enable();
    	} else if(selections.length == 1) {
    		tb.items.get('tb_edit')[selections[0].get('is_editable')&&selections[0].get('is_readable') ? 'enable' : 'disable']();
    		tb.items.get('tb_delete')[selections[0].get('is_deletable') ? 'enable' : 'disable']();
    		tb.items.get('tb_rename')[selections[0].get('is_deletable') ? 'enable' : 'disable']();
    		tb.items.get('tb_chmod')[selections[0].get('is_chmodable') ? 'enable' : 'disable']();
    		tb.items.get('tb_download')[selections[0].get('is_readable')&&selections[0].get('is_file') ? 'enable' : 'disable']();
    		tb.items.get('tb_extract')[selections[0].get('is_archive') ? 'enable' : 'disable']();
    		tb.items.get('tb_archive').enable();
    		tb.items.get('tb_view').enable();
    	} else {
			tb.items.get('tb_edit').disable();
    		tb.items.get('tb_delete').disable();
    		tb.items.get('tb_rename').disable();
    		tb.items.get('tb_chmod').disable();
    		tb.items.get('tb_download').disable();
    		tb.items.get('tb_extract').disable();
    		tb.items.get('tb_view').disable();
    		tb.items.get('tb_archive').disable();
    	}
    	return true;
    }

    // trigger the data store load
    function loadDir() {
    	datastore.load({params:{start:0, limit:150, dir: datastore.directory, option:'com_extplorer', action:'getdircontents', sendWhat: datastore.sendWhat }});
    }
   
    
    function rowContextMenu(grid, rowIndex, e, f) {
    	if( typeof e == 'object') {
    		e.preventDefault();
    	} else {
    		e = f;
    	}
    	gsm = ext_itemgrid.getSelectionModel();
    	gsm.clickedRow = rowIndex;
    	var selections = gsm.getSelections();
    	if( selections.length > 1 ) {
    		gridCtxMenu.items.get('gc_edit').disable();
    		gridCtxMenu.items.get('gc_delete').enable();
    		gridCtxMenu.items.get('gc_rename').disable();
    		gridCtxMenu.items.get('gc_chmod').enable();
    		gridCtxMenu.items.get('gc_download').disable();
    		gridCtxMenu.items.get('gc_extract').disable();
    		gridCtxMenu.items.get('gc_archive').enable();
    		gridCtxMenu.items.get('gc_view').enable();
    	} else if(selections.length == 1) {
    		gridCtxMenu.items.get('gc_edit')[selections[0].get('is_editable')&&selections[0].get('is_readable') ? 'enable' : 'disable']();
    		gridCtxMenu.items.get('gc_delete')[selections[0].get('is_deletable') ? 'enable' : 'disable']();
    		gridCtxMenu.items.get('gc_rename')[selections[0].get('is_deletable') ? 'enable' : 'disable']();
    		gridCtxMenu.items.get('gc_chmod')[selections[0].get('is_chmodable') ? 'enable' : 'disable']();
    		gridCtxMenu.items.get('gc_download')[selections[0].get('is_readable')&&selections[0].get('is_file') ? 'enable' : 'disable']();
    		gridCtxMenu.items.get('gc_extract')[selections[0].get('is_archive') ? 'enable' : 'disable']();
    		gridCtxMenu.items.get('gc_archive').enable();
    		gridCtxMenu.items.get('gc_view').enable();
    	}
		gridCtxMenu.show(e.getTarget(), 'tr-br?' );

    }
    gridCtxMenu = new Ext.menu.Menu({
    	id:'gridCtxMenu',
    
        items: [{
    		id: 'gc_edit',
    		icon: 'http://localhost/extplorer/images/_edit.png',
    		text: '编辑',
    		handler: function() { openActionDialog(this, 'edit'); }
    	},
    	{
    		id: 'gc_diff',
    		icon: 'http://localhost/extplorer/images/extension/document.png',
    		text: 'difflink',
    		handler: function() { openActionDialog(this, 'diff'); }
    	},
    	{
    		id: 'gc_rename',
    		icon: 'http://localhost/extplorer/images/_fonts.png',
    		text: '重命名',
    		handler: function() { ext_itemgrid.onCellDblClick( ext_itemgrid, gsm.clickedRow, 0 ); gsm.clickedRow = null; }
    	},
    	{
        	id: 'gc_copy',
    		icon: 'http://localhost/extplorer/images/_editcopy.png',
    		text: '复制',
    		handler: function() { openActionDialog(this, 'copy'); }
    	},
    	{
    		id: 'gc_move',
    		icon: 'http://localhost/extplorer/images/_move.png',
    		text: '移动',
    		handler: function() { openActionDialog(this, 'move'); }
    	},
    	{
    		id: 'gc_chmod',
    		icon: 'http://localhost/extplorer/images/_chmod.png',
    		text: '改变 (chmod) 权限 (目录/文件)',
    		handler: function() { openActionDialog(this, 'chmod'); }
    	},
    	{
    		id: 'gc_delete',
    		icon: 'http://localhost/extplorer/images/_editdelete.png',
    		text: '删除',
    		handler: function() { openActionDialog(this, 'delete'); }
    	},
    	'-',
    	{
    		id: 'gc_view',
    		icon: 'http://localhost/extplorer/images/_view.png',
    		text: '查看',
    		handler: function() { openActionDialog(this, 'view'); }
    	},
    	{
    		id: 'gc_download',
    		icon: 'http://localhost/extplorer/images/_down.png',
    		text: '下载',
    		handler: function() { openActionDialog(this,'download'); }
    	},
    	'-',
    		    	{
    			id: 'gc_archive',
	    		icon: 'http://localhost/extplorer/images/_archive.png',
	    		text: '压缩',
	    		handler: function() { openActionDialog(this, 'archive'); }
	    	},
	    	{
	    		id: 'gc_extract',
	    		icon: 'http://localhost/extplorer/images/_extract.gif',
	    		text: '解压缩',
	    		handler: function() { openActionDialog(this, 'extract'); }
	    	},
    	    	'-',
		{
			id: 'cancel',
    		icon: 'http://localhost/extplorer/images/_cancel.png',
    		text: '取消',
    		handler: function() { gridCtxMenu.hide(); }
    	}
    	]
    });
    	
	function dirContext(node, e ) {
		// Select the node that was right clicked
		node.select();
		// Unselect all files in the grid
		ext_itemgrid.getSelectionModel().clearSelections();
		
		dirCtxMenu.items.get('dirCtxMenu_rename')[node.attributes.is_deletable ? 'enable' : 'disable']();
		dirCtxMenu.items.get('dirCtxMenu_remove')[node.attributes.is_deletable ? 'enable' : 'disable']();
		dirCtxMenu.items.get('dirCtxMenu_chmod')[node.attributes.is_chmodable ? 'enable' : 'disable']();
		
		dirCtxMenu.node = node;
		dirCtxMenu.show(e.getTarget(), 't-b?' );
		
	}
	
    function copymove( action ) {
	    var s = dropEvent.data.selections, r = [];
		if( s ) {
			// Dragged from the Grid
			requestParams = getRequestParams();
			requestParams.new_dir = dropEvent.target.id.replace( /_RRR_/g, '/' );
			requestParams.new_dir = requestParams.new_dir.replace( /ext_root/g, '' );
			requestParams.confirm = 'true';
			requestParams.action = action;
			handleCallback(requestParams);
		} else {
			// Dragged from inside the tree
			//alert('Move ' + dropEvent.data.node.id.replace( /_RRR_/g, '/' )+' to '+ dropEvent.target.id.replace( /_RRR_/g, '/' ));
			requestParams = getRequestParams();
			requestParams.dir = datastore.directory.substring( 0, datastore.directory.lastIndexOf('/'));
			requestParams.new_dir = dropEvent.target.id.replace( /_RRR_/g, '/' );
			requestParams.new_dir = requestParams.new_dir.replace( /ext_root/g, '' );
			requestParams.selitems = Array( dropEvent.data.node.id.replace( /_RRR_/g, '/' ) );
			requestParams.confirm = 'true';
			requestParams.action = action;
			handleCallback(requestParams);
		}
	}
    // context menus
    var dirCtxMenu = new Ext.menu.Menu({
        id:'dirCtxMenu',
        items: [    	{
        	id: 'dirCtxMenu_new',
    		icon: 'http://localhost/extplorer/images/_folder_new.png',
    		text: 'New File/Directory',
    		handler: function() {dirCtxMenu.hide();openActionDialog(this, 'mkitem');}
    	},
    	{
    		id: 'dirCtxMenu_rename',
    		icon: 'http://localhost/extplorer/images/_fonts.png',
    		text: '重命名',
    		handler: function() { dirCtxMenu.hide();openActionDialog(this, 'rename'); }
    	},
    	{
        	id: 'dirCtxMenu_copy',
    		icon: 'http://localhost/extplorer/images/_editcopy.png',
    		text: '复制',
    		handler: function() { dirCtxMenu.hide();openActionDialog(this, 'copy'); }
    	},
    	{
    		id: 'dirCtxMenu_move',
    		icon: 'http://localhost/extplorer/images/_move.png',
    		text: '移动',
    		handler: function() { dirCtxMenu.hide();openActionDialog(this, 'move'); }
    	},
    	{
    		id: 'dirCtxMenu_chmod',
    		icon: 'http://localhost/extplorer/images/_chmod.png',
    		text: '改变 (chmod) 权限 (目录/文件)',
    		handler: function() { dirCtxMenu.hide();openActionDialog(this, 'chmod'); }
    	},
    	{
    		id: 'dirCtxMenu_remove',
    		icon: 'http://localhost/extplorer/images/_editdelete.png',
    		text: '移除',
    		handler: function() { dirCtxMenu.hide();var num = 1; Ext.Msg.confirm('Confirm', String.format("您确定要删除这些 {0} 项目?", num ), function(btn) { deleteDir( btn, dirCtxMenu.node ) }); }
    	},'-',
    		    	{
    			id: 'dirCtxMenu_archive',
	    		icon: 'http://localhost/extplorer/images/_archive.png',
	    		text: '压缩',
	    		handler: function() { openActionDialog(this, 'archive'); }
	    	},
    	    	{
    		id: 'dirCtxMenu_reload',
    		icon: 'http://localhost/extplorer/images/_reload.png',
    		text: '刷新',
    		handler: function() { dirCtxMenu.hide();dirCtxMenu.node.reload(); }
    	},
    	'-', 
		{
			id: 'dirCtxMenu_cancel',
    		icon: 'http://localhost/extplorer/images/_cancel.png',
    		text: '取消',
    		handler: function() { dirCtxMenu.hide(); }
    	}
	]
    });
    var copymoveCtxMenu = new Ext.menu.Menu({
        id:'copyCtx',
        items: [    	{
        	id: 'copymoveCtxMenu_copy',
    		icon: 'http://localhost/extplorer/images/_editcopy.png',
    		text: '复制',
    		handler: function() {copymoveCtxMenu.hide();copymove('copy');}
    	},
    	{
    		id: 'copymoveCtxMenu_move',
    		icon: 'http://localhost/extplorer/images/_move.png',
    		text: '移动',
    		handler: function() { copymoveCtxMenu.hide();copymove('move'); }
    	},'-', 
		{
			id: 'copymoveCtxMenu_cancel',
    		icon: 'http://localhost/extplorer/images/_cancel.png',
    		text: '取消',
    		handler: function() { copymoveCtxMenu.hide(); }
    	}
	]
    });

    function copymoveCtx(e){
        //ctxMenu.items.get('remove')[node.attributes.allowDelete ? 'enable' : 'disable']();
        copymoveCtxMenu.showAt(e.rawEvent.getXY());
    }
    
	// Hide the Admin Menu under Joomla! 1.5
	try{ 
    	Ext.fly('header-box').hide();Ext.fly('border-top').hide();
	} catch(e) {}
	// Hide the Admin Menu under Joomla! 1.0
	try{
		Ext.fly('header').hide();Ext.select(".menubar").hide();
	} catch(e) {}
	// RT MissionControl Fix
	try{ Ext.fly('mc-footer').hide(); Ext.fly('mc-header').hide();Ext.fly('mc-component').hide();Ext.fly('mc-frame').hide(); } catch(e) {}
	// Hide Top and Bottom Bar in Joomla! 3.0
	try{
		nav = Ext.query('nav');	Ext.get(nav).hide();
		header = Ext.query('header'); Ext.get(header).hide();
		Ext.get('status').hide();
	} catch(e) {}
	
	var fileGridPanel = new Ext.grid.GridPanel({
					xtype: "editorgrid",
		        	region: "center",
		            title: "目录",
		            autoScroll:true,
		            collapsible: false,
		            closeOnTab: true,
		            id: "gridpanel",
		            ds: datastore,
		            cm: cm,
		           	tbar: gridtb,
		            bbar: gridbb,
		            ddGroup : 'TreeDD',
		            enableDragDrop: true,
					 selModel: new Ext.grid.RowSelectionModel({
		                		listeners: {
		        					'rowselect': { fn: handleRowClick },
		                			'selectionchange': { fn: handleRowClick }
		            			}
		            		  }),
		            loadMask: true,
		            keys:
		            	[{
		                    key: 'c',
		                    ctrl: true,
		                    stopEvent: true,
		                    handler: function() { openActionDialog(this, 'copy'); }
		                   
		               },{
		                    key: 'x',
		                    ctrl: true,
		                    stopEvent: true,
		                    handler: function() { openActionDialog(this, 'move'); }
		                   
		               },{
		                 key: 'a',
		                 ctrl: true,
		                 stopEvent: true,
		                 handler: function() {
		            		ext_itemgrid.getSelectionModel().selectAll();
		                 }
		            }, 
		            {
		            	key: Ext.EventObject.DELETE,
		            	handler: function() { openActionDialog(this, 'delete'); }
		            }
		            ],
		        	listeners: { 'rowcontextmenu': { fn: rowContextMenu },
										'celldblclick': { fn: function( grid, rowIndex, columnIndex, e ) { 
																if( Ext.isOpera ) { 
																	// because Opera <= 9 doesn't support the right-mouse-button-clicked event (contextmenu)
																	// we need to simulate it using the ondblclick event
																	rowContextMenu( grid, rowIndex, e );
																} else {
																	gsm = ext_itemgrid.getSelectionModel();
																	gsm.clickedRow = rowIndex;
																	var selections = gsm.getSelections();
																	if( !selections[0].get('is_file') ) {
																		chDir( datastore.directory + '/' + selections[0].get('name') );
																	} else if( selections[0].get('is_editable')) {
																		openActionDialog( this, 'edit' );
																	} else if( selections[0].get('is_readable')) {
																		openActionDialog( this, 'view' );
																	}
																}
															}
										 },
		        			'validateedit': { fn: function(e) {
		    						if( e.value == e.originalValue ) return true;
		    						var requestParams = getRequestParams();
		    						requestParams.newitemname = e.value;
		    						requestParams.item = e.originalValue;
		    						
		    						requestParams.confirm = 'true';
		    						requestParams.action = 'rename';
		    						handleCallback(requestParams);
		    						return true;
		    					}	
		        			}  
							 }
		        	}
)
var Viewport16334478 = new Ext.Viewport({
    id:'Viewport16334478'
		,items:[{
                region: "north",
                xtype: "locationbar",
                id: "locationbarcmp",
                height: 28
            	},fileGridPanel]
	,layout:'border' ,
	listeners: {
		 'afterlayout': { fn: function(){
			 var hadoopFileTreePanel = parent.Ext.getCmp('hadoopFileTreePanel');  
			 if(hadoopFileTreePanel!=undefined){
							locbar = Ext.getCmp("locationbarcmp");
							locbar.tree =hadoopFileTreePanel;
	        				try{ locbar.initComponent(); } catch(e) {}
							 var tsm = hadoopFileTreePanel.getSelectionModel();
							 
                            tsm.on('selectionchange', handleNodeClick );
	        			    // create the editor for the directory tree
	        			    var dirTreeEd = new Ext.tree.TreeEditor(hadoopFileTreePanel, {
	        			        allowBlank:false,
	        			        blankText:'A name is required',
	        			        selectOnFocus:true
	        			    });						
	        				chDir( '' );
							
			 }
		 }}
	}
	});
});
</script>

