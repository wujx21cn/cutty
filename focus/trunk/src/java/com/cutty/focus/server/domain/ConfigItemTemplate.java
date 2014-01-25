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

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Table;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;

import com.cutty.bravo.core.domain.BaseDomain;

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
	private ConfigFileTemplate configFileId;

	private String isFinal;
	private String choosed;
	private String defaultValue;

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
	public ConfigFileTemplate getConfigFileId() {

		return configFileId;
	}

	public void setConfigFileId(ConfigFileTemplate configFileId) {
		this.configFileId = configFileId;
	}

	@Column(name = "is_final")
	public String getIsFinal() {
		return isFinal;
	}

	public void setIsFinal(String isFinal) {
		this.isFinal = isFinal;
	}

	public String getChoosed() {
		return choosed;
	}

	public void setChoosed(String choosed) {
		this.choosed = choosed;
	}

	@Column(name = "default_value")
	public String getDefaultValue() {
		return defaultValue;
	}

	public void setDefaultValue(String defaultValue) {
		this.defaultValue = defaultValue;
	}
}
