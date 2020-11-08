<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie Delete</title>
</head>
<body>
	<!-- 이거 질문: Cookie 값 넣으면 나오는데 이거 삭제된거 맞음? -->
	<%
		Cookie cookie = new Cookie("ADDRESS","");
		cookie.setMaxAge(-1);
		response.addCookie(cookie);
		response.sendRedirect("CookieGet.jsp");
	%>
	<h1>Cookie Delete</h1>
	<div>방금 쿠키가 삭제되었습니다.</div>
</body>
</html>