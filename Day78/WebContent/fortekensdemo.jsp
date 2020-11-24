<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="today" value="<%=new Date() %>"/>
<c:forTokens items="${today}" delims=" :" var="myVariable"> <!-- 공백 기준 + : 으로 파싱:  delims=" :"-->
	<c:out value="${myVariable}" /> <br />
</c:forTokens>