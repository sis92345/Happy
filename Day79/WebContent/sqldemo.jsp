<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- <!-- SQL SETTING 1: 직접 입력하는 방법
<sql:setDataSource var="conn" driver="oracle.jdbc.driver.OracleDriver" uri="jdbc:oracle:thin:@localhost:1521:XE" user="scott" password="tiger" /> --%>
<sql:setDataSource var="conn" dataSource="jdbc/myoracle"/>
<!-- query: JDBC의 selectQuery(): conn과 연결하고 rs변수에 담는다. -->
<sql:query dataSource="${conn}" var="rs"> 
	SELECT empno, ename, sal, hiredate, dname, loc, deptno
	FROM emp INNER JOIN dept using (deptno)
	ORDER BY empno DESC
</sql:query>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL: SQL </title>
<link rel="stylesheet" href="css/bootstrap.css" />
<style>
	table{
		text-align: center;
	}
	tr:nth-of-type(2n){
		background-color: #bedbbb; 
	}
	thead tr{
		color: #92817a;
	}
</style>
</head>
<body>
	<%-- ${conn} --%>
	<!-- SELECT -->
	<h2 class="text-center text-success">쌍용주식회사 사원 리스트</h2>
	<table class="table table-bordered">
 		<thead>
 			<th>사번</th>
 			<th>이름</th>
 			<th>봉급</th>
 			<th>입사일</th>
 			<th>부서명</th>
 			<th>위치</th>
 			<th>부서번호</th>
 		</thead>
 		<tbody>
 			<c:forEach items="${rs.rows}" var="row"> <!--  데이터는 rs의 rows에 있다: rows만큼 반복 > row에 넣는다 > row에 각 컬럼이 들어있다.  -->
 				<tr>
 					<td>${row.empno}</td>
 					<td>${row.ename}</td>
 					<td><fmt:formatNumber  type="currency" currencySymbol="$" value="${row.sal}"/></td>
 					<td><fmt:formatDate value="${row.hiredate}" type="date" dateStyle="full"/></td>
 					<td>${row.dname}</td>
 					<td>${row.loc}</td>
 					<td>${row.deptno}</td>
 				</tr>
 			</c:forEach>
 		</tbody>
	</table>
</body>
</html>