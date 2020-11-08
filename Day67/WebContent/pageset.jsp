<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session 변수</title>
</head>
<body>	
<%
	String username = request.getParameter("username");
	String userage = request.getParameter("userage");
	//application 변수 생성
	pageContext.setAttribute("username", username);
	pageContext.setAttribute("userage", userage);
%>
	<h1>page(pageContext) variable</h1>
	<ul>
		<li>이름 : <%=username %></li>
		<li>나이 : <%=userage %></li>
		<li><a href="pageget.jsp">확인하기</a></li>
	</ul>
</body>
</html>