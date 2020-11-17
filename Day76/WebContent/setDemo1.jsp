<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h3>application scope</h3>
<jsp:useBean id="cnt" class="com.example.libs.model.CountBean" scope="application" />
<c:set var="mycount" property="count" target="${cnt}"/>
방문자 수 : <c:out value="${cnt.count}" /> <!-- cnt.getCount() -->