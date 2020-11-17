<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h3>JSTL Catch</h3>
<c:catch var="myerror"> <!-- 에러가 발생하면 myerror에 담는다. -->
<%=10/0%>
</c:catch>
<c:if test="${empty myerror}"> <!-- myerror가 true: myerror가 없다. -->
	<c:out value="<scan style='color:green'>잘 처리 되었습니다.</span> <br> ${myerror}" default=" " escapeXml="false"/>
</c:if>
<c:if test="${not empty myerror}"> <!-- myerror가 true: myerror가 있다: 에러 발생 -->
	<c:out value="<scan style='color:green'>잘 처리 되지 않았습니다.</span> ${myerror}" escapeXml="false"/>
</c:if>
<%-- <c:out value="${10/0}" /> --%>