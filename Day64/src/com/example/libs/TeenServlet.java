package com.example.libs;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlets/servlet/Teen")
public class TeenServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//username, userage는 포워딩하면서 계속 이동한다: 이름과 나이를 같이 넘긴다.
		String username = req.getParameter("username");
		int userage = Integer.parseInt(req.getParameter("userage"));
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		//TeenPage
		out.println("<body style = 'background-color: aqua;'>");
		out.println("<h1 style = 'color: red;>This page is a Teenage's page</h1>");
		out.println("이름 :" + username + "<br />");
		out.println("나이 :" + userage + "<br />");
		out.println("</body>");
		out.close();
	}
}
