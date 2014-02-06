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
	private ConfigItemTemplate configItemTemplateId;
	
	private ConfigFile configFileId;
	
	private String isFinal;

	
	public String getValue() {
		return value;
	}
public void setValue(String value) {
		this.value = value;
	}
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name = "config_item_template_id",referencedColumnName="id")
	public ConfigItemTemplate getConfigItemTemplateId() {

		return configItemTemplateId;
	}
	public void setConfigItemTemplateId(ConfigItemTemplate configItemTemplateId) {
			this.configItemTemplateId = configItemTemplateId;
	}
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name = "config_file_id",referencedColumnName="id")
	public ConfigFile getConfigFileId() {

		return configFileId;
	}
	public void setConfigFileId(ConfigFile configFileId) {
			this.configFileId = configFileId;
	}
	@Column(name = "is_final")
	public String getIsFinal() {
		return isFinal;
	}
public void setIsFinal(String isFinal) {
		this.isFinal = isFinal;
	}
}

