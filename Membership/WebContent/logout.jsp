<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="mylogout" value="${userid}" scope="page"/><!-- mylogout은 현재 페이지에서만 사용 -->
<c:remove var="userid" scope="session"/> <!-- var안에 들어있는거 지운다: session 범위로 지정 -->
<script>
	alert('${mylogout}님! 다음에 만나요.');
	location.href = "index.html";
</script>