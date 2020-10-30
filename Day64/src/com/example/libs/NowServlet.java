package com.example.libs;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class NowServlet
 */
public class NowServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html;charset=utf-8");	
		String today = String.format("<h3 style='text-align: center;'>오늘은 %1$tY년 %1$tM월 %1$tD일입니다.", new Date());
		PrintWriter out = res.getWriter();
		out.println(today); //buffer로 전송 2
		//out.close();여기서 close하면 buffer차단 --> 이건 Component이므로 메인페이지 buffer가 가져올 수 없다.
		//절대로 부품은 close하면 안된다.
		//out.close()으로 buffer가 차단 --> 이 밑으로는 buffer로 보낼 수 없다.
	}
}
