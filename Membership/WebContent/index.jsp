<%@ page contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="select" class="com.example.libs.service.SelectService" />
<c:if test="${not empty userid}">
	<c:set var="member" value="${select.selectMember(userid)}" />
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.css">
<script src="js/jquery-3.5.1.js"></script>
<script>
	$(document).ready(function(){
		$('#btnRegister').on('click', function(){
			location.href = "register.html";
		});
		$('#btnLogin').on('click', function(){
			location.href = "login.jsp";
		});
		$('#btnLogout').on('click', function(){
			if(confirm('정말 로그아웃 하시겠습니까?')){
				location.replace("logout.jsp"); //세션이 있는 상태에서 logout.jsp로 이동
			}else{
				history.go(0);
			}
		});
		$('#btnDelete').on('click', function(){
			if(confirm('정말 탈퇴 하시겠습니까?')){
				location.replace("delete.jsp"); //세션이 있는 상태에서 delete.jsp로 이동
			}else{
				history.go(0);
			}
		});
		$('#btnMyservice').on('click',function(){
			location.href = "myservice.jsp";
		});
	});
</script>
</head>
<body>
  <div class="container">
    <div class="row">
      <div class="jumbotron">
      	<c:if test="${empty userid}">
        	<h1>Welcome to www.example.com</h1>
        </c:if>
        <c:if test="${not empty userid}">
        	<c:if test="${sessionScope.flag eq 0}"> <!-- 관리자라면 -->
        		<h2 class="text-center text-primary">관리자 모드입니다.</h2>
        	</c:if>
        	<c:if test="${sessionScope.flag eq 1}"> <!-- 일반 유저라면 -->
        		<h2 class="text-center text-info">${member.name}(${member.age}세, ${userid})님! 환영합니다.</h2>
        	</c:if>
        </c:if>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolorum, vel ut. Fuga nemo dolores, voluptatibus et aliquam mollitia reiciendis quo qui vitae eum obcaecati! Mollitia dignissimos incidunt ipsum quis adipisci.
        Sit nesciunt modi maxime eius quisquam numquam voluptas odit similique sunt voluptatibus, autem magni quis ea vero quo alias debitis adipisci perspiciatis doloremque corrupti fuga animi unde quidem. Error, omnis.
        Fuga adipisci tempora eligendi amet ullam rem ut eveniet est! Quod voluptate laudantium fugit! Cum deserunt minima modi ab quia deleniti eaque ratione, magnam soluta totam ad tempora qui praesentium!
        Provident accusamus sapiente, doloribus quibusdam enim consequatur eum eius vel temporibus officiis natus nostrum excepturi qui illum facilis, voluptatibus nobis corporis perspiciatis fugit accusantium nisi! Cumque quidem enim iusto. Saepe?
        Doloribus ut beatae cupiditate expedita quam porro earum praesentium, tempore tempora eaque eligendi, delectus reprehenderit sed culpa. Quis deleniti veritatis consectetur distinctio quidem placeat quisquam. Libero qui nemo animi impedit.</p>
        <p>
        	<c:if test="${empty userid}"><%--login 안했을 때 --%>
        		<button id="btnRegister" class="btn btn-success btn-lg">회원가입</button>
        		<button id="btnLogin" class="btn btn-info btn-lg">Log In</button>
        	</c:if>
        	<c:if test="${not empty userid}"><%--login 했을 때 --%>
        		<button id="btnLogout" class="btn btn-warning btn-lg">Log Out</button>
        		<c:if test="${sessionScope.flag eq 1}"> <!-- 일반회원일 경우 -->
	        		<button id="btnMyservice" class="btn btn-info btn-lg">My Service</button>
	        		<button id="btnDelete" class="btn btn-danger btn-lg">회원탈퇴</button>
        		</c:if>
        		<c:if test="${sessionScope.flag eq 0}"> <!-- 관리자일 경우 -->
	        		<a class="btn btn-primary btn-lg" href="admin.jsp" role="button">관리자페이지로</a>
        		</c:if>
        	</c:if>
        </p>
      </div>
    </div>
  </div>
</body>
</html>