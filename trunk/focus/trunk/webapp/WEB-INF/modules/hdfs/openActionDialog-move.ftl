{
	"xtype": "form",
	"id": "simpleform",
	"labelWidth": 125,
	"width": "340",
	"url":"index.php",
	"dialogtitle": "Copy/Move",
	"frame": true,
	"items": [{
		"xtype": "textfield",
        "fieldLabel": "Destination",
        "name": "new_dir",
        "value": "/extplorer/scripts/",
        "width":175,
        "allowBlank":false
    }],
    "buttons": [{
    	text: 'Create', 
    	handler: function() {
    		form =  Ext.getCmp('simpleform').getForm();
			statusBarMessage( 'Please wait...', true );
		    var requestParams = getRequestParams();
		    requestParams.confirm = 'true';
		    requestParams.action  = 'move';
		    form.submit({
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
					Ext.MessageBox.alert('Error!', action.result.error);
					statusBarMessage( action.result.error, false, false );
		        },
		        scope: form,
		        // add some vars to the request, similar to hidden fields
		        params: requestParams
		    });
		  }
	},{
		text: 'Cancel', 
		handler: function() { Ext.getCmp("dialog").destroy(); }
	}
	]
}
	