package com.cutty.bravo.core.ui.tags.container.component;

import com.cutty.bravo.core.ui.component.Component;

public class HtmlBean  extends Component{

	private static final long serialVersionUID = -7631843859429529852L;
	private String bodyContent;
	private String isRegister = "false";//是否注册到父标签上  默认 ：否
	public String getIsRegister() {
		return isRegister;
	}
	public void setIsRegister(String isRegister) {
		this.isRegister = isRegister;
	}
	/**
	 * @return the bodyContent
	 */
	public String getBodyContent() {
		return bodyContent;
	}
	/**
	 * @param bodyContent the bodyContent to set
	 */
	public void setBodyContent(String bodyContent) {
		this.bodyContent = bodyContent;
	}
	
}
