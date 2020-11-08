<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.HashMap"%>
<%
	String username = null;
	HashMap<String, Object> map = (HashMap<String, Object>)session.getAttribute("mysession");
	//session이 null이면 로그인을 안한 것
	if(map == null){%>
		<script>
			alert("먼저 로그인부터 하셔야 합니다.");
			location.replace("Login1.html");
		</script>
	<%}else{
		username = (String)map.get("USERNAME");
		
	}
	response.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome!</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<div>
		<%=username %>님! 환영합니다!
	</div>
	<div>
		회원만이 누리는 환상적인 서비스를 기대하세요.
	</div>
	<div>
		<a href="Logout.jsp">Logout</a>
	</div>
</body>
</html>