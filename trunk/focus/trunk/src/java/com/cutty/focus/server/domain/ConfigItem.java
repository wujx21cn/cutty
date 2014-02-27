/* com.cutty.focus.server.domain.ConfigItem.java

{{IS_NOTE
	Purpose:
		
	Description:
		
	History:
		2014-02-05 14:25:50, Created by Jason.Wu
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
import com.cutty.focus.server.domain.ConfigItemTemplate;
import com.cutty.focus.server.domain.ConfigFile;
import javax.persistence.JoinColumn;

import com.cutty.bravo.core.domain.BaseDomain;
/**
 *
 * <p>
 * <a href="ConfigItem.java.html"><i>View Source</i></a>
 * </p>
 *
 * @author <a href="mailto:wujx21cn@gmail.com">Jason Wu</a>
 */

@Entity
@Table(name = "focus_config_item")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class ConfigItem extends BaseDomain {
	
	private static final long serialVersionUID = 1L;
	private String value;
	private ConfigItemTemplate configItemTemplate;
	
	private ConfigFile configFile;
	
	private boolean finalled;

	
	public String getValue() {
		return value;
	}
public void setValue(String value) {
		this.value = value;
	}
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name = "config_item_template_id",referencedColumnName="id")
	public ConfigItemTemplate getConfigItemTemplate() {

		return configItemTemplate;
	}
	public void setConfigItemTemplate(ConfigItemTemplate configItemTemplate) {
			this.configItemTemplate = configItemTemplate;
	}
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name = "config_file_id",referencedColumnName="id")
	public ConfigFile getConfigFile() {

		return configFile;
	}
	public void setConfigFile(ConfigFile configFile) {
			this.configFile = configFile;
	}
	public boolean isFinalled() {
		return finalled;
	}
	public void setFinalled(boolean finalled) {
		this.finalled = finalled;
	}

}

