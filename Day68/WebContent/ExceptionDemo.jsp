<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    errorPage="error.jsp" isErrorPage="false"
<%
	int first = Integer.parseInt(request.getParameter("first"));
	int second = Integer.parseInt(request.getParameter("second"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 처음 실행하면 null값이 들어오고 null값은 parseInt할 수 없으므로 오류: 쿼리 스트링 사용 -->
	<!-- 오류가 발생했을때 자세한 오류 내용이 아니라 일반 오류 메시지를 보여줘야한다. -->
	<%=first %> / <%=second %> = <%=first/second %>
</body>
</html>