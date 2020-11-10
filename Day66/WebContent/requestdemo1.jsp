<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.Enumeration"  %>
<%
	/* 
	POST방식은 setContentType을 넣어야 한다: GET은 자동이지만 POST는 자동 아님 
	request.setCharacterEncoding("utf-8");를 이용한다.
	*/
	/* request.setCharacterEncoding("utf-8"); */
	Enumeration<String> names =  request.getParameterNames();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 결과</title>
<%if(request.getRemoteAddr().equals("0:0:0:0:0:0:0:1")){%>
<link rel="stylesheet" href="css/style2.css">
<%} else{%>
<link rel="stylesheet" href="css/style.css">
<%}%>
</head>
<body>
	<ul>
		<!-- 
		POST방식은 setContentType을 넣어야 한다: GET은 자동이지만 POST는 자동 아님 
		-->
		
		<%while(names.hasMoreElements()) {
			String name = names.nextElement();
			String hp="";
			//hobby는 복수로 들어온다.
			//나머지는 단수로 들어온다.
			if(!name.equals("hobby")){
				String value = request.getParameter(name);
				if(!name.equals("gender")){
					if(name.equals("hp1") && name.equals("hp2")){
						hp += request.getParameter("name") + "-";
					}
					out.println("<li>" + name + " : " + value + "</li>");
				}else{
					if(value.equals("0")){
						out.println("<li>" + name + " : " + "남성" + "</li>");
					}else{
						out.println("<li>" + name + " : " + "여성" + "</li>");
					}
				}
				
	
			}else{
				String[] values = request.getParameterValues(name);
				String hobby = "";
				if(values == null || values.length == 0){
					hobby = "";
				}else{
					//user가 한개라도 선택했다면
					for(int i = 0; i< values.length; i++){
						hobby += values[i] + ",";
					}
					hobby = hobby.substring(0, hobby.length()-1);
				}
				out.println("<li>" + name + " : " + hobby + "</li>");		
			}	
		}
		out.println("접속 IP: " + request.getRemoteAddr());
		%>
	</ul>
</body>
</html>