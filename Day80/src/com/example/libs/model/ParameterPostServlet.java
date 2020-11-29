package com.example.libs.model;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ParameterGetServlet
 */
@WebServlet("/servlets/servlet/ParameterPost")
public class ParameterPostServlet extends HttpServlet {
	//URL에서 쿼리 스트링 입력 필수: http://localhost:8080/Day80/servlets/servlet/ParameterGet?name=%ED%95%9C%EC%A7%80%EB%AF%BC&age=24&phone=010-1234-5678
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		//POST면 setEncoing
		PrintWriter out = response.getWriter();
		String name = request.getParameter("name");
		//name = entoutf(name);
		String age = request.getParameter("age");
		String phone = request.getParameter("phone");
		String str = "<span style='color:blue;font-weight:900;font-size:2em'>" + name + "</span>님의 나이는 " + age + "이고, 휴대폰 번호는 " + phone + " 입니다.";
		out.println(str);
		out.close();
	}
	/*
	 * private String entoutf(String en){ String utf8 = null; try{ utf8 = new
	 * String(en.getBytes("ISO8859_1"), "utf-8");
	 * }catch(java.io.UnsupportedEncodingException e){} return utf8; }
	 */
}
