<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder, java.net.URLDecoder"%>
<%
	Cookie[] array = request.getCookies();
	Cookie cookie = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 쿠키를 읽어오는 jsp-->
	<%
		for(int i = 0;i<array.length;i++){
			Cookie c = array[i];
			if(c.getName().equals("username")){
				//i번째 cookie배열 중 username이라는 name이 있으면 해당 키의 값을 출력
				cookie = c;
			}
		}
	%>
	<h1>읽어온 쿠키 정보</h1>
	<ul>
		<li>Cookie Name : <%=cookie.getName() %></li>
		<li>Cookie Value : <%=URLDecoder.decode(cookie.getValue(), "UTF-8") %></li>
		<!-- URLDecoder.decode(cookie.getValue(), "UTF-8") -->
		<li>Cookie expire Date : <%=cookie.getMaxAge() %></li>
	</ul>
</body>
</html>