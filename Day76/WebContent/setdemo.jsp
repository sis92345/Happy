<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>Request Package Header Information</h1>
<hr>
<h3>set: el 사용</h3>
<%-- <%
	String userAgent = request.getHeader("user-agent");
	out.print(userAgent);	
%> --%>
<%="EL에서 get 메소드는 get 빼고 첫번째 소문자" %> <br>
${header['user-agent']}
<hr>
<h3>JSETL set: var value attribute</h3>
<c:set var="myvariable" value="${header['user-agent']}"/>
<c:out value="${myvariable}" />
<hr>
<h3>JSETL set: property target attribute</h3>
<jsp:useBean id="today" class="java.util.Date" />
<%="EL에서 get 메소드는 get 빼고 첫번째 소문자: Date getYear를 EL에서 사용하려면 그냥 year" %>
<c:set var="today_year" property="year" target="${today}" value="${today.year}"/> <br>
금년은 <c:out value="${today_year + 1900}" />
<hr>
<h3>다양한 bean, property 출력 방법</h3>
<jsp:useBean id="mybean" class="com.example.libs.model.ColorBean" /> 
<jsp:setProperty name="mybean" property="username" value="한지민" />
<c:set var="myColor" target="${mybean}" property="color" value="yellow" />
Your Name : <c:out value="${mybean.username}" /> <br>
Your Name : <jsp:getProperty name="mybean" property="username" /> <br>
Your Name : ${mybean.username} <br>

Your Color : <c:out value="${mybean.color}" /> <br>
Your Color : <jsp:getProperty name="mybean" property="color" /> <br>
Your Color : ${mybean.color} <br>