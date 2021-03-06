    var ${component.name} = new Ext.form.TimeField({
	<#if component.fieldName?exists>name:'${component.fieldName}'
	</#if><#if component.autoCreate?exists>,autoCreate:${component.autoCreate}
	</#if><#if component.clearCls?exists>,clearCls:'${component.clearCls}'
	</#if><#if component.cls?exists>,cls:'${component.cls}'
	</#if><#if component.disabled?exists>,disabled:${component.disabled}
	</#if><#if component.fieldClass?exists>,fieldClass:${component.fieldClass}
	</#if><#if component.fieldLabel?exists>,fieldLabel:'${component.fieldLabel}'
	</#if><#if component.focusClass?exists>,focusClass:'${component.focusClass}'
	</#if><#if component.hideLabel?exists>,hideLabel:${component.hideLabel}
	</#if><#if component.inputType?exists>,inputType:'${component.inputType}'
	</#if><#if component.invalidClass?exists>,invalidClass:'${component.invalidClass}'
	</#if><#if component.invalidText?exists>,invalidText:'${component.invalidText}'
	</#if><#if component.itemCls?exists>,itemCls:'${component.itemCls}'
	</#if><#if component.labelSeparator?exists>,labelSeparator:'${component.labelSeparator}'
	</#if><#if component.labelStyle?exists>,labelStyle:'${component.labelStyle}'
	</#if><#if component.msgFx?exists>,msgFx:'${component.msgFx}'
	</#if><#if component.msgTarget?exists>,msgTarget:'${component.msgTarget}'
	</#if><#if component.readOnly?exists>,readOnly:${component.readOnly}
	</#if><#if component.tabIndex?exists>,tabIndex:${component.tabIndex}
	</#if><#if component.validateOnBlur?exists>,validateOnBlur:${component.validateOnBlur}
	</#if><#if component.validationDelay?exists>,validationDelay:${component.validationDelay}
	</#if><#if component.validationEvent?exists>,validationEvent:${component.validationEvent}
	</#if><#if component.value?exists>,value:'${component.value}'

	</#if><#if component.allowBlank?exists>,allowBlank:${component.allowBlank}
	</#if><#if component.blankText?exists>,blankText:'${component.blankText}'
	</#if><#if component.disableKeyFilter?exists>,disableKeyFilter:${component.disableKeyFilter}
	</#if><#if component.emptyClass?exists>,emptyClass:'${component.emptyClass}'
	</#if><#if component.emptyText?exists>,emptyText:'${component.emptyText}'
	</#if><#if component.grow?exists>,grow:${component.grow}
	</#if><#if component.growMax?exists>,growMax:${component.growMax}
	</#if><#if component.growMin?exists>,growMin:${component.growMin}
	</#if><#if component.maskRe?exists>,maskRe:${component.maskRe}
	</#if><#if component.maxLength?exists>,maxLength:${component.maxLength}
	</#if><#if component.maxLengthText?exists>,maxLengthText:'${component.maxLengthText}'
	</#if><#if component.minLength?exists>,minLength:${component.minLength}
	</#if><#if component.minLengthText?exists>,minLengthText:'${component.minLengthText}'
	</#if><#if component.regex?exists>,regex:${component.regex}
	</#if><#if component.regexText?exists>,regexText:'${component.regexText}'
	</#if><#if component.selectOnFocus?exists>,selectOnFocus:${component.selectOnFocus}
	</#if><#if component.validator?exists>,validator:'${component.validator}'
	</#if><#if component.vtype?exists>,vtype:'${component.vtype}'
	</#if><#if component.vtypeText?exists>,vtypeText:'${component.vtypeText}'


	</#if><#if component.autoCreate?exists>,autoCreate:'${component.autoCreate}'
	</#if><#if component.hideTrigger?exists>,hideTrigger:${component.hideTrigger}
	</#if><#if component.triggerClass?exists>,triggerClass:'${component.triggerClass}'
	
       
        </#if><#if component.allQuery?exists>,allQuery:'${component.allQuery}'
	</#if><#if component.autoCreate?exists>,autoCreate:${component.autoCreate}
	</#if><#if component.displayField?exists>,displayField:'${component.displayField}'
	</#if><#if component.editable?exists>,editable:${component.editable}
	</#if><#if component.forceSelection?exists>,forceSelection:${component.forceSelection}
	</#if><#if component.handleHeight?exists>,handleHeight:${component.handleHeight}
	</#if><#if component.hiddenName?exists>,hiddenName:'${component.hiddenName}'
	</#if><#if component.lazyInit?exists>,lazyInit:${component.lazyInit}
	</#if><#if component.lazyRender?exists>,lazyRender:${component.lazyRender}
	</#if><#if component.listAlign?exists>,listAlign:'${component.listAlign}'
	</#if><#if component.listClass?exists>,listClass:'${component.listClass}'
	</#if><#if component.listWidth?exists>,listWidth:${component.listWidth}
	</#if><#if component.loadingText?exists>,loadingText:'${component.loadingText}'
	</#if><#if component.maxHeight?exists>,maxHeight:${component.maxHeight}
	</#if><#if component.minChars?exists>,minChars:${component.minChars}
	</#if><#if component.minListWidth?exists>,minListWidth:${component.minListWidth}
	</#if><#if component.mode?exists>,mode:'${component.mode}'
	</#if><#if component.pageSize?exists>,pageSize:${component.pageSize}
	</#if><#if component.queryDelay?exists>,queryDelay:${component.queryDelay}
	</#if><#if component.queryParam?exists>,queryParam:'${component.queryParam}'
	</#if><#if component.resizable?exists>,resizable:${component.resizable}
	</#if><#if component.selectOnFocus?exists>,selectOnFocus:${component.selectOnFocus}
	</#if><#if component.selectedClass?exists>,selectedClass:'${component.selectedClass}'
	</#if><#if component.shadow?exists>,shadow:'${component.shadow}'
	</#if><#if component.store?exists>,store:${component.store}
	</#if><#if component.title?exists>,title:'${component.title}'
	</#if><#if component.tpl?exists>,tpl:'${component.tpl}'
	</#if><#if component.transform?exists>,transform:${component.transform}
	</#if><#if component.triggerAction?exists>,triggerAction:'${component.triggerAction}'
	</#if><#if component.triggerClass?exists>,triggerClass:'${component.triggerClass}'
	</#if><#if component.typeAhead?exists>,typeAhead:${component.typeAhead}
	</#if><#if component.typeAheadDelay?exists>,typeAheadDelay:${component.typeAheadDelay}
	</#if><#if component.valueField?exists>,valueField:'${component.valueField}'
	</#if><#if component.valueNotFoundText?exists>,valueNotFoundText:'${component.valueNotFoundText}'
	
	</#if><#if component.altFormats?exists>,altFormats:'${component.altFormats}'
	</#if><#if component.format?exists>,format:'${component.format}'
	</#if><#if component.increment?exists>,increment:${component.increment}
	</#if><#if component.invalidText?exists>,invalidText:'${component.invalidText}'
	</#if><#if component.maxText?exists>,maxText:'${component.maxText}'
	</#if><#if component.maxValue?exists>,maxValue:'${component.maxValue}'
	</#if><#if component.minText?exists>,minText:'${component.minText}'
	</#if><#if component.minValue?exists>,minValue:'${component.minValue}'
	
	</#if>

    });