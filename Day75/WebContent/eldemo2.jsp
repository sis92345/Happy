<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Enumeration"%>
<%
	Enumeration<String> list = request.getHeaderNames();
%>
<h1>기존의 Header를 읽는 방법</h1>
<ul>
	<%while(list.hasMoreElements()){
	String name = list.nextElement();%>
			<li><%=name%>   : <%=request.getHeader(name)%></li>
		<%}%>
</ul>
<!-- EL 이용: 코드는 간단해지만 복수로 들어오는 헤더 정보에는 약하다. -->
<hr>
<h1>EL을 이용하는 방법</h1>
<ul>
	<li>Host : ${header['host']}</li>
	<li>User-Agent : ${header['User-Agent']}</li>
	<li>accept : ${headerValues['accept'][0]} ${headerValues['accept'][1]}</li>
	<li>accept-language : ${headerValues['accept-language'][0]}</li>
</ul>