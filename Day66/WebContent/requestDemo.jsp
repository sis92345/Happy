<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	request
	1. Client에 관련된 정보를 읽는다: 클라이언트의 OS, IP, Brower
	2. Server와 관련된 정보를 읽는다.
	3. Client가 전송한 파라미터를 읽는다.
	4. Client가 전송한 Header정보를 읽는다
	5. Client의 Cookie 정보를 읽는다.
	6. 속성에 관한 정보를 관리한다.
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request 내장 객체 연습</title>
</head>
<body>
	<ul>
		<!-- scriptlet의 경우 ;를 사용해야한다. 자바코드이기 때문, 하지만 Expression의 경우 Servelt 변환 과정에서 자동으로 ; 붙여주기 때문에 ;를 붙이지 않는다. -->
		<li>요청 메소드 : <%=request.getMethod() %></li>
		<li>요청 URI : <%=request.getRequestURI() %></li>
		<li>요청 URL : <%=request.getRequestURL() %></li>
		<li>요청 ServerName :<%=request.getLocalName() %> </li>
		<li>요청 ServerPort : <%=request.getLocalPort() %></li>
		<li>요청 ContextPath : <%=request.getContextPath() %></li>
		<li>Client IP : <%=request.getRemoteAddr() %></li>
		<li>Client Machine : <%=request.getRemoteHost() %></li>
		<li>Client User : <%=request.getRemoteUser() %></li>
		<li>Client Port : <%=request.getRemotePort() %></li>
		
		
		
	</ul>
	
</body>
</html>