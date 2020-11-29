<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<c:set var="deptno" value="${param.deptno}"/>
<sql:setDataSource dataSource="jdbc/myoracle" var="conn"/>
<sql:query dataSource="${conn}" var="rs">
	SELECT empno, ename, dept.deptno, dname, loc, sal
	FROM emp INNER JOIN dept ON emp.deptno = dept.deptno
	WHERE emp.deptno = ?
	ORDER BY emp.deptno
	<sql:param value="${deptno}"/>
</sql:query>
<table>
	<thead>
		<tr>
			<th>사원번호</th>
			<th>사원이름</th>
			<th>부서번호</th>
			<th>부서이름</th>
			<th>부서위치</th>
			<th>사원급여</th>
		</tr>
	</thead>
	<tbody>
			<c:forEach items="${rs.rows}" var="row">
				<tr>
					<td>${row.empno}</td>
					<td>${row.ename}</td>
					<td>${row.deptno}</td>
					<td>${row.dname}</td>
					<td>${row.loc}</td>
					<td>${row.sal}</td>
				</tr>
			</c:forEach>
	</tbody>  
</table>

  <select id="selDeptno">
		<option value="">--부서번호--</option>
		<c:forEach items="${rs.rows}" var="row">
			<option value="${row.ename}">${row.ename}</option>
		</c:forEach>
  </select>