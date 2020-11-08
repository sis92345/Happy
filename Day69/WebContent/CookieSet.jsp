<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie Set</title>
</head>
<body>
	<h1>Cookie Set</h1>
	<%
		response.addCookie(new Cookie("NAME","한지민"));
		response.addCookie(new Cookie("AGE","24"));
		response.addCookie(new Cookie("ADDRESS","서울시강남구역삼동"));
		response.sendRedirect("CookieGet.jsp");
	%>
<%-- <jsp:forward page="CookieGet.jsp"></jsp:forward> --%>
	<div>
		방금 쿠키가 저장됐습니다.
		http://www.example.com/Day69/CookieGet.jsp로 다시 접속해서 확인하세요
	</div>
</body>
</html>