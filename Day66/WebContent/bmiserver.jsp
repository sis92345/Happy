<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String username = request.getParameter("username");
	int userage = Integer.parseInt(request.getParameter("age"));
	double height = Double.parseDouble(request.getParameter("height")) /100;
	double weight = Double.parseDouble(request.getParameter("weight"));
	String color = null;
	String st = null;
	//계산하기
	//체중/키m^2
	double result = weight / Math.pow(height, 2);

	//색
	if(result > 40){
		color = "RED";
		st = "고도비만";
	}else if(result <= 39.9 &&  result >= 35){
		color = "ORANGE";
	}else if(result <= 34.9 &&  result >= 30){
		color = "YELLOW";
	}else if(result <= 29.9 &&  result >= 25){
		color = "GREEN";
	}else if(result <= 24.9 &&  result >= 18.5){
		color = "BLUE";
	}else{
		color = "PURPLE";
	}
%>

<%
	out.println("<style>");
	out.println("#bmi{background-color:" + color +"; font-size: 2em; color: white}");
	out.println("</style>");
%>
<%
	out.println("<ul>");
	out.println("<li> 이름: " + username + "</li>");
	out.println("<li> 나이: " + userage + "</li>");
	out.println("<li> 키: " + (height * 100) + "</li>");
	out.println("<li> 몸무게: " + weight + "</li>");
	out.println("<li id ='bmiLi'> 당신의 BMI 지수는 <span id = 'bmi'> " + result + "</span>입니다.</li>");
	
	out.println("</ul>");
%>