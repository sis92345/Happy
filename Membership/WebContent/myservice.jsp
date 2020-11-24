<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.example.libs.model.MemberVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="select" class="com.example.libs.service.SelectService" />
<c:if test="${empty userid}">
	<c:redirect url="login.jsp"/>
</c:if>
<c:if test="${!empty userid}">
	<c:set var="member" value="${select.selectMember(userid)}"/>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보페이지</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-theme.css">
<style>
	.row{
		padding: 10px 400px;
	}
</style>
<script src="js/jquery-3.5.1.js"></script>
<script>
	$('document').ready(function(){
		$('#btnHome').on('click',function(){
			location.replace("index.html");
		});
		$('#btnUpdate').on('click',function(){
			//값을 가져 올때 text박스라면 .val()[<input type="text" />]
			//태그와 태그 사이의 값을 가져오는 방법은 text(), html()을 이용한다.
			//text()는 글자만, html()는 태그까지 가져온다.
			if($(this).text() == '정보변경하기'){
			let email = $('#email').text(); 
			$('#ema').replaceWith("<input id='txtEmail' type='email' value='"+ email + "'/>");
			let city = $('#city').text(); 
			let str = "<select id='selCity'>" + 
            "<option value=\"서울\">서울</option>" +
            "<option value=\"부산\">부산</option>" +
            "<option value=\"대구\">대구</option>" +
            "<option value=\"대전\">대전</option>" +
            "<option value=\"광주\">광주</option>" +
            "<option value=\"인천\">인천</option>" +
            "<option value=\"울산\">울산</option>" +
			   "</select>";
			$('#city').replaceWith(str);
			let array = ["서울", "부산", "대구", "대전", "광주", "인천", "울산"];
			let idx = array.indexOf(city);
			document.getElementById("selCity").options.selectedIndex = idx;
			$('#selCity')
			
			let age = $('#age').text();
			$('#age').replaceWith("<input id='txtAge' type='number' min='0' value ='" + age + "'/>" )
			$('#btnUpdate').text('변경완료하기');
			$('#btnUpdate').removeClass();
			$('#btnUpdate').addClass('btn btn-danger');
			}else if($(this).text() == '변경완료하기'){
				let email = $('#txtEmail').val();
				let city = $('#selCity').val();
				let age = $('#txtAge').val();
				location.href = "update.jsp?email="+ email +"&city="+ city+"&age=" + age;
			}
		});
		$('#btnDelete').on('click',function(){
			if(confirm('정말 탈퇴하시겠습니까?')){
				location.replace("delete.jsp");
			}else{
				history.go(0);
			}
		});
	});
</script>
</head>
<body>
	<h1 class="text-center success"><c:out value="${userid}"/>님의 정보</h1>
	<div class="container text-center">
		<div class="row">
			<table class="table table-bordered">
				<tr>
					<th>아이디</th><td><span id="ema"><c:out value="${userid}"/></span></td>
				</tr>
				<tr>
					<th>이메일</th><td><c:out value="${member.email}"/></td> <!-- member.geEmail()에서 get을빼고 첫번째는 소문자 -->
				</tr>
				<tr>
					<c:if test="${member.gender eq 1}"><th>성별</th><td>남성</td></c:if>
					<c:if test="${member.gender eq 2}"><th>성별</th><td>여성</td></c:if>			
				</tr>
				<tr>
					<th>거주지</th><td><span id="city"><c:out value="${member.city}"/></span></td>
				</tr>
				<tr>
					<th>나이</th><td><span id="age"><c:out value="${member.age}"/></span></td>
				</tr>
			</table>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="text=center">
				<button type="button" class="btn btn-success" id="btnHome">홈으로</button>
				<button type="button" class="btn btn-info" id="btnUpdate">정보변경하기</button>
				<button type="button" class="btn btn-warning" id="btnDelete">탈퇴하기</button>
			</div>
		</div>
	</div>
</body>
</html>