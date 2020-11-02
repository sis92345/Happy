<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//자바주석
	String str = "<span style='color:red;'>빨강</span>";
	out.println("str = " + str);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 	<div>Hello, World</div> -->
	<!-- HTML주석은 랜더링은 안하지만 소스보기를 통해 볼 수 있다: 즉 Servlet으로 코딩할 때 HTML 주석도 같이 변환된다. -->
	<div>Servlet, JSP</div>
	<%--<div>Servlet, JSP</div>--%>
</body>
</html>