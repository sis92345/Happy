<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>

	<!-- 방법 1 -->
<%-- <body style="background-color: lime; color: crimson;">
	<img src="images/autumn.jpg">
	<br>
	<%="Error : "exception.getMessage() %>
</body> --%>
	<!-- 방법 2 -->
	<%-- <%if(exception instanceof NumberFormatException){%>
			<body style="background-color: yellow; color: crimson;">
				<div><%="frist와 second 변수의 값이 없습니다."%></div>
				<img src="images/autumn.jpg">
			</body>
		<%}else if(exception instanceof ArithmeticException){%>
			<body style="background-color: lime; color: crimson;">
				<div><%="frist와 second 변수의 값은 0이면 안됩니다."%></div>
				<img src="images/autumn.jpg">
			</body>
			<%}else if(exception instanceof NullPointerException){%>
				<body style="background-color: orange; color: crimson;">
					<div><%="frist와 second 변수의 값은 null입니다."%></div>
					<img src="images/autumn.jpg">
				</body>
				<%}else{%>
		//Exception 규칙 알기
					<body style="background-color: margenta; color: crimson;">
						<div><%="치명적인 오류가 발생했습니다. 다시 시도해 주세요"%></div>
						<img src="images/autumn.jpg">
					</body>
					<%}%> --%>
	<!-- 방법 3 -->
	<body style="background-color: lime; color: crimson;">
	<img src="images/autumn.jpg">
	<br>

	<p style="text-align: center">이런! 현재 해당 사이트를 이용할 수 없습니다. 다시 이용해 주세요</p>