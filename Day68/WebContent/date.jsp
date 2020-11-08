<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.GregorianCalendar, java.util.Calendar"%>
<%
	//String msg = String.format("방문 시간: %tT", new Date());
	int year = Integer.parseInt(request.getParameter("year"));
	int month = Integer.parseInt(request.getParameter("month"));
	int day = Integer.parseInt(request.getParameter("day"));
	Calendar now = new GregorianCalendar(year, month-1, day);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include 지시자와 action의 차이점</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<div>
		<p><%=now %></p>
	</div>
</body>
</html>