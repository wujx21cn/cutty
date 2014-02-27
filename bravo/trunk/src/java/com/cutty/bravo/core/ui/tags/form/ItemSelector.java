/* com.cutty.bravo.core.ui.tags.form.ItemSelector.java

{{IS_NOTE
	Purpose:
		
	Description:
		
	History:
		Sep 11, 2008 2:32:16 PM, Created by kukuxia.hw
}}IS_NOTE

Copyright (C) 2008 Bravo Corporation. All Rights Reserved.

*/
package com.cutty.bravo.core.ui.tags.form;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.jsp.JspException;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang.StringUtils;

import com.cutty.bravo.core.dao.BaseDao;
import com.cutty.bravo.core.ui.tags.form.component.ItemSelectorBean;
import com.cutty.bravo.core.utils.ApplicationContextKeeper;

/**
 * <p> 自定义EXT ItemSelector标签类 </p>
 * <p>
 * <a href="ItemSelector.java.html"><i>View Source</i></a>
 * </p>
 *
 */
public class ItemSelector extends Field {

	private static final long serialVersionUID = 26115437482289488L;
	
	/** 
	 * override BaseTag的doEndTag()方法,如果该标签内属性dataProxy是以hql方式传回数据，调用此方法处理返回数据格式为json.
	 * @see com.cutty.bravo.core.ui.tags.BaseTag#doEndTag()
	 */
	@Override
	public int doEndTag() throws JspException {
	StringBuffer dataArray = new StringBuffer("[");
	BaseDao baseDao= (BaseDao)ApplicationContextKeeper.getAppCtx().getBean("baseDao");
	ItemSelectorBean itemSelectorBean = (ItemSelectorBean)this.getComponent();
	String dataProxy = itemSelectorBean.getDataProxy();
	List dataList=null;
	if (dataProxy  != null){
		if ( dataProxy.indexOf("hql[") > -1) {
			String sql = dataProxy.substring(4, dataProxy.length()-1);
			dataList = baseDao.find(null, sql,true);
		} else if ( dataProxy.indexOf("list[") > -1){
			String listName = dataProxy.substring(5, dataProxy.length()-1);
			dataList = (List)super.getWebContent().get(StringUtils.trim(listName));
		}
		if (null == dataList) dataList = new ArrayList();
		
		java.util.Iterator dataIterator = dataList.iterator();
		while (dataIterator.hasNext()){
			Object value = dataIterator.next();
			String displayString = "";
			String valueString = "";
			try {
				displayString = BeanUtils.getProperty(value, itemSelectorBean.getDisplayField());
				valueString = BeanUtils.getProperty(value, itemSelectorBean.getValueField());
			} catch (IllegalAccessException e) {
				
			} catch (InvocationTargetException e) {
				
			} catch (NoSuchMethodException e) {
				
			}
			dataArray.append("[" +"'"+ displayString +"'," + "'"+ valueString + "'" + "],");
		}
		
		String itemSelectorName = itemSelectorBean.getName();
		String dataArrayString = ("var "+ itemSelectorName +"_array_fromData = " + dataArray.toString().substring(0,dataArray.length()-1));
		dataArrayString += "];";
		
		super.addOutPutScript(dataArrayString);
	}
	    return super.doEndTag();
}
}
