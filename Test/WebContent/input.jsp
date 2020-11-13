<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="salary" class="com.example.libs.model.SalaryVO" />
<jsp:setProperty property ="*" name= "salary" />
<jsp:useBean id="insert" class="com.example.libs.service.insertservice" />
<%
	int row = insert.insertSalary(salary);
	if(row ==1){
		response.sendRedirect("index.jsp"); %>
		<script>
		alert("Data Insert Success!");
		</script>

<%}%>