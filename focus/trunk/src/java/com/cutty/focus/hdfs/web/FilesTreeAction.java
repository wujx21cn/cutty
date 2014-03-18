/* com.cutty.focus.hdfs.web.FilesTreeAction.java

{{IS_NOTE
	Purpose:
		
	Description:
		
	History:
		Feb 26, 2014 2:47:16 PM, Created by Jason.Wu
}}IS_NOTE

Copyright (C) 2008 BullShit Corporation. All Rights Reserved.

*/
package com.cutty.focus.hdfs.web;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.cutty.bravo.components.common.domain.MenuFunction;
import com.cutty.bravo.components.common.manager.MenuFunctionManager;
import com.cutty.bravo.core.ui.tags.tree.TreeNode;
import com.cutty.bravo.core.utils.CryptUtils;
import com.cutty.bravo.core.web.handler.RequestHandler;
import com.cutty.bravo.core.web.struts2.BaseActionSupport;
import com.cutty.focus.hdfs.domain.HDFSFileVO;
import com.cutty.focus.hdfs.fileHelper.HDFSHelper;
import com.cutty.focus.server.domain.HadoopCluster;
import com.cutty.focus.server.manager.HadoopClusterManager;

/**
 *
 * <p>
 * <a href="FilesTreeAction.java.html"><i>View Source</i></a>
 * </p>
 *
 * @author <a href="mailto:wujx21cn@gmail.com">Jason Wu</a>
 */


@ParentPackage("bravo")
@Namespace("/hdfs")  
public class FilesTreeAction  extends BaseActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6163573713348805859L;
	
	private HadoopClusterManager hadoopClusterManager;
	private HDFSHelper defaultHDFSHelper;
	private static final String NODE_POINT="NODE:::";
	private static final String PARAM_SPLIT="@_@";
	private static final String MIX_KEY="6163573713348805859L";
	public String getClusterTree(){
		
		List<TreeNode> treeList = new ArrayList<TreeNode>();
		String node = ServletActionContext.getRequest().getParameter("node");
		if (node.indexOf(NODE_POINT)<0) {
			List<HadoopCluster> childList = hadoopClusterManager.getHadoopClustersByUserId(RequestHandler.getContextRequestHandler().getCurrentUser().getId());
			if (childList.size()>0){
				for(int i=0;i<childList.size();i++)
				{
					HadoopCluster childValue = childList.get(i);
					TreeNode nodeValue = new TreeNode();
					nodeValue.setIconCls("resource");
					nodeValue.setLeaf("false");
					nodeValue.setHref("");
					String idContent = NODE_POINT+CryptUtils.encrypt(childValue.getId()+PARAM_SPLIT+"/", MIX_KEY);
					nodeValue.setId(idContent);
					nodeValue.setText(childValue.getName());
					nodeValue.setCls("cls");
					treeList.add(nodeValue);
				}
			}
			
		} else {
			try {
				String[] contents = CryptUtils.decrypt(node.substring(NODE_POINT.length(), node.length()), MIX_KEY).split(PARAM_SPLIT);
				String clusterId = contents[0];
				String path= contents[1];
				List<HDFSFileVO>  files = defaultHDFSHelper.getSubFiles(hadoopClusterManager.get(Long.parseLong(clusterId)), path);
				for (HDFSFileVO vo:files){
					if (vo.isDir()) {
						TreeNode nodeValue = new TreeNode();
						nodeValue.setIconCls("resource");
						nodeValue.setLeaf("false");
						nodeValue.setHref("");
						String idContent =  NODE_POINT+CryptUtils.encrypt(clusterId+PARAM_SPLIT+path+vo.getName()+"/", MIX_KEY);
						nodeValue.setId(idContent);
						nodeValue.setText(vo.getName());
						nodeValue.setCls("cls");
						treeList.add(nodeValue);
					}

				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		ServletActionContext.getRequest().setAttribute("treeData",treeList);

		return "jsonDataRenderChain";
	}
	
	public void setHadoopClusterManager(HadoopClusterManager hadoopClusterManager) {
		this.hadoopClusterManager = hadoopClusterManager;
	}


	public void setDefaultHDFSHelper(HDFSHelper defaultHDFSHelper) {
		this.defaultHDFSHelper = defaultHDFSHelper;
	}
	
	
}
