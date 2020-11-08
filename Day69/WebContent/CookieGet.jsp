<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	private String getCookieValue(String name, Cookie [] array){
		String value = "";
		if(array == null) {
			return "";
		}else{
		for(int i=0;i<array.length;i++){
			if(array[i].getName().equals(name)){
				value = array[i].getValue();
			}
		}
		}
		return value;
	}

%>
<%
	Cookie[] array = request.getCookies(); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie Get</title>
</head>
<body>
	<h1>Cookie Get</h1>
	<ul>
		<li>이름 : <%=this.getCookieValue("NAME", array)%></li>
		<li>나이 : <%=this.getCookieValue("AGE", array)%></li>
		<li>주소 : <%=this.getCookieValue("ADDRESS", array)%></li>
	</ul>
	<p>아래 버튼 누른 후 새로고침을 눌러야 한다.</p>
	<div>
		<button onclick="javascript:location.href='CookieSet.jsp'">Cookie Set</button>
		<button onclick="javascript:location.href='CookieModify.jsp'">Cookie Modify</button>
		<button onclick="javascript:location.href='CookieDelete.jsp'">Cookie Delete</button>
	</div>
</body>
</html>