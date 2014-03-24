		{
		"xtype": "form",
		"id": "simpleform",
		"labelWidth": 125,
		"url":"index.php",
		"dialogtitle": "Create New File/Directory",
		"frame": true,
		"items": [{
			"xtype": "textfield",
			"fieldLabel": "名称",
			"name": "mkname",
			"width":175,
			"allowBlank":false
			},{
			"xtype": "combo",
			"fieldLabel": "类型",
			"store": [["file", "文件"],
						["dir", "目录"]
											],
			displayField:"type",
			valueField: "mktype",
			value: "file",
			hiddenName: "mktype",
			disableKeyFilter: true,
			editable: false,
			triggerAction: "all",
			mode: "local",
			allowBlank: false,
			selectOnFocus:true
		}],
		"buttons": [{
			"text": "Create", 
			"handler": function() {
				statusBarMessage( "Please wait...", true );
				Ext.getCmp("simpleform").getForm().submit({
					//reset: true,
					reset: false,
					success: function(form, action) {
						statusBarMessage( action.result.message, false, true );
						try{ 
							dirTree.getSelectionModel().getSelectedNode().reload(); 
						} catch(e) {}
						datastore.reload();
						Ext.getCmp("dialog").destroy();
					},
					failure: function(form, action) {
						if( !action.result ) return;
						Ext.Msg.alert("Error!", action.result.error);
						statusBarMessage( action.result.error, false, false );
					},
					scope: Ext.getCmp("simpleform"),
					// add some vars to the request, similar to hidden fields
					params: {option: "com_extplorer", 
							action: "mkitem", 
							dir: datastore.directory, 
							confirm: "true"}
				})
			}
		},{
			"text": "Cancel", 
			"handler": function() { Ext.getCmp("dialog").destroy(); }
		}]
	}
	