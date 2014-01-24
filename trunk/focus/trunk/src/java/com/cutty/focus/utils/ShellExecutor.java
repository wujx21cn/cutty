/* com.cutty.focus.utils.ShellExecutor.java

{{IS_NOTE
	Purpose:
		
	Description:
		
	History:
		Jan 23, 2014 8:56:37 PM, Created by Jason.Wu
}}IS_NOTE

Copyright (C) 2008 BullShit Corporation. All Rights Reserved.

*/
package com.cutty.focus.utils;

/**
 *
 * <p>
 * <a href="ShellExecutor.java.html"><i>View Source</i></a>
 * </p>
 *
 * @author <a href="mailto:wujx21cn@gmail.com">Jason Wu</a>
 */
public interface ShellExecutor {

	  public void executeCommand (String host,  String user,String passwd, String  command) throws Exception;
	  
	  public int getExitCode();
	  
	  public String getOutput();
	  
	  public String getCommandString();

}
