/* com.cutty.focus.node.domain.HadoopNode.java

{{IS_NOTE
	Purpose:
		
	Description:
		
	History:
		Jan 24, 2014 10:12:50 AM, Created by Jason.Wu
}}IS_NOTE

Copyright (C) 2008 BullShit Corporation. All Rights Reserved.

*/
package com.cutty.focus.server.domain;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.cutty.bravo.components.common.domain.Enumeration;
import com.cutty.bravo.core.domain.BaseDomain;

/**
 *
 * <p>
 * <a href="HadoopNode.java.html"><i>View Source</i></a>
 * </p>
 *
 * @author <a href="mailto:wujx21cn@gmail.com">Jason Wu</a>
 */

@Entity
@Table(name = "focus_hadoop_node")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class HadoopNode  extends BaseDomain{
	private static final long serialVersionUID = 4787822235876625194L;

	public final static long NODE_TYPE_NAME_NODE_ID =27; 
	public final static long NODE_TYPE_DATA_NODE_ID =26; 
	private String name;
	private String hostName;
	private String hostIP;
	private String installPath;
	private String rootId;
	private String rootPassword;
	private String hadoopId;
	private String hadoopPassword;
	private Enumeration nodeType;
	private Enumeration operationSystem;
	private Enumeration hadoopVersion;
	private HadoopNode nameNode;
	private List<HadoopNode> dataNodes;
	

	@Column(name = "name")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Column(name = "host_name")
	public String getHostName() {
		return hostName;
	}
	public void setHostName(String hostName) {
		this.hostName = hostName;
	}

	@Column(name = "host_ip")
	public String getHostIP() {
		return hostIP;
	}
	public void setHostIP(String hostIP) {
		this.hostIP = hostIP;
	}

	@Column(name = "install_path")
	public String getInstallPath() {
		return installPath;
	}
	public void setInstallPath(String installPath) {
		this.installPath = installPath;
	}
	
	@Column(name = "root_id")
	public String getRootId() {
		return rootId;
	}
	public void setRootId(String rootId) {
		this.rootId = rootId;
	}

	@Column(name = "root_password")
	public String getRootPassword() {
		return rootPassword;
	}
	public void setRootPassword(String rootPassword) {
		this.rootPassword = rootPassword;
	}
	
	@Column(name = "hadoop_id")
	public String getHadoopId() {
		return hadoopId;
	}
	
	public void setHadoopId(String hadoopId) {
		this.hadoopId = hadoopId;
	}
	
	@Column(name = "hadoop_password")
	public String getHadoopPassword() {
		return hadoopPassword;
	}
	public void setHadoopPassword(String hadoopPassword) {
		this.hadoopPassword = hadoopPassword;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "node_type_id",referencedColumnName="id")	
	public Enumeration getNodeType() {
		return nodeType;
	}
	
	public void setNodeType(Enumeration nodeType) {
		this.nodeType = nodeType;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "operation_system_id",referencedColumnName="id")	
	public Enumeration getOperationSystem() {
		return operationSystem;
	}
	public void setOperationSystem(Enumeration operationSystem) {
		this.operationSystem = operationSystem;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "hadoop_version_id",referencedColumnName="id")	
	public Enumeration getHadoopVersion() {
		return hadoopVersion;
	}
	
	public void setHadoopVersion(Enumeration hadoopVersion) {
		this.hadoopVersion = hadoopVersion;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "name_node_id",referencedColumnName="id")	
	public HadoopNode getNameNode() {
		return nameNode;
	}
	public void setNameNode(HadoopNode nameNode) {
		this.nameNode = nameNode;
	}
	
	@OneToMany(mappedBy = "nameNode", cascade = CascadeType.ALL, fetch = FetchType.LAZY, targetEntity = HadoopNode.class) 
	@OrderBy("id")
	public List<HadoopNode> getDataNodes() {
		return dataNodes;
	}
	public void setDataNodes(List<HadoopNode> dataNodes) {
		this.dataNodes = dataNodes;
	}
	
	

}
