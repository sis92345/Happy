<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>좋아하시는 계절은</h1>
<form method="GET">
	Season : 
		<input type='radio' name="season" value="spring"> 봄 &nbsp;&nbsp;
		<input type='radio' name="season" value="summer"> 여름 &nbsp;&nbsp;
		<input type='radio' name="season" value="fall"> 가을 &nbsp;&nbsp;
		<input type='radio' name="season" value="winter"> 겨울 &nbsp;&nbsp;
	<input type='submit' value='전송' />
	
</form>
<c:if test="${not empty param.season}">
	<!-- 파라메터로 시즌이 넘어왔다면: 첫페이지 아님 -->
	<c:set var="myseason" value="${param.season}"/>
	<c:if test="${myseason eq 'spring'}"><!-- 자바는 문자열 비교에 ==안된다. el은 자바스크립트고 자바스크립트느 ==된다.-->
		<c:out value="진달래, 개나리" />
	</c:if>
	<c:if test="${myseason eq 'summer'}">
		<c:out value="장미, 아카시아" />
	</c:if>
	<c:if test="${myseason eq 'fall'}">
		<c:out value="코스모스, 국화" />
	</c:if>
	<c:if test="${myseason eq 'winter'}">
		<c:out value="동백, 매화" />
	</c:if>
</c:if>

