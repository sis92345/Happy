<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie Modify</title>
</head>
<body>
	<!-- 쿠키의 수정: 덮어쓰면된다. -->
	<%
		response.addCookie(new Cookie("AGE", "39"));
		response.sendRedirect("CookieGet.jsp");
	%>
	<div>방금 쿠키가 수정됬습니다.</div>
</body>
</html>