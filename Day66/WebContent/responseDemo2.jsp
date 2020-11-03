<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	int count = 0;
%>
<%
	//<meta http-equiv="Refresh" content="5">와 동일
	response.setHeader("Refresh", "5");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- content 숫자만큼 Refresh -->
<!-- <meta http-equiv="Refresh" content="1"> -->
<title>Insert title here</title>
</head>
<body>
	방문자 수: <%=++count %>
</body>
</html>