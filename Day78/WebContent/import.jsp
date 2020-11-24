<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="/css/bootstrap.css">
<c:import url="/header.html" var="head" scope="session"/> 
<c:import url="fortekensdemo.jsp" var="mytoken" /> 
<c:import url="foreachdemo2.jsp" var="myfor"/> 
<c:import url="/footer.html" var="footer" scope="session"/> 
${head}
${mytoken}
${myfor}
<c:redirect url="importdemo1.jsp" />
${footer}