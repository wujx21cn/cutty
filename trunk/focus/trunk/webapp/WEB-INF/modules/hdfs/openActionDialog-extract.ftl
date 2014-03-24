{
	"xtype": "tabpanel",
	"stateId": "upload_tabpanel",
	"activeTab": "uploadform",
	"dialogtitle": "Upload file(s)",		
	"stateful": "true",
	
	"stateEvents": ["tabchange"],
	"getState": function() { return {
					activeTab:this.items.indexOf(this.getActiveTab())
				};
	},
	"listeners": {	"resize": {
						"fn": function(panel) {	
							panel.items.each( function(item) { item.setHeight(500);return true } );								
						}
					}
					
	},
	"items": [

		{
			"xtype": "swfuploadpanel",
			"title": "flashupload",
			"height": "300",
			"id": "swfuploader", 
			viewConfig: {
        		forceFit: true
			},
			"listeners": {	"allUploadsComplete": {
								"fn": function(panel) {	
									datastore.reload();	
									panel.destroy();
									Ext.getCmp("dialog").destroy();
									statusBarMessage('Upload successful!', false );								
								}
							}
							
			},
			// Uploader Params				
			"upload_url": "http://localhost/extplorer/uploadhandler.php",
			"post_params": { 
				"eXtplorer": "fi2BAz04vjMm72jkqZ1Yrj4Mmu7jgoFy",
				"PHPSESSID": "fi2BAz04vjMm72jkqZ1Yrj4Mmu7jgoFy",
				"session_name": "eXtplorer",
				"user_agent": "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; InfoPath.3; .NET4.0E)",
				"option": "com_extplorer", 
				"action": "upload", 
				"dir": datastore.directory, 
				"requestType": "xmlhttprequest",
				"confirm": "true"
			},
			
"debug": "true",				
			"flash_url": "http://localhost/extplorer/scripts/extjs3-ext/ux.swfupload/swfupload.swf",
			"prevent_swf_caching": "false",
			"file_size_limit": "2097152B",
			// Custom Params
			"single_file_select": false, // Set to true if you only want to select one file from the FileDialog.
			"confirm_delete": false, // This will prompt for removing files from queue.
			"remove_completed": false // Remove file from grid after uploaded.
		},
	{
		"xtype": "form",
		"autoScroll": "true",
		"autoHeight": "true",
		"id": "uploadform",
		"fileUpload": true,
		"labelWidth": 125,
		"url":"index.php",
		"title": "standardupload",
		"tooltip": "Maximum File Size = <strong>2 MB<\/strong><br \/>Maximum Upload Limit = <strong>8 MB<\/strong><br \/>",
		"frame": true,
		"items": [
		{
			"xtype": "displayfield",
			"value": "Maximum File Size = <strong>2 MB<\/strong><br \/>Maximum Upload Limit = <strong>8 MB<\/strong><br \/>"
		},
		{
				"xtype": "fileuploadfield",
				"fieldLabel": "File 1",
				"id": "userfile0",
				"name": "userfile[0]",
				"width":275,
				"buttonOnly": false
			},{
				"xtype": "fileuploadfield",
				"fieldLabel": "File 2",
				"id": "userfile1",
				"name": "userfile[1]",
				"width":275,
				"buttonOnly": false
			},{
				"xtype": "fileuploadfield",
				"fieldLabel": "File 3",
				"id": "userfile2",
				"name": "userfile[2]",
				"width":275,
				"buttonOnly": false
			},{
				"xtype": "fileuploadfield",
				"fieldLabel": "File 4",
				"id": "userfile3",
				"name": "userfile[3]",
				"width":275,
				"buttonOnly": false
			},{
				"xtype": "fileuploadfield",
				"fieldLabel": "File 5",
				"id": "userfile4",
				"name": "userfile[4]",
				"width":275,
				"buttonOnly": false
			},{
				"xtype": "fileuploadfield",
				"fieldLabel": "File 6",
				"id": "userfile5",
				"name": "userfile[5]",
				"width":275,
				"buttonOnly": false
			},{
				"xtype": "fileuploadfield",
				"fieldLabel": "File 7",
				"id": "userfile6",
				"name": "userfile[6]",
				"width":275,
				"buttonOnly": false
			},		{	"xtype": "checkbox",
			"fieldLabel": "Overwrite existing file(s)?",
			"name": "overwrite_files",
			"checked": true
		}],
		"buttons": [{
			"text": "Save", 
			"handler": function() {
				statusBarMessage( 'Processing Upload, please wait...', true );
				form = Ext.getCmp("uploadform").getForm();
				form.submit({
					//reset: true,
					reset: false,
					success: function(form, action) {
						datastore.reload();
						statusBarMessage( action.result.message, false, true );
						Ext.getCmp("dialog").destroy();
					},
					failure: function(form, action) {
						if( !action.result ) return;
						Ext.MessageBox.alert('Error(s)', action.result.error);
						statusBarMessage( action.result.error, false, false );
					},
					"scope": form,
					// add some vars to the request, similar to hidden fields
					"params": {
						"option": "com_extplorer", 
						"action": "upload", 
						"dir": datastore.directory,
						"requestType": "xmlhttprequest",
						"confirm": "true"
					}
				});
			}
		}, {
			"text": "Cancel", 
			"handler": function() { Ext.getCmp("dialog").destroy(); } 
		}]
	},
	{
	
		"xtype": "form",
		"id": "transferform",
		"url":"index.php",
		"hidden": "true",
		"title": "Transfer from another Server",
		"autoHeight": "true",
		"labelWidth": 225,
		"frame": true,
		"items": [
		{
					"xtype": "textfield",
					"fieldLabel": "URL of the File",
					"name": "userfile[0]",
					"width":275
				},{
					"xtype": "textfield",
					"fieldLabel": "URL of the File",
					"name": "userfile[1]",
					"width":275
				},{
					"xtype": "textfield",
					"fieldLabel": "URL of the File",
					"name": "userfile[2]",
					"width":275
				},{
					"xtype": "textfield",
					"fieldLabel": "URL of the File",
					"name": "userfile[3]",
					"width":275
				},{
					"xtype": "textfield",
					"fieldLabel": "URL of the File",
					"name": "userfile[4]",
					"width":275
				},{
					"xtype": "textfield",
					"fieldLabel": "URL of the File",
					"name": "userfile[5]",
					"width":275
				},{
					"xtype": "textfield",
					"fieldLabel": "URL of the File",
					"name": "userfile[6]",
					"width":275
				},			{	"xtype": "checkbox",
				"fieldLabel": "Overwrite existing file(s)?",
				"name": "overwrite_files",
				"checked": true
			}
		],
		"buttons": [{
	
			"text": "Save", 
			"handler": function() {
				statusBarMessage( 'Processing Server-to-Server Transfer, please wait...', true );
				transfer = Ext.getCmp("transferform").getForm();
				transfer.submit({
					//reset: true,
					reset: false,
					success: function(form, action) {
						datastore.reload();
						statusBarMessage( action.result.message, false, true );
						Ext.getCmp("dialog").destroy();
					},
					failure: function(form, action) {
						if( !action.result ) return;
						Ext.MessageBox.alert('Error(s)', action.result.error);
						statusBarMessage( action.result.error, false, false );
					},
					scope: transfer,
					// add some vars to the request, similar to hidden fields
					params: {
						"option": "com_extplorer", 
						"action": "transfer", 
						"dir": datastore.directory,
						"confirm": 'true'
					}
				});
			}
		},{
			"text": "Cancel", 
			"handler": function() { Ext.getCmp("dialog").destroy(); }
		}]
	}]
}

	