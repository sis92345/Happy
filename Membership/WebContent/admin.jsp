<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="select" class="com.example.libs.service.SelectService" />
<c:set var="list" value="${select.selectAllMember()}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 모드</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-theme.css">
<script src="js/jquery-3.5.1.js"></script>
</head>
<body>
	<div class='container'>
		<div class='row'>
			<h2 class='text-center text=success'>전체회원명단</h2>
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">아이디</th>
						<th scope="col">이름</th>
						<th scope="col">이메일</th>
						<th scope="col">성별</th>
						<th scope="col">도시</th>
						<th scope="col">나이</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items='${list}' var="member"> 
						<c:if test="${fn:trim(member.userid) ne 'admin'}"> <!-- userid는 char인데 char는 글자만큼 꽉 참 => 트리밍 -->
						<tr>
							<td><c:out value="${member.userid}"/></td>
							<td><c:out value="${member.name}"/></td>
							<td><c:out value="${member.email}"/></td>
							<c:if test="${member.gender eq 1}">
								<td>남성</td>
							</c:if>
							<c:if test="${member.gender eq 2}">
								<td>여성</td>
							</c:if>	
							<td><c:out value="${member.city}"/></td>
							<td><c:out value="${member.age}"/></td>
						</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>