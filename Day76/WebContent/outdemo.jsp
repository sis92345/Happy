<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>JSTL: OUT</h1>
<h1>Request Package Header Information</h1>
<hr>
<h3>scirptlet</h3>
<%
	String userAgent = request.getHeader("user-agent");
	pageContext.setAttribute("userAgent", userAgent);
	out.print(userAgent);	
%>
<hr>
<h3>Expression</h3>
<%=userAgent %>
<hr>
<h3>EL: 자바 필요</h3>	
	${pageScope['userAgent']}
<hr>
<h3>JSTP: OUT 태그는 EL과 많이 겹친다.</h3>
	<c:out value="${pageScope.userAgent}"></c:out>
<hr>
<hr>
<hr>
<hr>
<h3>JSTP: OUT escapexml attribute</h3>
<c:out value="<font color='red'>빨간 글씨</font>는 다음과 같이 출력합니다" /><br /><br />
<c:out value="<font color='red'>빨간 글씨</font>는 다음과 같이 출력합니다" escapeXml = "false" />
<pre>
	true면 태그를 실행하지 않는다.
		- 즉 그대로 나온다.
		- false면 태그를 실행한다.
		- EL은 무조건 태그를 랜더링하지만 JSTL의 OUT은 랜더링 여부를 선택할 수 있다.
</pre>
<%
	String str = "<span style='color:blue;background-color:yellow;font-size:3em'>Hello</span>";
	pageContext.setAttribute("MYTAG", str);
%>
	<c:out value="${pageScope.MYTAG}" escapeXml="true"></c:out> <br>
	<c:out value="${pageScope.MYTAG}" escapeXml="false"></c:out>
<hr>
<hr>
<hr>
<hr>
	<h3>JSTP: OUT default attribute</h3>
	<p>default: null이라면 출력할 값을 지정</p>
	<c:out value="${param.username}" default="NULLNULL널널"></c:out>