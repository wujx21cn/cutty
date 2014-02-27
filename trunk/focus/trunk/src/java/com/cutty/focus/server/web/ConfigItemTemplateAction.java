/* com.cutty.focus.web.ConfigItemTemplateAction.java

{{IS_NOTE
	Purpose:
		
	Description:
		
	History:
		2014-01-25 15:53:13, Created by Jason.Wu
}}IS_NOTE

Copyright (C) 2011 Cutty Corporation. All Rights Reserved.

*/
package com.cutty.focus.server.web;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.cutty.bravo.components.common.domain.Enumeration;
import com.cutty.bravo.core.dao.support.Page;
import com.cutty.bravo.core.dao.support.QueryParameterWrapper;
import com.cutty.bravo.core.web.struts2.EntityAction;
import com.cutty.focus.server.domain.ConfigItemTemplate;

/**
 *
 * <p>
 * <a href="ConfigItemTemplateAction.java.html"><i>View Source</i></a>
 * </p>
 *
 * @author <a href="mailto:wujx21cn@gmail.com">Jason Wu</a>
 */

@Namespace("/server")
@ParentPackage("bravo")
public class ConfigItemTemplateAction extends EntityAction<ConfigItemTemplate> {
	private static final long serialVersionUID = 1L;
	
    public String getRelatedHadoopVersions() throws Exception {
    	model = baseDao.get(getEntityClass(),baseDao.getId(getEntityClass(),model));
		String contextDataName = ServletActionContext.getRequest().getParameter("contextDataName");
		if (StringUtils.isEmpty(contextDataName)){
			contextDataName = "hadoopVersions";
		}
		Set<Enumeration> ConfigItemTemplateSet = model.getHadoopVersions();
		
	    if (null == model.getHadoopVersions()) {
	    	ServletActionContext.getRequest().setAttribute(contextDataName,new ArrayList<Enumeration>());
	    	ServletActionContext.getRequest().setAttribute("totalCount",String.valueOf(0));
	    	return "jsonDataRenderChain";
	    }
	    List<Enumeration> configItemTemplateList = new ArrayList<Enumeration>();
	    Iterator<Enumeration> configItemTemplateIT = ConfigItemTemplateSet.iterator();
	    while (configItemTemplateIT.hasNext()){
	    	configItemTemplateList.add(configItemTemplateIT.next());
	    }
		ServletActionContext.getRequest().setAttribute(contextDataName,configItemTemplateList);
		ServletActionContext.getRequest().setAttribute("totalCount",String.valueOf(configItemTemplateList.size()));
    	return "jsonDataRenderChain";
    }

}

