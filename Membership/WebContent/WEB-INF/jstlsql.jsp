<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <sql:setDataSource/> : JDBC SETTING -->
<!-- 만약 DataSource가 없을 경우 세팅-->
<%-- <sql:setDataSource url="jdbc:oracle:thin:@localhost:1521:XE"  user="scott" password="tiger" driver="oracle.jdbc.dirver.OracleDriver"/> --%>
<!-- 만약 DataSource가 있을 경우:JNDI를 이용해서 연결하고 싶으면-->
<sql:setDataSource dataSource="jdbc/myoracle" var="conn"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL SQL</title>
</head>
<body>
	<!-- JSTL의 SQL은 JNDI를 이용해서 만든다. 
		- query tag: SELECT
		- update tag: UPDATE, DELETE, 
		- param: pa
	-->
	<c:out value="${conn}" />
	<sql:query var="rs" dataSource="conn" sql="SELECT * FROM emp"/>
	<sql:query var="rs" dataSource="conn" sql="SELECT * FROM emp">
		SELECT * FROM emp; <!-- 이것도 가능 -->
	</sql:query>
	<c:out value="${rs}" /> <!-- 루트해야함 -->
</body>
</html>