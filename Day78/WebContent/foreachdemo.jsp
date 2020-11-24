<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
 body{
		background-color: #dbf6e9;
	}
  input:hover{
    background-color: #9ddfd3;
  }
  input:focus{
    background-color: #ffdada;
  }
  table{
  	width:1400px;
  	margin-left: auto;
  	margin-right: auto;
  	text-align: center;
  	border="1px solid black;
  }
  tr, th, td{
  	border="1px solid black;
  }
</style>
<!-- 
	JSTL의 반복문: FOREACH
	- var: 변수
	- begin: 시작 값
	- end: 끝 값
	- step: 증가 값
 -->
 <%-- <c:set var="count" value="0" />
 <c:forEach var="i" begin="1" end="100">
 	<c:if test="${(i mod 7) eq 0}">
 		<c:out value="${i}" /> &nbsp;&nbsp;&nbsp;
 		<c:set var="count" value="${count + 1}" />
 		<c:if test="${(count mod 4) eq 0}">
 			<br />
 		</c:if>
 	</c:if>
 </c:forEach> --%>
 <h2>구구단</h2>
 <table>
 	<thead>
 		<tr>
 				<c:forEach var="i" begin="2" end="5">
	 				<th>${i}단</th>
 				</c:forEach>
 		</tr>
 	</thead>
 	<tbody>
 		<c:forEach var="i" begin="2" end="5">
 		<td>
 			<c:forEach var="j" begin="1" end="9">
 				${i} X ${j} = ${i*j}<br />
 			</c:forEach>
 		</td>
 	 	</c:forEach>
 	</tbody>
 	 
 </table>
