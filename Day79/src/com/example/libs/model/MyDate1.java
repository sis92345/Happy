package com.example.libs.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class MyDate1 extends TagSupport{
	private String fg;
	private String bg;
	public MyDate1() {
		this.bg = "yellow"; //<required>false</required>일 경우 들어갈 기본 값, 디폴드값 방법 1
	}
	//SETTER: TAG ATTRIBUTE를 SET한다.
	public void setFg(String fg) {
		//필수
		this.fg = fg;
	}

	public void setBg(String bg) {
		//선택
		if(bg == null) {
			this.bg = "yellow"; //디폴드값 방법 2
		}else this.bg = bg;
	}

	@Override
	public int doStartTag() throws JspTagException{
	JspWriter out = pageContext.getOut(); //브라우저에 출력하기 위해서는OUT객체가 필요하다
	String pattern = "GG yyyy년 MM월 dd일 EE aa (hh:mm:ss)";
	SimpleDateFormat fmt = new SimpleDateFormat(pattern);
	Date now = new Date();
	try {
		out.print("<span style='color:"+ this.fg + ";font-size:2em;background-color:"+ this.bg + "'>");
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
