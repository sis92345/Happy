<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="aaa" uri="/WEB-INF/tlds/ccc.tld" %> <!-- 해당 접두사를 만나면 ccc.tld를 참조한다. --> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Custom tag 개요</title>
</head>
<body>
	<aaa:bbb /><br /> <!-- 브라우저는 커스텀 태그 정의를 안할 경우 태그를 XML로 본다. -->
	<%-- <jsp:forword page="aaa.jsp"/ > --%><!-- SKIP_PAGE: 이 다음에 나오는 페이지를 생략: h1 태그 안나옴 -->
	<h1>Custom Tag Example</h1> <!-- SKIP_PAGE면 미처리, EVAL_PAGE를 처리 -->
</body>
</html>