<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="select" class="com.example.libs.service.SelectService" />
<%
	String result = "false";

	String userid = request.getParameter("userid");
	boolean check = select.idCheck(userid);
	if(check){
		//사용 가능한 아이디라면
		//result1 = "<span class='text-success text-center'>사용 가능한 아이디입니다.</span>";
		result = "true";
	}else{
		//사용 불가능한 아이디라면
		//result1 = "<span class='text-danger text-center'>이미 사용중인 아이디입니다.</span>";
		result = "false";
	}
	//POSTMAN 용
	out.println(result);
%>