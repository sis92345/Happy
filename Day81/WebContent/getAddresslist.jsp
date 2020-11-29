<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<fmt:requestEncoding value="utf-8" />
<c:set var="sido" value="${param.sido}" />
<c:set var="gugun" value="${param.gugun}" />
<c:set var="dong" value="${param.dong}" />
<sql:setDataSource dataSource="jdbc/myoracle" var="conn"/>
<c:if test="${empty sido and empty gugun}"> <!-- 이거 쿼리문 이해하기 -->
	<sql:query dataSource="${conn}" var="rs">
		SELECT zipcode, sido, gugun, dong, bunji FROM zipcode 
		WHERE dong LIKE CONCAT(CONCAT('%',?),'%')
		<sql:param value="${dong}"/>
	</sql:query>
	
</c:if>
<c:if test="${not empty sido and empty gugun}">
	<sql:query dataSource="${conn}" var="rs">
		SELECT zipcode, sido, gugun, dong, bunji FROM zipcode 
		WHERE sido = ? AND dong LIKE CONCAT(CONCAT('%',?),'%')
		<sql:param value="${sido}"/>
		<sql:param value="${dong}"/>
	</sql:query>
</c:if>
<c:if test="${not empty sido and not empty gugun}">
	<sql:query dataSource="${conn}" var="rs">
		SELECT zipcode, sido, gugun, dong, bunji FROM zipcode 
		WHERE sido = ? AND gugun = ? AND dong LIKE CONCAT(CONCAT('%',?),'%')
		<sql:param value="${sido}"/>
		<sql:param value="${gugun}"/>
		<sql:param value="${sido}"/>
	</sql:query>
</c:if>
<div>(검색결과: ${rs.rowCount})</div>
<table cellpadding="3" cellspacing="0" border="1" width="800">
	<thead>
		<tr>
			<th>우편번호</th>
			<th>시도</th>
			<th>구군</th>
			<th>읍면동</th>
			<th>번지</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${rs.rows}" var="row"> <!-- Result interface getRows() -->
			<tr>
				<td>${row.zipcode}</td>
				<td>${row.sido}</td>
				<td>${row.gugun}</td>
				<td>${row.dong}</td>
				<td>${row.bunji}</td>
			</tr>
		</c:forEach>
	</tbody>
</table> 