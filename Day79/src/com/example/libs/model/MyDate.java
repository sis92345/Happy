package com.example.libs.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class MyDate extends TagSupport{
	@Override
	public int doStartTag() throws JspTagException{
	JspWriter out = pageContext.getOut(); //브라우저에 출력하기 위해서는OUT객체가 필요하다
	String pattern = "GG yyyy년 MM월 dd일 EE aa (hh:mm:ss)";
	SimpleDateFormat fmt = new SimpleDateFormat(pattern);
	Date now = new Date();
	try {
		out.print("<span style='color:blue;font-size:2em;background-color:yellow'>");
		out.print(fmt.format(now) + "</span>");
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
