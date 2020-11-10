<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String result = request.getParameter("aggrement");
	
	String sessionId = (String)session.getAttribute("id");
	if(sessionId.equals(id)){%>
	<<script>
		alert("이미 사용중인 아이디입니다.");
		history.go(-2);
	</script>
	<%}session.setAttribute("id", id);
	session.setAttribute("name", name);
	response.sendRedirect("result.jsp?result=" + result);
%>