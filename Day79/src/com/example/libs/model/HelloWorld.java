package com.example.libs.model;

import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class HelloWorld extends TagSupport{ //모든 Custom Tag class는 반드시 TagSupport를 상속받아야한다.
	@Override
	public int doStartTag() throws JspTagException{
	JspWriter out = pageContext.getOut(); //브라우저에 출력하기 위해서는OUT객체가 필요하다
	try {
	out.print("<font size='7' color='red'>"); //out객체이므로 브라우저에 출력
	out.println("Hello, World</font>");
	} catch (Exception e) {
	throw new JspTagException(e.getMessage());
	}
	return this.SKIP_BODY;
	}
	@Override
	public int doEndTag() throws JspTagException{
	return this.EVAL_PAGE; //EVAL_PAGE: 종결태그 다음에 나오는 페이지를 처리한다.
		}
	}
