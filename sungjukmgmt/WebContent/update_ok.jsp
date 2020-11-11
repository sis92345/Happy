<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="student" class="com.example.libs.model.StudentVO" />
<jsp:setProperty property="*" name="student"/>
<jsp:useBean id="update" class="com.example.libs.service.UpdateService" />

<%
	//String path = application.getRealPath("/WEB-INF/oracle.properties");
%>
<%-- <jsp:setProperty property="path" name="update" value="<%=path %>" /> --%>

<%
	int row = update.UpdateStudent(student);
	if(row==1){
		response.sendRedirect("view.jsp?hakbun=" + student.getHakbun());
	}else {%>
	<script>
		alert("데이터 수정 실패");
		history.go(-1);
	</script>
<%} %>	
