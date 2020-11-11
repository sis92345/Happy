<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.example.libs.model.StudentVO" %>
<%
	//String path = application.getRealPath("/WEB-INF/oracle.properties");
	//Java Bean
%>
<jsp:useBean id="service" class="com.example.libs.service.SelectService" />
<%-- <jsp:setProperty name="service" property="path"  value="<%=path %>"  /> --%>
<%
	ArrayList<StudentVO> list = service.selectAll(); //service단의 selectAll()를 호출
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome To 쌍용고등학교</title>
<link rel="stylesheet" href="css/bootstrap.css">
<style>
	body{
		background-color: #dbf6e9;
	}
	#tableInput1, #tableInput2{
		background-color: #dbf6e9; 
		color: black;
	}
	#resultTable, th, td{
		text-align: center;
		background-color: white;
	}
	tr:hover{
		font-size: 1.2em;
		font-weight: bold; 
	}	
</style>
</head>
<body>
	<h1 class="text-center">쌍용고등학교 성적관리프로그램</h1>
	<!-- 
	반응형웹 준비물 
	1. 테이블
	div 구조와 class를 참고
	
	-->
	<div class="container">
		<div class="row">
			<table border=0 class="table table-striped">
				<tr >
					<td class="text-left" id="tableInput1"><a href="input.html">[입력하기]</a></td>
					<td class="text-right" id="tableInput2">(<%=(list == null)? "0": list.size() %>)명</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<table class="table table-bordered" id="resultTable">
				<thead class="text-center">
					<tr class="info">
						<th>등수</th>
						<th>학번</th>
						<th>이름</th>
						<th>국어</th>
						<th>영어</th>
						<th>수학</th>
					</tr>
				</thead>
				<tbody>
					<%if(list == null) {%>
						<!-- list가 null: 학생이 없다. -->
						<tr>
							<td colspan="6">현재 학생이 없습니다.</td>
						</tr>
					<%}else{ %>					
							<!-- 학생이 있다면: list에서 값을 뽑아온다. -->
							<%
								for(int i=0;i<list.size();i++){
									StudentVO std = list.get(i);
									String hakbun = std.getHakbun();
									if((i%2)==0){
							%>
									<tr class="success">
										<td><%=i+1 %></td>
										<td><a href="view.jsp?hakbun=<%=hakbun %>"><%=std.getHakbun() %></a></td>
										<td><%=std.getName() %></td>
										<td><%=std.getKor() %></td>
										<td><%=std.getEng() %></td>
										<td><%=std.getMat() %></td>
									</tr>
								<% }else{ %>
									<tr>
										<td><%=i+1 %></td>
										<td><a href="view.jsp?hakbun=<%=hakbun %>"><%=std.getHakbun() %></a></td>
										<td><%=std.getName() %></td>
										<td><%=std.getKor() %></td>
										<td><%=std.getEng() %></td>
										<td><%=std.getMat() %></td>
									</tr>
							<%}//ifend %>
						<%}//forend %>
					<%} //ifend%>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>
