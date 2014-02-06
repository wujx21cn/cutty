/* com.cutty.server.web.HadoopClusterAction.java

{{IS_NOTE
	Purpose:
		
	Description:
		
	History:
		2014-02-05 14:11:16, Created by Jason.Wu
}}IS_NOTE

Copyright (C) 2011 Cutty Corporation. All Rights Reserved.

*/
package com.cutty.focus.server.web;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.cutty.bravo.components.common.domain.Enumeration;
import com.cutty.bravo.core.web.struts2.EntityAction;
import com.cutty.focus.server.domain.ConfigFile;
import com.cutty.focus.server.domain.ConfigFileTemplate;
import com.cutty.focus.server.domain.HadoopCluster;
import com.cutty.focus.server.domain.HadoopNode;

/**
 *
 * <p>
 * <a href="HadoopClusterAction.java.html"><i>View Source</i></a>
 * </p>
 *
 * @author <a href="mailto:wujx21cn@gmail.com">Jason Wu</a>
 */

@Namespace("/server")
@ParentPackage("bravo")
public class HadoopClusterAction extends EntityAction<HadoopCluster> {
	private static final long serialVersionUID = 1L;
	
	public String getClusterNodeList() throws Exception{
		model = baseDao.get(getEntityClass(),baseDao.getId(getEntityClass(),model));
		String contextDataName = ServletActionContext.getRequest().getParameter("contextDataName");
		List<HadoopNode> configItemTemplateList = new ArrayList<HadoopNode>();
		configItemTemplateList.add(model.getNameNode());
		if (null != model.getDataNodes()){
			 Iterator<HadoopNode> dataNodeIT = model.getDataNodes().iterator();
			 while (dataNodeIT.hasNext()){
				 configItemTemplateList.add(dataNodeIT.next());
			 }
		}
		ServletActionContext.getRequest().setAttribute(contextDataName,configItemTemplateList);
		ServletActionContext.getRequest().setAttribute("totalCount",String.valueOf(configItemTemplateList.size()));
    	return "jsonDataRenderChain";
	}
	
	public String addConfigFile() throws Exception{
		List<ConfigFileTemplate> toBeAddedFileTemplates = getToBeAddedFileTemplates();
		ServletActionContext.getRequest().setAttribute("toBeAddedFileTemplates",toBeAddedFileTemplates);
		return "addConfigFile";
	}
	
	/**
	 * 返回查看页面定义
	 * @return
	 */
    public String view() throws Exception{
		List<ConfigFileTemplate> toBeAddedFileTemplates = getToBeAddedFileTemplates();
		if (toBeAddedFileTemplates.size() == 0){
			ServletActionContext.getRequest().setAttribute("notToBeAddedFileTemplates","true");
		} else {
			ServletActionContext.getRequest().setAttribute("notToBeAddedFileTemplates","false");
		}
		String hql = "from ConfigFile WHERE hadoopCluster.id=" +  model.getId();
		List<ConfigFile> existConfigFiles = baseDao.find(null, hql, true);
		ServletActionContext.getRequest().setAttribute("existConfigFiles",existConfigFiles);
    	return super.view();

    }
    
    private List<ConfigFileTemplate> getToBeAddedFileTemplates()  throws Exception{
    	model = baseDao.get(getEntityClass(),baseDao.getId(getEntityClass(),model));
		 List<ConfigFile> configFiles = model.getConfigFiles();
		 List<ConfigFileTemplate>  configFileTemplates = baseDao.getAll(ConfigFileTemplate.class);
		 List<ConfigFileTemplate> toBeAddedFileTemplates = new ArrayList<ConfigFileTemplate>();
		 for (ConfigFileTemplate configFileTemplate:configFileTemplates){
			 boolean noExistConfigFile = true;
			 for (ConfigFile configFile:configFiles){
				 if (configFileTemplate.getId().longValue() == configFile.getConfigFileTemplate().getId().longValue()) {
					 noExistConfigFile = false;
				 }
			 }
			 if (noExistConfigFile) toBeAddedFileTemplates.add(configFileTemplate);
		 }
		 return toBeAddedFileTemplates;
    }
}

