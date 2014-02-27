/* com.cutty.focus.server.domain.ConfigFile.java

{{IS_NOTE
	Purpose:
		
	Description:
		
	History:
		2014-02-05 14:22:15, Created by Jason.Wu
}}IS_NOTE

Copyright (C) 2011 Cutty Corporation. All Rights Reserved.

*/
package com.cutty.focus.server.domain;


import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.cutty.focus.server.domain.HadoopCluster;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;

import com.cutty.bravo.core.domain.BaseDomain;
/**
 *
 * <p>
 * <a href="ConfigFile.java.html"><i>View Source</i></a>
 * </p>
 *
 * @author <a href="mailto:wujx21cn@gmail.com">Jason Wu</a>
 */

@Entity
@Table(name = "focus_config_file")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class ConfigFile extends BaseDomain {
	
	private static final long serialVersionUID = 1L;
	private ConfigFileTemplate configFileTemplate;
	private HadoopCluster hadoopCluster;
	private String location;
	private Set<ConfigItem> configItems;
 
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name = "config_file_template_id",referencedColumnName="id")
	public ConfigFileTemplate getConfigFileTemplate() {

		return configFileTemplate;
	}
	public void setConfigFileTemplate(ConfigFileTemplate configFileTemplate) {
			this.configFileTemplate = configFileTemplate;
	}
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name = "hadoop_cluster_id",referencedColumnName="id")
	public HadoopCluster getHadoopCluster() {

		return hadoopCluster;
	}
	public void setHadoopCluster(HadoopCluster hadoopCluster) {
			this.hadoopCluster = hadoopCluster;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	
	@OneToMany(mappedBy = "configFile", cascade = CascadeType.ALL, fetch = FetchType.LAZY, targetEntity = ConfigItem.class)
	public Set<ConfigItem> getConfigItems() {
		return configItems;
	}
	public void setConfigItems(Set<ConfigItem> configItems) {
		this.configItems = configItems;
	}
	
	
}

