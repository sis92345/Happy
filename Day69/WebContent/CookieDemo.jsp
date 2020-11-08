<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%-- 쿠키에서 한글을 사용하기위한 패키지 --%>
<%@ page import="java.net.URLEncoder, java.net.URLDecoder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CookieDemo</title>
</head>
<body>
<%
//cookie는 import안해도된다. 
Cookie cookie = new Cookie("username", URLEncoder.encode("한지민","UTF-8"));
//setMaxAge(int ): 쿠키의 만료시간 설정
cookie.setMaxAge(60);
//addCookie(Cookie arg0): Cookie를 클라이언트에 전송
//브라우저 개발자도구 application에서 해당 쿠키의 name, value, expires를 확인할 수 있다.
response.addCookie(cookie);
%>
	<!-- 쿠키 정보를 읽어오기 -->
	<h1>나의 쿠키 정보</h1>
	<ul>
		<li>Cookie Name : <%=cookie.getName() %></li>
		<li>Cookie Value : <%=URLDecoder.decode(cookie.getValue(), "UTF-8") %></li>
		<li>Cookie expire Date : <%=cookie.getMaxAge() %></li>
		<li><a href="cookieDemo1.jsp">Cookie 읽기</a></li>
	</ul>
</body>
</html>