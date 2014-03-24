{
     "title":"Search",
     "height":300,
     "autoScroll":true,

     items: new Ext.DataView({
     	"id": "dataview",
         tpl: new Ext.XTemplate(
	        '<tpl for=".">',
	        '<div class="search-item">',
	            '<h3>',
	            '<a onclick="selectFile(\'{dir}\', \'{file}\');Ext.getCmp(\'dialog\').destroy();return false;" href="#" target="_blank">{s_dir}/{file}, {lastModified:date("M j, Y")}</a>',
	            '</h3>',
	        '</div></tpl>'
	    ),
         store: new Ext.data.Store({
		        proxy: new Ext.data.HttpProxy({
		            url: "./fileExplorer!openActionDialog.action"
		        }),
		        reader: new Ext.data.JsonReader({
		            root: 'items',
		            totalProperty: 'totalCount',
		            id: 'file_id'
		        }, [			            
		            {name: 'fileId', mapping: 'file_id'},
		            {name: 'file', mapping: 'file'},
		            {name: 'dir', mapping: 'dir'},
		            {name: 's_dir', mapping: 's_dir'},
		            {name: 'lastModified', mapping: 'last_mtime', type: 'date', dateFormat: 'timestamp'}
		        ]),
		        baseParams: {
		        	limit:20, 
		        	option: "com_extplorer",
		        	action:"search",
		        	dir: "",
		        	content: '0',
	        		subdir: '1'
		        }
		    }),
         itemSelector: 'div.search-item'
     })  ,
     tbar: [
         'Search: ', ' ',
         new Ext.app.SearchField({
             store: Ext.getCmp("dataview").store,
             width:420
         }),' ',' ',' ',
         {	
         	"id": "searchsubdir",
			text: "Subdirs",
			tooltip: "Search subdirectories?",
			name: "subdir",
			"listeners": {
				"toggle": {
					fn: function(btn, pressed) {
							Ext.getCmp("dataview").store.baseParams.subdir = (pressed ? '1' : '0');
					}
				}
			},
			 enableToggle: true,
			 pressed: true
		},' ',' ',' ',{
			
			"id": "searchcontent",
			text: "Content",
			tooltip: "File Contents?",
			name: 'content',
			"listeners": {
				"toggle": {
					fn: function(btn, pressed) {
							Ext.getCmp("dataview").store.baseParams.content = (pressed ? '1' : '0');
					}
				}
			},
			 enableToggle: true,
			 pressed: false
		}
     ],

     bbar: new Ext.PagingToolbar({
         store: Ext.getCmp("dataview").store,
         pageSize: 20,
         displayInfo: true,
         displayMsg: 'Results {0} - {1} of {2}',
         emptyMsg: "No files to display"
     })
}

