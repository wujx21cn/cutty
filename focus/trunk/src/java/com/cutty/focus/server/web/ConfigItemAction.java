/* com.cutty.focus.server.web.ConfigItemAction.java

{{IS_NOTE
	Purpose:
		
	Description:
		
	History:
		2014-02-05 14:25:50, Created by Jason.Wu
}}IS_NOTE

Copyright (C) 2011 Cutty Corporation. All Rights Reserved.

*/
package com.cutty.focus.server.web;

import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.cutty.bravo.core.web.struts2.EntityAction;
import com.cutty.focus.server.domain.ConfigItem;

/**
 *
 * <p>
 * <a href="ConfigItemAction.java.html"><i>View Source</i></a>
 * </p>
 *
 * @author <a href="mailto:wujx21cn@gmail.com">Jason Wu</a>
 */

@Namespace("/server")
@ParentPackage("bravo")
public class ConfigItemAction extends EntityAction<ConfigItem> {
	private static final long serialVersionUID = 1L;
}

