<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.setAttribute("num1", new Integer(5));
	session.setAttribute("num2", 6); //Auto Boxing: new Integer(6)
%>
<!-- 기존의 방법 -->
<%-- num1 : <%=(Integer)session.getAttribute("num1")%> <br> --%>
<!-- EL이용 -->
num1 : ${sessionScope['num1']}
num2 : ${sessionScope['num2']}
<!-- \는 Escaping 문자: 문자로본다.--> 
<h1>\${sessionScope.num1} + \${sessionScope.num2}의 5칙 연산</h1>
${sessionScope.num1 + sessionScope.num2} <br>
${sessionScope.num1 - sessionScope.num2} <br>
${sessionScope.num1 * sessionScope.num2} <br>
${sessionScope.num1 div sessionScope.num2} <br>
${sessionScope.num1 mod sessionScope.num2} <br>
${sessionScope.num1 eq sessionScope.num2} <br>
${sessionScope.num1 ne sessionScope.num2} <br>
${sessionScope.num1 lt sessionScope.num2}<br>