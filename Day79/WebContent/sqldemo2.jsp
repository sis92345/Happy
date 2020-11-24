<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<sql:setDataSource var="conn" dataSource="jdbc/mymariadb"/>
<sql:update var="rs" dataSource="${conn}">
	UPDATE CITY
	SET population = ?
	WHERE Name = ?
	<sql:param value="10068381"/>
	<sql:param value="SEOUL"/>
</sql:update>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL SQL연습: 서울 인구 업데이트</title>
</head>
<body>
	<!-- stmt의 update와 마찬가지로 Update에 성공하면 Result에 1이 저장  -->
	<!-- 
	오늘 발생한 문제: driver를 로드할 수 없습니다.  
	해결: WEB-INF/libs에 mariadb jar가 없었고 반드시 이클립스가 인식하도록 새로고침해야함
	-->
	<c:out value="${rs}" />
	<c:if test="${rs eq 1}">
		<h1>Update Success</h1>
		<c:redirect url="sqldemo1.jsp"/>
	</c:if>
	<c:if test="${rs ne 1}">
		<h1>Update Failure</h1>
	</c:if>
</body>
</html>