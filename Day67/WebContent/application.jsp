<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<li>Major Version : <%=application.getMajorVersion() %></li>
		<li>Minor Version : <%=application.getMinorVersion() %></li>
		<p>Servlet의 버전(Servlet으로 변환했으므로)</p>
		<li>DB Driver : <%=application.getInitParameter("db.driver") %></li>
		<li>DB URL : <%=application.getInitParameter("db.url") %></li>
		<li>DB User : <%=application.getInitParameter("db.user") %></li>
		<li>DB Password : <%=application.getInitParameter("db.password") %></li>
	</ul>
</body>
</html>