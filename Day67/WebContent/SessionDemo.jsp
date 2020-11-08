<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<li>세션 ID : <%=session.getId() %></li>
		<li>세션 생성 시간 : <%=new Date(session.getCreationTime()) %></li>
		<li>세션 New 여부 : <%=session.isNew() %></li>
		<li>세션 마지막 접근 시간 : <%=session.getLastAccessedTime() %></li>
		<li>세션 Timeout : <%=session.getMaxInactiveInterval() %></li>
		<li></li>
	</ul>
</body>
</html>