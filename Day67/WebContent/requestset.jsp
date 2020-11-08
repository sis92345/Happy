<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request 변수</title>
</head>
<body>	
<%
	String username = request.getParameter("username");
	String userage = request.getParameter("userage");
	//application 변수 생성
	request.setAttribute("username", username);
	request.setAttribute("userage", userage);
%>
	<h1>request variable</h1>
	<ul>
		<li>이름 : <%=username %></li>
		<li>나이 : <%=userage %></li>
		<!-- <li><a href="requestget.jsp">확인하기</a></li> -->
		<%
			//page와 다르게 request는 forwarding 할 때 까지 살아있다.
			pageContext.forward("requestget.jsp");
		%>
	</ul>
</body>
