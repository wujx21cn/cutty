/* com.cutty.focus.hdfs.web.FileExplorerAction.java

{{IS_NOTE
	Purpose:
		
	Description:
		
	History:
		Mar 9, 2014 1:14:18 PM, Created by Jason.Wu
}}IS_NOTE

Copyright (C) 2008 BullShit Corporation. All Rights Reserved.

*/
package com.cutty.focus.hdfs.web;

import java.util.Iterator;
import java.util.Map;

import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.cutty.bravo.core.web.struts2.BaseActionSupport;

/**
 *
 * <p>
 * <a href="FileExplorerAction.java.html"><i>View Source</i></a>
 * </p>
 *
 * @author <a href="mailto:wujx21cn@gmail.com">Jason Wu</a>
 */

@ParentPackage("bravo")
@Namespace("/hdfs")  
public class FileExplorerAction  extends BaseActionSupport{

	protected static final String VIEW = "view";
	/**
	 * 
	 */
	private static final long serialVersionUID = 3751332351970167028L;
	public String view(){
		return VIEW;
	}
	public String listFiles(){
		Map<String, Object> params = super.getActionContext().getParameters();
		Iterator<String> keys = params.keySet().iterator();
		while (keys.hasNext()){
			String key = keys.next();
			String[] values = (String[])params.get(key);
			for (int i=0;i<values.length;i++){
				System.out.println(key+i+"========================"+values[i].toString());
			}
			
		}
		return VIEW;
	}
	
}
