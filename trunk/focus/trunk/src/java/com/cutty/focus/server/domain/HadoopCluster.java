/* com.cutty.server.domain.HadoopCluster.java

{{IS_NOTE
	Purpose:
		
	Description:
		
	History:
		2014-02-05 14:11:16, Created by Jason.Wu
}}IS_NOTE

Copyright (C) 2011 Cutty Corporation. All Rights Reserved.

 */
package com.cutty.focus.server.domain;

import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.ManyToOne;
import com.cutty.bravo.components.common.domain.Enumeration;
import com.cutty.focus.server.domain.HadoopNode;
import javax.persistence.JoinColumn;

import com.cutty.bravo.core.domain.BaseDomain;

/**
 * 
 * <p>
 * <a href="HadoopCluster.java.html"><i>View Source</i></a>
 * </p>
 * 
 * @author <a href="mailto:wujx21cn@gmail.com">Jason Wu</a>
 */

@Entity
@Table(name = "focus_hadoop_cluster")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class HadoopCluster extends BaseDomain {

	private static final long serialVersionUID = 1L;
	private Enumeration hadoopVersion;

	private HadoopNode nameNode;
	private String name;
	private String comments;
	private Set<HadoopNode> dataNodes;
	private List<ConfigFile> configFiles;
	
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "hadoop_version_id", referencedColumnName = "id")
	public Enumeration getHadoopVersion() {
		return hadoopVersion;
	}

	public void setHadoopVersion(Enumeration hadoopVersion) {
		this.hadoopVersion = hadoopVersion;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "name_node_id", referencedColumnName = "id")
	public HadoopNode getNameNode() {

		return nameNode;
	}

	public void setNameNode(HadoopNode nameNode) {
		this.nameNode = nameNode;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}
	
	@ManyToMany(cascade = { CascadeType.PERSIST, CascadeType.MERGE }, fetch = FetchType.LAZY)
	@JoinTable(name = "focus_cluster_node", joinColumns = { @JoinColumn(name = "cluster_id") }, inverseJoinColumns = { @JoinColumn(name = "data_node_id") })
	public Set<HadoopNode> getDataNodes() {
		return dataNodes;
	}

	public void setDataNodes(Set<HadoopNode> dataNodes) {
		this.dataNodes = dataNodes;
	}

	@OneToMany(mappedBy = "hadoopCluster", cascade = CascadeType.ALL, fetch = FetchType.LAZY, targetEntity = ConfigFile.class) 
	@OrderBy("id")
	public List<ConfigFile> getConfigFiles() {
		return configFiles;
	}

	public void setConfigFiles(List<ConfigFile> configFiles) {
		this.configFiles = configFiles;
	}


}
