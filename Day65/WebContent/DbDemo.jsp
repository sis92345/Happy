<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
//scriptlet: 에러처리를 안한다, errorPage가 담당
	Class.forName("com.mysql.jdbc.Driver");//2
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/world?serverTimezone=Asia/Seoul", "root", "javamysql");//3
	Statement stmt  = conn.createStatement();//4
	String sql = "SELECT deptno, dname, loc FROM test.dept";
	ResultSet rs = stmt.executeQuery(sql); //5	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<!-- MySQL, Test Database  -->
	<h1>www.example.com's Department List</h1>
	<ul>
			<%while(rs.next()){%>
				<li><%= rs.getInt("deptno")%>,
				    <%= rs.getString("dname")%>,
				    <%= rs.getString("loc")%></li>
			<%}%>
		
	</ul>
</body>
</html>
<%
	if(rs != null) rs.close();
	if(stmt != null) stmt.close();
	if(conn != null) conn.close();

%>