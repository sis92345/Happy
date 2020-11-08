<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date, java.text.SimpleDateFormat"%>
<% pageContext.include("header.html"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"href="css/style.css">
</head>
<body>
	<h1>여기는 본문입니다.</h1>
	<%
	String pattern = "지금은 GG yyyy년 mm월 dd일 EE aa hh시 mm분 ss초 입니다.";
	SimpleDateFormat sdf = new SimpleDateFormat(pattern);
	String now = sdf.format(new Date());
	%>
	
	<%=now %>
	<br>
	<img alt="Warhammer-Imperial Knight" src="images/autumn.jpg">
</body>
</html>
<% pageContext.include("copyright.html"); %>
