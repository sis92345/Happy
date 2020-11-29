<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<sql:setDataSource dataSource="jdbc/myoracle" var="conn" />
<sql:query dataSource="${conn}" var="rs1">
	SELECT	deptno
	FROM	dept
	ORDER BY deptno
</sql:query>
<sql:query dataSource="${conn}" var="rs2">
	SELECT loc
	FROM	dept
	ORDER BY loc
</sql:query>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Get: Employee</title>
<link rel="stylesheet" href="css/bootstrap.css" />
<script src="js/jquery-3.5.1.js"></script>
<script>	
	$(function(){
		let search = null;
		let deptno = null;
		let loc = null;
		$('#selDeptno').on('change',function(){
			search = $(this).val();
			//console.log(search);
			//console.log(typeof search);
		});
		$('#selLoc').on('change',function(){
			search = $(this).val();
			//console.log(search);
		});
		$('#btnSearch').on('click', function(){
			$.ajax({
				method: "POST",
				url: "getData.jsp",
				data:{ //서버에 보낼 데이터
					search : search
				},
				success: function(data){ //서버애서 받아온 데이터
					myparsor(data);
				}
			});
		});
	});
	function myparsor(serverdata){
		let str = "";
		let idx = serverdata.lastIndexOf(",");
		let server = null;
		if(idx > -1) server = serverdata.substring(0, idx) + "]}";  //comma의 위치를 찾았다면
		else server = serverdata;
		
		server = server.trim();
		console.log(server);
		let obj = JSON.parse(server);
		if(obj.code == "failure"){
			str += "<tr>";
			str += "<td colspan='5' class='text-center danger'>No data</td>";
			str += "</tr>";
		}else{
			let array = obj.data;
			for(let i=0;i<array.length;i++){
				str += "<tr class='2th'>";
				str +=	"<td>" + array[i].empno + "</td>" + "<td>" + array[i].ename + "</td>" + "<td>" + array[i].deptno + "</td>" + "<td>" + array[i].dname + "</td>" +
				"<td>" + array[i].loc + "</td>"
				str += "</tr>";
			}
		}
		$('tbody').html(str);
	}
</script>
<style>
	body{
		background: linear-gradient(45deg, #B2FEFA, #0ED2F7);
		background-repeat: no-repeat;
		height: 1500px;
		background-size: cover;

	}
	table{
		background-color: #dbf6e9; 
		color: black;
	}
	table, th, td{
		text-align: center;
		background-color: white;
	}
	tr:hover{
		font-size: 1.2em;
		font-weight: bold; 
	}
	tr:nth-child(2n){
    	color: fuchsia;
	}
</style>
</head>
<body>
<div class="container">	
	<div class="row">
		<div>
		부서번호: <select id="selDeptno">
			<option value="">--부서번호선택--</option>
			<c:forEach items="${rs1.rows}" var="row">
				<option value="${row.deptno}">${row.deptno}</option>
			</c:forEach>
		</select> &nbsp;&nbsp;&nbsp; 부서위치: <select id="selLoc">
			<option value="">--부서위치선택--</option>
			<c:forEach items="${rs2.rows}" var="row">
				<option value="${row.loc}">${row.loc}</option>
			</c:forEach>
		</select> &nbsp;&nbsp;&nbsp;
		<button id="btnSearch" class="btn btn-primary">검색</button>
	</div>
	<table class="table table-hover">
		<thead>
			<tr class="info text-center">
				<th scope="col">사원번호</th>
				<th scope="col">사원이름</th>
				<th scope="col">부서번호</th>
				<th scope="col">부서이름</th>
				<th scope="col">부서위치</th>
			</tr>
		</thead>
		<tbody></tbody>
	</table>
	</div>
</div>
</body>
</html>