<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session variable 확인</title>
</head>
<body>	
<%
	String username = (String)session.getAttribute("username");
	String userage = (String)session.getAttribute("userage");
	//application 변수 생성
%>
	<h1>session variable 확인</h1>
	<ul>
		<li>이름 : <%=username %></li>
		<li>나이 : <%=userage %></li>

	</ul>
</body>
</html>