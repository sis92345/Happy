<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 
	pageContext
	1. 기본객체(내장객체) 구하기
	2. 속성 다루기(페이지 기본값)
	3. 페이지의 흐름을 구한다(include, forward) : cf)RequestDispatcher interface
-->
<!-- 기본객체를 다뤄야하는 이유 -->
<%!
	//Declaration에서는 내장 객체를 인식하지 않는다.
	//out.println("Hello, world"); 이거 안돌아감
	//Declaration는 맴버 변수와 메소드를 만들기 위함
	//즉 Declaration은 _jspService()의 밖이다.
	public void printDemo(PageContext pc) throws IOException{
		//pageContext를 이용하여 Declaration안에서 내장 객체의 객체를 생성한다.
		JspWriter out = pc.getOut();
		//request, response의 문제
		// getRequest();/getResonse()는 HttpServletRequest/Response의 부모형인 SerlvetRequest/ServletResponse로 받는다.
		//그걸 형변환하면 됨
		ServletRequest parentRequest = pc.getRequest();
		HttpServletRequest request = (HttpServletRequest)parentRequest;
		out.println("Hello, world");
		out.println("USER'S Address : " + request.getRemoteAddr());
	}
	
%>
<%
	//여기는 _jspServlet() 안의 지역
	//따라서 내장 객체가 인식된다.
	printDemo(pageContext);
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>