<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<sql:setDataSource dataSource="jdbc/myoracle" var="conn"/>
<sql:query var="rs" dataSource="${conn}">
	SELECT empno, ename, job, sal, dname, loc, deptno
	FROM emp NATURAL JOIN dept
	ORDER BY empno
</sql:query>
<c:set var="str" value="" />
<c:forEach items="${rs.rows}" var="row">
	<c:set var="str" value="${str + \"{\"}" />
	<c:set var="str" value="${str + \"empno\":row.empno,}" />	
	<c:set var="str" value="${str + \"ename\":row.ename,}" />	
	<c:set var="str" value="${str + \"job\":row.job,}" />	
	<c:set var="str" value="${str + \"sal\":row.sal,}" />	
	<c:set var="str" value="${str + \"dname\":row.dname,}" />	
	<c:set var="str" value="${str + \"loc\":row.loc,}" />	
	<c:set var="str" value="${str + \"deptno\":row.deptno}" />	
	<c:set var="str" value="${str + \"},\"}" />
</c:forEach>
<c:set var="str" value="${fn:substring(str,0,fn:length(str)-1}" />
<%-- {
	"code":"success",
	"data"": [${str}]
} --%>