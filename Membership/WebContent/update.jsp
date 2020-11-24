<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="update" class="com.example.libs.service.UpdateService" />
<c:set var="userid" value="${sessionScope.userid}"/>
<c:set var="email" value="${param.email}" />
<c:set var="city" value="${param.city}" />
<c:set var="age" value="${param.age}" />
<jsp:useBean id="member" class="com.example.libs.model.MemberVO" />
<jsp:setProperty name="member" property="userid" value="${userid}"/>
<jsp:setProperty name="member" property="userid" param="email"/>
<jsp:setProperty name="member" property="userid" param="city"/>
<jsp:setProperty name="member" property="userid" param="age"/>
<!-- 보내기 -->
<c:set var="row" value="${update.updateService(member)}" />
<!-- 확인 -->
<c:if test="${row eq 1}">	
	<c:redirect url="myservice.jsp"/>
</c:if>
<c:if test="${row ne 1}">	
	<script>
		alert('회원정보 수정 실패');
		history.go(-1);
	</script>	
</c:if>