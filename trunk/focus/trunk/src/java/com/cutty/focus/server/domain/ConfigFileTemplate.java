/* com.cutty.server.domain.ConfigFileTemplate.java

{{IS_NOTE
	Purpose:
		
	Description:
		
	History:
		2014-01-25 15:41:18, Created by Jason.Wu
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

import com.cutty.bravo.core.domain.BaseDomain;

/**
 * 
 * <p>
 * <a href="ConfigFileTemplate.java.html"><i>View Source</i></a>
 * </p>
 * 
 * @author <a href="mailto:wujx21cn@gmail.com">Jason Wu</a>
 */

@Entity
@Table(name = "focus_config_file_template")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class ConfigFileTemplate extends BaseDomain {
	private static final long serialVersionUID = -5354809565294937244L;
	private String location;
	private String comments;
	private String name;
	private Set<ConfigItemTemplate> configItemTemplates;

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
	@OneToMany(mappedBy = "configFileTemplate", cascade = CascadeType.ALL, fetch = FetchType.LAZY, targetEntity = ConfigItemTemplate.class)
	public Set<ConfigItemTemplate> getConfigItemTemplates() {
		return configItemTemplates;
	}

	public void setConfigItemTemplates(Set<ConfigItemTemplate> configItemTemplates) {
		this.configItemTemplates = configItemTemplates;
	}
	
	
}
