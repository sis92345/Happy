<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*"%>
<%@ page import="com.example.libs.model.*" %>
<%
	String path = application.getRealPath("/WEB-INF/oracle.properties");
	//실제 경로를 넣는다.
	DBConnection dbconn = new DBConnection(path);
	Connection conn = dbconn.getConnection();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%=path %>
	<%=conn %>
</body>
</html>
<%
	DBClose.close(conn);
%>