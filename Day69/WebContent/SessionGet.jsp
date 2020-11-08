<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.HashMap"%>
<%
	String username = null;
	Integer userage = null;
	String useraddress = null;
	HashMap<String, Object> map = (HashMap<String, Object>)session.getAttribute("mysession");
	if(map != null){
		username = (String)map.get("NAME");
		userage = (Integer)map.get("AGE");
		useraddress = (String)map.get("ADDRESS");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie Get</title>
</head>
<body>
	<h1>Session Get</h1>
	<ul>
		<li>이름 : <%=(username ==null)  ? "":String.valueOf(username) %></li>
		<li>나이 : <%=(userage == null) ? "":String.valueOf(userage) %></li>
		<li>주소 : <%=(useraddress == null)? "":String.valueOf(useraddress) %></li>
	</ul>
	<p>아래 버튼 누른 후 새로고침을 눌러야 한다.</p>
	<div>
		<button onclick="javascript:location.href='SessionSet.jsp'">session Set</button>
		<button onclick="javascript:location.href='SessionModify.jsp'">session Modify</button>
		<button onclick="javascript:location.href='SessionDelete.jsp'">session Delete</button>
	</div>
</body>
</html>