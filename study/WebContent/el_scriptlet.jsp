<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
 	out.println("-----------내장 객체 이용-----------<br>");
	out.println("기존 JSP에서는 OUT 내장 객체를 이용하여 출력합니다.<br>");
	out.println("그래서 자바 코드와 HTML 코드가 섞인 모습입니다.");
	String name1 = request.getParameter("name1");
	String name2 = request.getParameter("name2");
	if(name1 == null){
		name1 = "Null!";
	}
	if(name2 == null){
		name2 = "Null!";
	}
	String result = name1 + name2;
	out.println("<br>Cookie<br>");
	Cookie[] ck = request.getCookies();
	Cookie c = ck[1];
	out.println(c.getName() + " : " + c.getValue()); 
	request.setCharacterEncoding("utf-8");
	String[] array = request.getParameterValues("hobby");
	out.println("<br/>");
	for(int i=0;i<array.length;i++){
		
		out.println(array[i]);
	}
	
%>
<p>넘어온 값: <%=result %></p>
<hr/>	
${"-----------EL 이용-----------"}
<br/>
${"하지만 EL에서는 자바코드 없이 편하게 받을 수 있습니다."}
<br/>
${"넘어온 값: "}${param.name1 + param.name2}
<p>Cookie</p><br/>
<p>Cookie</p><br/>
${cookie.username.name}:${cookie.username.value}
<hr> 
<h1>EL SCOPE</h1>
${"page:"}${pageScope.scope}<br/>
${"request:"}${requestScope.scope}<br/>
${"session:"}${sessionScope.scope}<br/>
${"application:"}${applicationScope.scope}<br/>
<hr> 
<h1>paramValue</h1>
${paramValues.hobby[0]}
${paramValues.hobby[1]}
${paramValues.hobby[2]}
${paramValues.hobby[3]}




