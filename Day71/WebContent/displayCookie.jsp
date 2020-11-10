<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder" %>
<%
	Cookie[] array = request.getCookies();
	if(array != null && array.length >= 0){
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie Display</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
&nbsp;&nbsp;&nbsp;&nbsp;쿠키 이름 : 쿠키 값 <br>
&nbsp;&nbsp;&nbsp;&nbsp;=============== <br>

	
		<%for(int i=0;i<array.length;i++){
			Cookie cookie = array[i];
			//UTF-8로 인코딩하고 디코딩해야한다.
			String cookie_name = cookie.getName();
			cookie_name = URLDecoder.decode(cookie_name, "UTF-8");
			if(!cookie_name.equals("JSESSIONID")){
		%>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=cookie_name %> : <%=array[i].getValue() %> <br />			
		<%
			}//IF END
		}//FOR END%>
		<a href="InputCookie.html">쿠키 입력 화면으로</a>
	

</body>
</html>
<% } else{%>
	<body>
		<script>
			alert("Cookie가 전혀 없습니다.");
		</script>
	</body>
<%}%>