<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//쿼리 스트링 작성해서 사용할 것
	int num1 = Integer.parseInt(request.getParameter("num11"));
	int num2 = Integer.parseInt(request.getParameter("num22"));
	int result = num1 * num2;
	pageContext.setAttribute("result", result);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <form method="GET">
		<input type="text" id="num1" name="num1" size="10" value="<%=num1 %>" /> X 
		<input type="text" id="num2" name="num2" size="10" value="<%=num1 %>" /> = 	
		<input type="text" id="answer" size="10" value="${pageScope.result}" />&nbsp;&nbsp; 
		<input type="submit" value="Calculate" id="btnCalc" />
	</form>
</body>
</html>