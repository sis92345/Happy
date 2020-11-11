<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.example.libs.model.StudentVO" %>
<jsp:useBean id="select" class="com.example.libs.service.SelectService" />
<%
	String hakbun = request.getParameter("hakbun");
	StudentVO std = select.select(hakbun);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 상세 보기</title>
<link rel="stylesheet" href="css/bootstrap.css" />
<script src="js/jquery-3.5.1.js"></script>
<script>
	$(document).ready(function(){
		$('#btnList').on('click', function(){
			location.href = "list.jsp";
		});
		$('#btnDelete').on('click', function(){
			if(confirm("정말 삭제하시겠습니까?")){
				location.href = "delete.jsp?hakbun=<%=hakbun%>";
			}else history.go(0);
		});
		$('#btnUpdate').on('click', function(){
			if(confirm("정말 수정하시겠습니까?")){
				location.href = "update.jsp?hakbun=<%=hakbun%>";
			}else history.go(0);
		});
	});
</script>
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
	<div  class="container">
		<div class="row">
			<h1 class="text-center">
			<%= std.getName()%>
			(<%= std.getHakbun() %>)'s Information
			</h1>
			<ul>
				<li>국어 : <%=std.getKor() %></li>
				<li>영어 : <%=std.getEng() %></li>
				<li>수학 : <%=std.getMat() %></li>
				<li>총점 : <%=std.getTot() %></li>
				<li>평균 : <%=std.getAvg() %></li>
				<li>평점 : <%=std.getGrade() %></li>
			</ul>
			<div class="text-right">
				<button type = "button" class="btn btn-info" id="btnList">목록으로</button>
				<button type = "button" class="btn btn-success" id="btnUpdate">수정하기</button>
				<button type = "button" class="btn btn-danger" id="btnDelete">삭제하기</button>
			</div>
			<%
			Cookie c = new Cookie("flag", "true");
			
			%>
			
		</div>
	</div>
</body>
</html>

