<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, java.util.Hashtable, java.util.Arrays, java.util.HashMap"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="array" value="<%=new int[]{1,2,3,4,5,6,7,8} %>" /> <!-- 자바스크립트에서 배열은 대괄호 -->
<c:forEach items="${array}" var="i">
	<c:out value="${i}" />
</c:forEach>
<hr />
<!-- Arrays -->
<!-- asList(T.. ): 파라미터를 List로 반환-->
<c:set var="list" value="<%=Arrays.asList(1,2,3,4,5) %>" />
<c:forEach items="${list}" begin="1" end="5">
	<c:out value="${list}" />
</c:forEach>
<hr />

<c:forEach items="<%=System.getProperties() %>" var="myProperty">
	<c:out value="${myProperty.key}" /> : 
	<span style='color:red;'><c:out value=" ${myProperty.value}"/></span> <br />
</c:forEach>
<hr />
<%
	Hashtable<String, Integer> ht = new Hashtable<String, Integer>();
	ht.put("Jpn",1); ht.put("Feb",2); ht.put("Mar",3);
	ht.put("Apr",4); ht.put("May",5); ht.put("Jun",6);
	ht.put("Jul",7); ht.put("Avg",8); ht.put("Sep",9);
	ht.put("Oct",10); ht.put("Nov",11); ht.put("Dec",12);
%> 
<c:forEach items="<%=ht%>" var="my" begin="0" end="<%=ht.size()%>">
	<c:out value="${my.key}"/> =>
	<span style='color:red;'><c:out value="${my.value}"/></span> <br />
</c:forEach>
<hr />
<%
	HashMap<String, Object> std = new HashMap<String, Object>();
	std.put("학번", "2020-01"); 
	std.put("이름", "한지민");
	std.put("나이", 24);
	std.put("전화번호", "010-1234-5678");
	std.put("주소", "서울시 강남구 역삼동 한독빌딩");
	std.put("생일", new java.util.Date());
%>
<c:set var="student" value="<%=std %>"/>
<c:forEach items="${student}" var="hash">
	<c:out value="${hash.key}" /> => 
	<span style='color:blue;'><c:out value="${hash.value}"/></span> <br />
</c:forEach>