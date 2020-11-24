<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>SCOPE MAIN</h1>
	<div>
		당신이 보내고자 하는 속성의 유형을 선택하세요
	</div>
	<form action="SCOPE.jsp">
		<select name="type">
		<option value="application">application</option>
		<option value="session">session</option>
		<option value="page">page</option>
		<option value="request">request</option>
	</select>
	<input type="submit" value="제출하기">
	</form>
	
</body>
</html>