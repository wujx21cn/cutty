/* com.cutty.focus.server.web.ConfigFileAction.java

{{IS_NOTE
	Purpose:
		
	Description:
		
	History:
		2014-02-05 14:22:15, Created by Jason.Wu
}}IS_NOTE

Copyright (C) 2011 Cutty Corporation. All Rights Reserved.

 */
package com.cutty.focus.server.web;

import java.util.List;

import org.apache.cxf.common.util.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.cutty.bravo.components.common.domain.News;
import com.cutty.bravo.core.ui.Constants;
import com.cutty.bravo.core.web.struts2.EntityAction;
import com.cutty.focus.server.domain.ConfigFile;
import com.cutty.focus.server.domain.ConfigItemTemplate;

/**
 * 
 * <p>
 * <a href="ConfigFileAction.java.html"><i>View Source</i></a>
 * </p>
 * 
 * @author <a href="mailto:wujx21cn@gmail.com">Jason Wu</a>
 */

@Namespace("/server")
@ParentPackage("bravo")
public class ConfigFileAction extends EntityAction<ConfigFile> {
	/**
	 * 
	 */
	private static final long serialVersionUID = -4149356562429703760L;

	public String saveConfigFileAndRendJsonData() throws Exception {
		StringBuffer validationMsg = new StringBuffer();
		int errorCount = 1;
		if (null ==model.getConfigFileTemplate() || null == model.getConfigFileTemplate().getId()){
			validationMsg.append("<font color=\"red\">" + errorCount++ + ":请选择相关配置模板。</font><br/>");
		}
		if (null ==model.getHadoopCluster() || null == model.getHadoopCluster().getId()){
			validationMsg.append("<font color=\"red\">" + errorCount++ + ":请选择相关集群。</font><br/>");
		}
		String hql = "from ConfigFile WHERE configFileTemplate.id=" + model.getConfigFileTemplate().getId() + " and hadoopCluster.id=" +  model.getHadoopCluster().getId();
		List<ConfigFile> existConfigFiles = baseDao.find(null, hql, true);
		if (null != existConfigFiles && existConfigFiles.size() > 0)
			validationMsg.append("<font color=\"red\">" + errorCount++ + ":该集群中对应的配置文件已经存在。</font><br/>");

		if (validationMsg.length() > 0) {
			logger.info("save Hadoop集群配置文件 error::::" + validationMsg.toString());
			ServletActionContext.getRequest().setAttribute(
					Constants.FORM_AJAX_SUBMIT_KEY,
					Constants.FORM_AJAX_SUBMIT_VALUE);
			ServletActionContext.getRequest().setAttribute(
					Constants.FORM_AJAX_SUBMIT_STATUS,
					Constants.FORM_AJAX_SUBMIT_FAILURE);
			ServletActionContext.getRequest().setAttribute(
					Constants.FORM_AJAX_SUBMIT_MSG, validationMsg.toString());
			return JSON_DATA_RENDER_CHAIN;
		} else {
			return super.saveAndRendJsonData();
		}
	}
}
