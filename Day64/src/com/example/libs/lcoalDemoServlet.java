package com.example.libs;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class lcoalDemoServlet
 */
//@WebServlet("/servlets/servlet/lcoalDemoServlet")
public class lcoalDemoServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//		Enumeration<String> enums = this.getInitParameterNames();
//		while(enums.hasMoreElements()) {
//			String name = enums.nextElement();
//			String value = this.getInitParameter(name);
//			System.out.println(name + "-->" + value);
//		}
		//param-value
		String fileroot = this.getInitParameter("mariadb.properties");
		System.out.println(fileroot);
		DBConnection dbconn = new DBConnection(fileroot);
		Connection conn = dbconn.getConnection(); //2,3
		PrintWriter out = res.getWriter();
		res.setContentType("text/html;charset=utf-8");
		out.println("<h1>" + conn + "</h1>");
		//System.out.println(conn);
		DBClose.close(conn);
		out.close();
		
	}
}
