<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.example.libs.model.UserInfo"%>
<h1>Java Bean과 EL</h1>
<!-- scope는 나두면 page: 즉 page scope -->
<jsp:useBean id="user" class="com.example.libs.model.UserInfo"></jsp:useBean>
<jsp:setProperty property="name" name="user" value="한지민" />
<jsp:setProperty property="gender" name="user" value="female" />
<!-- setAge할 때 자동 형변환 -->
<jsp:setProperty property="age" name="user" value="24" />
<jsp:setProperty property="address" name="user" value="서울시 강남구 역삼동" />
<%
	pageContext.setAttribute("USERINFO", user);
	UserInfo jimin = (UserInfo)pageContext.getAttribute("USERINFO");
%>
<ul>
	<!-- 기존의 방법 -->
	<li>이름 : <%=jimin.getName()%></li>
	<li>나이 : <jsp:getProperty property="name" name = "user" /></li>
	<!-- EL의 방법 -->
	<!-- EL에서 메소드 쓸꺼면 get을 빼고 그 다음을 소문자로 하면 됨 -->
	<li>성별 : ${user.gender}</li>
	<li>주소 : ${user.address}</li>
</ul>