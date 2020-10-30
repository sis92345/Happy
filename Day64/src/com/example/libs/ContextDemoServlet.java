package com.example.libs;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * ServletContext interface 연습
 */
//@WebServlet("/servlets/servlet/ContextDemoServlet")
public class ContextDemoServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//이 클래스가 HttpServlet를 상속받았고 HttpServlet는 올라가면 ServletContext을 상속받으므로 사용 가능
		ServletContext ctx = this.getServletContext();
		//ServletContext getInitParameter(): 
		//데이터를 web.xml에서 가져온다.
		Enumeration<String> enums = ctx.getInitParameterNames();
		
		while(enums.hasMoreElements()) {
			String name = enums.nextElement();
			String value = ctx.getInitParameter(name);
			System.out.println(name + "---->" + value);
		}
		////////////////////////
		//HttpServlet getInitParameter()
		//데이터를 web.xml에서 가져온다.
		this.getInitParameter("username");
	}

}
