<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="student" class="com.example.libs.model.StudentVO" />
<jsp:setProperty property="*" name="student"/>
<jsp:useBean id="insert" class="com.example.libs.service.InsertService" />
<%
	int row = insert.insertStudent(student);
	if(row == 1){
		response.sendRedirect("list.jsp");
	}else{%>
	<script>
		alert("학생입력실패");
		history.go(-1);
	</script>
<%} %>
		
