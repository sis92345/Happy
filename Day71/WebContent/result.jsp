<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	String name = (String)session.getAttribute("name");
	String result = request.getParameter("result");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Result</title>
</head>
<body>
	<h2>
		<%if(result.equals("yes")) {%>
		<%=name%>(<%=id%>)님! 성공적으로 회원가입되었습니다.
		<%} else{%>
		<%=name%>(<%=id %>)님은 약관에 동의하지 않으셨습니다.
		<%} %>
	</h2>
</body>
</html>