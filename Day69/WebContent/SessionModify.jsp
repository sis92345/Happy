<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.HashMap"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie Modify</title>
</head>
<body>
	<!-- 세션의 수정: 덮어쓰면된다. -->
	<%
		HashMap<String, Object> map =  (HashMap<String, Object>)session.getAttribute("mysession");
		if(map == null){
			response.sendRedirect("SessionSet.jsp");
		}
		String address = (String)map.get("ADDRESS");
		address = "부산시 해운대구 해운대동 해운대 오피스텔 11호";
		map.put("ADDRESS", address);
		response.sendRedirect("SessionGet.jsp");
	%>
	<div>방금 세션이 수정됬습니다.</div>
</body>
</html>