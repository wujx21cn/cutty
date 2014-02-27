/* com.cutty.focus.domain.ConfigItemTemplate.java

{{IS_NOTE
	Purpose:
		
	Description:
		
	History:
		2014-01-25 15:53:13, Created by Jason.Wu
}}IS_NOTE

Copyright (C) 2011 Cutty Corporation. All Rights Reserved.

 */
package com.cutty.focus.server.domain;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;

import com.cutty.bravo.components.common.domain.Enumeration;
import com.cutty.bravo.core.domain.BaseDomain;
import com.cutty.bravo.core.security.domain.Role;

/**
 * 
 * <p>
 * <a href="ConfigItemTemplate.java.html"><i>View Source</i></a>
 * </p>
 * 
 * @author <a href="mailto:wujx21cn@gmail.com">Jason Wu</a>
 */

@Entity
@Table(name = "focus_config_item_template")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class ConfigItemTemplate extends BaseDomain {

	private static final long serialVersionUID = 1L;
	private String comments;
	private String code;
	private String name;
	private ConfigFileTemplate configFileTemplate;

	private boolean finalled;
	private boolean choosed;
	private String defaultValue;

	private Set<Enumeration> hadoopVersions;

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "config_file_id", referencedColumnName = "id")
	public ConfigFileTemplate getConfigFileTemplate() {

		return configFileTemplate;
	}

	public void setConfigFileTemplate(ConfigFileTemplate configFileTemplate) {
		this.configFileTemplate = configFileTemplate;
	}



	public boolean isFinalled() {
		return finalled;
	}

	public void setFinalled(boolean finalled) {
		this.finalled = finalled;
	}

	public boolean isChoosed() {
		return choosed;
	}

	public void setChoosed(boolean choosed) {
		this.choosed = choosed;
	}

	@Column(name = "default_value")
	public String getDefaultValue() {
		return defaultValue;
	}

	public void setDefaultValue(String defaultValue) {
		this.defaultValue = defaultValue;
	}

	@ManyToMany(cascade = { CascadeType.PERSIST, CascadeType.MERGE }, fetch = FetchType.LAZY)
	@JoinTable(name = "focus_template_hadoop_version", joinColumns = { @JoinColumn(name = "config_item_template_id") }, inverseJoinColumns = { @JoinColumn(name = "version_id") })
	public Set<Enumeration> getHadoopVersions() {
		return hadoopVersions;
	}

	public void setHadoopVersions(Set<Enumeration> hadoopVersions) {
		this.hadoopVersions = hadoopVersions;
	}
	
	
}
