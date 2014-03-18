package com.cutty.bravo.core.ui.tags.container;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.lang.StringUtils;

import com.cutty.bravo.core.ui.tags.BaseTag;
import com.cutty.bravo.core.ui.tags.container.component.HtmlBean;
import com.cutty.bravo.core.utils.render.UITemplateRender;

public class Html  extends BaseTag{
	private static final long serialVersionUID = 6473251247250231087L;

		@Override
		public int doEndTag() throws JspException {
			if (StringUtils.isNotEmpty(this.getBodyContent().getString())){
				HtmlBean component = (HtmlBean)this.getComponent();
				component.setBodyContent(this.getBodyContent().getString());
				super.setRegister(Boolean.parseBoolean(component.getIsRegister()));
			}
			return super.doEndTag();
		}
		
	
}
