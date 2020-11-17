<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- JSTL의 예 -->
	<!-- 
		c:foreach
		- 자바의 for문
		- var: 변수
		- begin: 시작 값
		- end: 끝 값
		- step: 증가 값
		
		c:out
		-JSP의 Expression과 같다.
	 -->
	<c:forEach var="i" begin="1" end="100" step="1">
		<c:out value="${i}"/> &nbsp;&nbsp;&nbsp;
	</c:forEach>
	<!-- 위 코드를 JSP로 코딩한다면 -->
	<%-- <%for(int i=1;i<=100;i++){%>
		<%=i %>&nbsp;&nbsp;&nbsp;
	<%} %> --%>
</body>
</html>