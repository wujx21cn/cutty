		{
		"xtype": "form",
		"id": "simpleform",
		"height": "200",
		"width": "350",
		"labelWidth": 125,
		"url":"index.php",
		"dialogtitle": "Archive item(s)",
		"frame": true,
		"items": [{
			"xtype": "textfield",
			"fieldLabel": "Name of the Archive File",
			"name": "name",
			"value": "index.php.zip",
			"width": "200"
		},
		{
			"xtype": "combo",
			"fieldLabel": "Type",
			"store": [
					['zip', 'Zip (normal compression)'],
					['tgz', 'Tar/Gz (good compression)'],
										['tar', 'Tar (no compression)']
					],
			"displayField":"typename",
			"valueField": "type",
			"name": "type",
			"value": "zip",
			"triggerAction": "all",
			"hiddenName": "type",
			"disableKeyFilter": "true",
			"editable": "false",
			"mode": "local",
			"allowBlank": "false",
			"selectOnFocus":"true",
			"width": "200",
			"listeners": { "select": { 
							fn: function(o, record ) {
								form = Ext.getCmp("simpleform").getForm();
								var nameField = form.findField("name").getValue();								
								if( nameField.indexOf( '.' ) > 0 ) {
									form.findField('name').setValue( nameField.substring( 0, nameField.indexOf('.')+1 ) + o.getValue() );
								} else {
									form.findField('name').setValue( nameField + '.'+ o.getValue());
								}
							}
						  }
						}
		
		
		}, {
			"xtype": "textfield",
			"fieldLabel": "Save the Archive in this directory",
			"name": "saveToDir",
			"value": "",
			"width": "200"
		},{
			"xtype": "checkbox",
			"fieldLabel": "Download?",
			"name": "download",
			"checked": "true"
		}
		],
		"buttons": [{
			"text": "Create", 
			"type": "submit", 
			"handler": function() { 
				Ext.ux.OnDemandLoad.load( "http://localhost/extplorer/index.php?option=com_extplorer&action=include_javascript&file=archive.js", 
											function(options) { submitArchiveForm(0) } ); 
			}
		},{
			"text": "Cancel", 
			"handler": function() { Ext.getCmp("dialog").destroy() }
		}]
}

	