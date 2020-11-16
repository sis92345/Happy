<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date"%>
<!-- 
	taglibs
	- prefix: `:`를 중심으로 `:`앞의 접두사를 만나면..
	- uri: 해당 문서를 확인하시오
	- 새로 만든 태그는 전부 `/WEB-INF/tlds`아래에 있어야 한다.
 -->
<%@ taglib prefix="eldemo" uri="/WEB-INF/tlds/el-functions.tld" %>
<%
	pageContext.setAttribute("TODAY", new Date());
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport">
    <title>Document</title>
</head>
<body>
    <!-- EL의 클래스 정적 메소드 사용4 -->
    <!-- eldemo:mymethod(TODAY)를 만나면 브라우저는 eldemo를 어떻게 랜더링 하는지 묻는데 taglib를 이용-->
    <h3>Now is ${eldemo:mymethod(TODAY)}입니다.</h3>
</body>
</html>