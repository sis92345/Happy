<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="mylib" uri="WEB-INF/tlds/mydate.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Custom tag: Define Attribute</title>
</head>
<body>
	Now is <mylib:date2 fg="red" bg="lime"/> <!-- 속성이용 -->
	<br />
	Now is <mylib:date2 fg="red"/> <!-- 디폴트값 -->
</body>
</html>