<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%
	String cookie_name	= request.getParameter("cookie_name");
	//Cookie 이름은 반드시 영문이거나 URLEncoder로 변환한다.
	cookie_name = URLEncoder.encode(cookie_name, "UTF-8");

	String cookie_value	= request.getParameter("cookie_value");
	//쿠키는 모두 String
	Cookie cookie = new Cookie(cookie_name, cookie_value); //new Cookie("초코칩", "3");
	response.addCookie(cookie);
	response.sendRedirect("displayCookie.jsp");
	
	
%>
