<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="delete" class="com.example.libs.service.DeleteService" />
<%
	String hakbun = request.getParameter("hakbun");
	int row = delete.deleteStudent(hakbun);
	if(row==1){
		response.sendRedirect("list.jsp");
	}else {%>
	<script>
		alert("데이터 삭제 실패");
		history.go(-1);
	</script>
<%} %>	
