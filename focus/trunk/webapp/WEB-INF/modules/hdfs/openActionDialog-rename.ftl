{
	"xtype": "form",
	"width": "350",
	"height": "150",
	"id": "simpleform",
	"labelWidth": 125,
	"url":"index.php",
	"dialogtitle": "Rename a directory or file...",
	"frame": true,
	"items": [{
	
		"xtype": "textfield",
		"fieldLabel": "New Name",
		"name": "newitemname",
		"id": "newitemname",
		"value": "application.js.php.zip",
		"width":175,
		"allowBlank":false
		}
	],
	"listeners": { "afterrender": { 
						fn: function( form ) {
							form.findById("newitemname").focus(true);
						}
					}
	},
	"buttons": [{
		"text": "Save", 
		"handler": function() {
			statusBarMessage( 'Please wait...', true );
			form = Ext.getCmp("simpleform").getForm();
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
					Ext.MessageBox.alert('Error!', action.result.error);
					statusBarMessage( action.result.error, false, false );
				},
				scope: form,
				// add some vars to the request, similar to hidden fields
				params: {
					option: 'com_extplorer', 
					action: 'rename', 
					dir: '/extplorer/scripts', 
					item: 'application.js.php.zip', 
					confirm: 'true'
				}
			});
		}
	},{
		"text": "Cancel", 
		"handler": function() { Ext.getCmp("dialog").destroy(); } 
	}]
}
	
	