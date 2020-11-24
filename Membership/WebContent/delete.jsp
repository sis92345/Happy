<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="delete" class="com.example.libs.service.DeleteService"/>
<c:set var="row" value="${delete.deleteMember(userid)}"/>
<c:if test="${row ne 1}">
	<script>
		alert('회원 삭제에 실패했습니다.');
	</script>
</c:if>
<c:if test="${row eq 1}">
	<script>
		alert('회원을 삭제했습니다.');
	</script>
	<c:redirect url="index.html"/>
	<!-- 세션 삭제 -->
	<c:remove var="userid" scope="session"/>
</c:if>