<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<sql:setDataSource dataSource="jdbc/mymariadb" var="conn" />
		<!-- sql:param: 입력값 -->
<sql:query var="rs" dataSource="${conn}">
	SELECT id AS '일련번호', name AS '도시명', countryCode AS '국가코드', district AS '지역', population AS '인구'
	FROM city
	WHERE countryCode = ?
	<sql:param value="KOR"/>
</sql:query>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL: SQL</title>
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
	<h2 class="text-center text-info">Korea Cities List</h2>
	<table class="table table-bordered">
 		<thead>
 			<!-- id, name, countryCode, district, population -->
 			<tr>
	 			<c:forEach items="${rs.columnNames}" var="column">
	 				<th><c:out value="${column}"/></th>
	 			</c:forEach>
 			</tr>
 		</thead>
 		<tbody>
 			<!--  ro.rows는 Result Interface의 getRows() or getRowsByIndex()  
 				rows: getRows()
 				rowsByIndex: getRowsByIndex() 
 			-->
 			<c:forEach items="${rs.rows}" var="row"> 
 				<tr>
 					<td>${row.ID}</td>
 					<%-- <td><c:out value="${row.name}" /></td> --%>
 					<td>
 					<c:out value="${fn:toUpperCase(row.name)}" />
 					(${fn:length(row.name)})
 					</td>
 					<td>${row.countryCode}</td>
 					<td>${row.district}</td>
 					<td><fmt:formatNumber type="number" value="${row.population}"/></td>				
 				</tr>
 			</c:forEach>
 		</tbody>
	</table>
</body>
</html>