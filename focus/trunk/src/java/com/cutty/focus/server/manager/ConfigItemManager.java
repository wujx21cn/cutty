/* com.cutty.focus.server.manager.ConfigItemManager.java

{{IS_NOTE
	Purpose:
		
	Description:
		
	History:
		2014-02-05 14:25:50, Created by Jason.Wu
}}IS_NOTE

Copyright (C) 2011 Cutty Corporation. All Rights Reserved.

*/
package com.cutty.focus.server.manager;

import java.util.Set;

import org.springframework.stereotype.Service;

import com.cutty.bravo.core.manager.BaseManager;
import com.cutty.focus.server.domain.ConfigFile;
import com.cutty.focus.server.domain.ConfigFileTemplate;
import com.cutty.focus.server.domain.ConfigItem;
import com.cutty.focus.server.domain.ConfigItemTemplate;
/**
 *
 * <p>
 * <a href="ConfigItemManager.java.html"><i>View Source</i></a>
 * </p>
 *
 * @author <a href="mailto:wujx21cn@gmail.com">Jason Wu</a>
 */

@Service("configItemManager")
public class ConfigItemManager extends BaseManager<ConfigItem>{

	private ConfigFileManager configFileManager;
	private ConfigFileTemplateManager configFileTemplateManager;
	
	public void addDefaultConfigItem(ConfigFile configFile){
		if (null == configFile.getConfigFileTemplate()) return;
		ConfigFile configFileVal = configFileManager.get(configFile.getId());
		ConfigFileTemplate configFileTemplate = configFileTemplateManager.get(configFile.getConfigFileTemplate().getId());
		System.out.println(configFileTemplate.getConfigItemTemplates());
		Set<ConfigItemTemplate> configItemTemplates=configFileVal.getConfigFileTemplate().getConfigItemTemplates();
		for (ConfigItemTemplate configItemTemplate:configItemTemplates) {
			if (configItemTemplate.isChoosed()){
				ConfigItem configItem = new ConfigItem();
				configItem.setConfigFile(configFileVal);
				configItem.setConfigItemTemplate(configItemTemplate);
				configItem.setValue(configItemTemplate.getDefaultValue());
				configItem.setFinalled(configItemTemplate.isFinalled());
			}
			
		}
	}
	public void setConfigFileManager(ConfigFileManager configFileManager) {
		this.configFileManager = configFileManager;
	}
	public void setConfigFileTemplateManager(
			ConfigFileTemplateManager configFileTemplateManager) {
		this.configFileTemplateManager = configFileTemplateManager;
	}
	
	
	
}

