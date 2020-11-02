<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	//static 변수
	static String msg = "Hello, JSP";
	int result = add(5,9);
%>
	값은 <%=result %> 입니다.
<%
	//지역변수
	String msg = "Hello, JSP!!!";
	
	//자바는 메소드안에 메소드를 만들 수 없다.
	//int add(int a, int b){
	//	return a + b;
	//}
	
%>
<%!	
	//메소드는 Declaration을 이용해야한다.
	int add(int a, int b){
		return a + b;
	}
	
%>