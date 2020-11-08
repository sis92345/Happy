<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.HashMap"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie Set</title>
</head>
<body>
	<h1>Session Set</h1>
	<%
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("NAME", new String("한지민"));
		map.put("AGE", new Integer(24));
		map.put("ADDRESS", "서울시 강남구 역삼동 한독빌딩 8층");
		//session은 객체를 넣을 수 있다.
		session.setAttribute("mysession", map);
		/* response.sendRedirect("SessionGet.jsp"); */
	%>
	<div>
		방금 세션이 저장됐습니다.
		http://www.example.com/Day69/CookieGet.jsp로 다시 접속해서 확인하세요
	</div>
	<!-- 
	session: 밑에꺼 알아보기 

	-->
	<a href=<%=response.encodeURL("SessionGet.jsp") %>>SessionGet</a>
</body>
</html>