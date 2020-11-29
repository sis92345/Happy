<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.example.libs.service.SelectService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="select" class="com.example.libs.service.SelectService"/>
<c:set var="dept" value="${select.selectService()}"/>
<c:set var="i" value="0"/>
<c:forEach items="${dept}" var="row">
	<c:forTokens items="${row}" delims="," var = "i"> <!-- fotTokens로 , 단위로 분리 -->
		<c:out value="${i}"/> <hr />
	</c:forTokens>
</c:forEach>
<!-- 벡터에 3개 인덱스 존재, 출력은 벡터 전체로 나옴, 인덱스만큼 자동으로 돈다. -->