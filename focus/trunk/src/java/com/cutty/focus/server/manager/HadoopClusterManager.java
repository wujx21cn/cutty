/* com.cutty.server.manager.HadoopClusterManager.java

{{IS_NOTE
	Purpose:
		
	Description:
		
	History:
		2014-02-05 14:11:16, Created by Jason.Wu
}}IS_NOTE

Copyright (C) 2011 Cutty Corporation. All Rights Reserved.

*/
package com.cutty.focus.server.manager;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.apache.commons.collections.ListUtils;
import org.springframework.stereotype.Service;

import com.cutty.bravo.core.dao.support.Page;
import com.cutty.bravo.core.manager.BaseManager;
import com.cutty.bravo.core.security.domain.Role;
import com.cutty.focus.server.domain.HadoopCluster;
/**
 *
 * <p>
 * <a href="HadoopClusterManager.java.html"><i>View Source</i></a>
 * </p>
 *
 * @author <a href="mailto:wujx21cn@gmail.com">Jason Wu</a>
 */

@Service("hadoopClusterManager")
public class HadoopClusterManager extends BaseManager<HadoopCluster>{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 5377756558000643112L;

	public List<HadoopCluster> getHadoopClustersByUserId(Long userId){
		 List<HadoopCluster> hadoopClusters = super.find(null, "select distinct hc from HadoopCluster hc left outer join hc.roles role " +
		 		"left outer join role.users user where user.id ="+userId, true);
		 return hadoopClusters;
				 
	}
	
	public List<Role> getByRolesByHadoopClusterId(Long hadoopClusterId){
		if (null == this.get(hadoopClusterId)) return  new ArrayList<Role>();
		List<Role> roleList = new ArrayList<Role>();
		Iterator<Role> roles = this.get(hadoopClusterId).getRoles().iterator();
		while (roles.hasNext()){
			roleList.add(roles.next());
		}
		return roleList;
	}

}

