<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.Connection"  %>
<%@ page import = "java.sql.DriverManager"  %>
<%@ page import = "java.sql.CallableStatement"  %>
<%@ page import = "java.sql.ResultSet"  %>
<%
	String deptnoStr = request.getParameter("deptno");
	int deptno = 0;
	if(deptnoStr == null){
		//null이면 다시 요청한 페이지가 아니라 첫 페이지
		//이 jsp는 자신 페이지로 요청함
		deptnoStr = "";
	}else{
		//두번째 이상 방문한 페이지
		//10, 20, 30이 들어온다.
		deptno = Integer.parseInt(deptnoStr);
	}
	ResultSet rs = null;
	Connection conn = null;
	CallableStatement cstmt = null;
	if(!deptnoStr.equals("")){
		//만약 두번째 페이지라면...
		Class.forName(application.getInitParameter("db.driver")); //2
		conn = DriverManager.getConnection(application.getInitParameter("db.url")
								       				  , application.getInitParameter("db.user")
								    				  , application.getInitParameter("db.password")); //3

		String sql = "{ call sp_test(?)}"; 
		cstmt = conn.prepareCall(sql); //4
		cstmt.setInt(1, deptno);
		rs = cstmt.executeQuery();//5
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Company Department Search</title>
<link rel="stylesheet" href="css/style.css">
<script src = "js/application.js"></script>
</head>
<body>
	<form>
		부서 번호 : <select name = "deptno">
			<option>--options--</option>
			<option value="10" <%if(deptnoStr.equals("10")){
				out.println("selected");
			} %>>ACCOUNTING</option>
			<option value="20" <%if(deptnoStr.equals("20")){
				out.println("selected");
			} %>>RESEARCH</option>
			<option value="30" <%if(deptnoStr.equals("30")){
				out.println("selected");
			} %>>SALES</option>
		</select>
	</form>
	<hr>
	<p>기본적으로 전송되면 HTTP는 페이지를 세로 그린다. 즉 change 이벤트가 발생하여 서버에 요청했다면 페이지가 새로 랜더링, Ajax는 이걸 해결</p>
	<p>ajax 없이 구현하려면 application1.jsp 코드를 참조: 두번째 페이지로 넘어온 파라미터를 받아서 해당 값을 option 태그의 selected 속성을 이용</p>
	<table border="1">
		<thead>
			<th>사원번호</th>
			<th>사원이름</th>
			<th>직무이름</th>
			<th>부서번호</th>
			<th>부서이름</th>
			<th>부서위치</th>
		</thead>
		<tbody>
			<%if(rs != null){ %>
			<%while(rs.next()){%>
				<tr>
					<td><%=rs.getInt("empno") %></td>
					<td><%=rs.getString("ename") %></td>
					<td><%=rs.getString("job") %></td>
					<td><%=rs.getInt("deptno") %></td>
					<td><%=rs.getString("dname") %></td>
					<td><%=rs.getString("loc") %></td>
				</tr>
			<%}%>
			<%} else{%>
			<tr><td colspan="6">No Data</td></tr>
			<%}%>
		</tbody>
	</table>
<%
	//유저에게 다 보여주고 나서 닫아야 한다. 당연하지만 그전에 닫으면 데이터를 받을 수 없으므로
	if(rs != null) rs.close();
	if(cstmt != null) cstmt.close();
	if(conn != null) conn.close();
%>
</body>
</html>