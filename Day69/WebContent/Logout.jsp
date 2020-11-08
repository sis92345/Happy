<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.HashMap"%>
<%
	String username = null;
	HashMap<String, Object> map = (HashMap<String, Object>)session.getAttribute("mysession");
	//session이 null이면 로그인을 안한 것
	if(map == null){%>
		<script>
			alert("먼저 로그인부터 하셔야 합니다.");
			location.replace("Login.html");
		</script>
	<%}else{
		username = (String)map.get("USERNAME");
	}
	response.setCharacterEncoding("UTF-8");
	//제일먼저 유저가 로그인 했는지 확인: 쿠키로 확인
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
		<%=username %>님! 그동안 만족하셨나요? 다음에 또 만나요!
	</div>
<%
	//브라우저의 캐시를 지운다: 잘 안되긴 함
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 0L);
	session.invalidate();
%>
</body>
</html>