		{
		"xtype": "form",
		"id": "simpleform",
		"width": "300",
		"labelWidth": 125,
		"url":"index.php",
		"dialogtitle": "Change permissions",
		"title" : "/extplorer/scripts/archive.js.php",
		"frame": true,
		"items": [{
			"layout": "column",
			"items": [{
				"width":80, 
			"title":"Owner",					
			"items": [{
									"xtype": "checkbox",
					"boxLabel":"r",
					"checked":true,						"name":"r_00"
					}	,{					"xtype": "checkbox",
					"boxLabel":"w",
					"checked":true,						"name":"r_01"
					}	,{					"xtype": "checkbox",
					"boxLabel":"x",
											"name":"r_02"
					}		
				]
			}
		,{			"width":80, 
			"title":"Group",					
			"items": [{
									"xtype": "checkbox",
					"boxLabel":"r",
					"checked":true,						"name":"r_10"
					}	,{					"xtype": "checkbox",
					"boxLabel":"w",
					"checked":true,						"name":"r_11"
					}	,{					"xtype": "checkbox",
					"boxLabel":"x",
											"name":"r_12"
					}		
				]
			}
		,{			"width":80, 
			"title":"Public",					
			"items": [{
									"xtype": "checkbox",
					"boxLabel":"r",
					"checked":true,						"name":"r_20"
					}	,{					"xtype": "checkbox",
					"boxLabel":"w",
					"checked":true,						"name":"r_21"
					}	,{					"xtype": "checkbox",
					"boxLabel":"x",
											"name":"r_22"
					}		
				]
			}
		,{
			"width":400, 
			"style":"margin-left:10px", 
			"clear":true,
			"html": "&nbsp;"
		}]

	},{
		"xtype": "checkbox",
		"fieldLabel":"Recurse into subdirectories?",
		"name":"do_recurse"
	}],
	"buttons": [{
		"text": "Save", 
		"handler": function() {
			statusBarMessage( 'Applying Permissions, please wait...', true );
			form = Ext.getCmp("simpleform").getForm();
			form.submit({
				//reset: true,
				reset: false,
				success: function(form, action) {
					statusBarMessage( action.result.message, false, true );
					datastore.reload();
					Ext.getCmp("dialog").destroy();
				},
				failure: function(form, action) {
					statusBarMessage( action.result.error, false, false );
					Ext.Msg.alert('Error(s)', action.result.error);
				},
				scope: form,
				params: {
					"option": "com_extplorer", 
					"action": "chmod", 
					"dir": "/extplorer/scripts", 
					"selitems[]": ['archive.js.php'], 
					confirm: 'true'
				}
			});
		}
	},{
		"text": "Cancel", 
		"handler": function() { Ext.getCmp("dialog").destroy(); }
	}]
}
	
		