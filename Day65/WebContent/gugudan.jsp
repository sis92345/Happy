<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h1 {
		text-align: center;
	}
	table {
		border: 1px solid aqua;
		width: 400px;
		margin-left: auto;
		margin-right: auto;
		border-collapse: collapse;
	}
	td, th {
		border: 1px solid aqua;
		text-align: center;
	}
	th {
		background-color: palegreen;
		width: 100px;
		color: hotpink;
	}
	td:nth-last-of-type(2n) {
		background-color: gold;
	}
	
</style>
</head>
<body>
	<h1>Gugudan</h1>
	<table border='1'>
		<tr>
			<%for(int i=2;i<6;i++) {%>
				<th><%=i %>단</th>
			<%}%>
		</tr>
		<tr>
			<%for(int i=2;i<6;i++) {%>
				<td>
					<%for(int j=1;j<10;j++) {%>
						<%=i %> * <%=j %> = <%=i * j%><br>
					<%}%>
				</td>
			<%}%>
		</tr>
		<tr>
			<%for(int i=6;i<10;i++) {%>
				<th><%=i %>단</th>
			<%}%>
		</tr>
		<tr>
			<%for(int i=6;i<10;i++) {%>
				<td>
					<%for(int j=1;j<10;j++) {%>
						<%=i %> * <%=j %> = <%=i * j%><br>
					<%}%>
				</td>
			<%}%>
		</tr>
	</table>
</body>
</html>