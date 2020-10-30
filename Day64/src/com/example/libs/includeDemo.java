package com.example.libs;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class includeDemo
 */
//@WebServlet("/servlets/servlet/includeDemo")
public class includeDemo extends HttpServlet {
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html;charset=utf-8");	
		//RequestDispatcher rd = req.getRequestDispatcher("https://www.naver.com");
		PrintWriter out = res.getWriter();
		//header
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		RequestDispatcher header = req.getRequestDispatcher("/header.html");//buffer로 전송 1
		header.include(req, res);
		//body
//		String today = String.format("<h3 style='text-align: center;'>오늘은 %1$tY년 %1$tM월 %1$tD일입니다.", new Date());
//		out.println(today); //buffer로 전송 2
		///servlets/servlet/Now라고 불렀으므로 web.xml에서 등록해야한다.
		RequestDispatcher body = req.getRequestDispatcher("/servlets/servlet/Now");
		body.include(req, res);
		//foot
		RequestDispatcher footer = req.getRequestDispatcher("/copyright.html"); //buffer로 전송 3
		footer.include(req, res);	
		out.println("</html>");
		out.close();
		//당연하지만 가져오는 Component는 close하면 안된다.
		//out.close()으로 buffer가 차단 --> 이 밑으로는 buffer로 보낼 수 없다.
		
	}

}
