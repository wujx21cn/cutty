package com.cutty.focus.server.web;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.cutty.bravo.core.ui.Constants;
import com.cutty.bravo.core.web.struts2.EntityAction;
import com.cutty.focus.server.domain.HadoopNode;

@Namespace("/server")   
@ParentPackage("bravo")
public class HadoopNodeAction  extends EntityAction<HadoopNode>{
	private static final long serialVersionUID = 1877627696616089140L;

	   public String saveAndRendJsonData() throws Exception {
		   StringBuffer validationMsg = new  StringBuffer();
		   int errorCount = 1 ;
		   if (StringUtils.isNotEmpty( model.getHostIP()) ) {
			   String regex = "^(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|[1-9])\\."
	                    + "(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|\\d)\\."
	                    + "(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|\\d)\\."
	                    + "(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|\\d)$";
			   Pattern pattern = Pattern.compile(regex);
			   Matcher matcher = pattern.matcher(model.getHostIP()); 
			   if (! matcher.matches()) 
				   validationMsg.append("<font color=\"red\">"+errorCount++ +":节点IP格式不对。</font><br/>");
			   
		   }
		   if (null != model.getId() && null != model.getNameNode() && model.getId() == model.getNameNode().getId()) {
			   validationMsg.append("<font color=\"red\">"+errorCount++ +":不能把自身节点设置为NameNode。</font><br/>");
		   }
		   if (model.getNodeType().getId().longValue() == HadoopNode.NODE_TYPE_DATA_NODE_ID && (null == model.getNameNode() || null == model.getNameNode().getId())) 
			   validationMsg.append("<font color=\"red\">"+errorCount++ +":该节点为DataNode，必须选择对应NameNode。</font><br/>");

		   if (model.getNodeType().getId().longValue() == HadoopNode.NODE_TYPE_NAME_NODE_ID && (null != model.getNameNode() && null != model.getNameNode().getId())) 
			   validationMsg.append("<font color=\"red\">"+errorCount++ +"该节点为NameNode，对应NameNode必须为空。</font><br/>");
		   if (validationMsg.length()>0){
			   logger.info("save hadoopNode error::::"+validationMsg.toString());
			   ServletActionContext.getRequest().setAttribute(Constants.FORM_AJAX_SUBMIT_KEY, Constants.FORM_AJAX_SUBMIT_VALUE);
		    	ServletActionContext.getRequest().setAttribute(Constants.FORM_AJAX_SUBMIT_STATUS, Constants.FORM_AJAX_SUBMIT_FAILURE);			
		    	ServletActionContext.getRequest().setAttribute(Constants.FORM_AJAX_SUBMIT_MSG, validationMsg.toString());
		    	return JSON_DATA_RENDER_CHAIN;
		   } else {
			   return super.saveAndRendJsonData();
		   }

		   
	   }


}
