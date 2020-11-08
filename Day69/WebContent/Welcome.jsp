<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	response.setCharacterEncoding("UTF-8");
	//제일먼저 유저가 로그인 했는지 확인: 쿠키로 확인
	Cookie[] array = request.getCookies();
	boolean userFlag = false;
	String userName = null; 
	//쿠키가 맞다면 이름과 나이를 뽑아온다.
	if(array != null){
		for(int i=0;i<array.length;i++){
			Cookie c = array[i];
			if(c.getName().equals("flag")){
				//플래그가 있을 경우..
				userFlag = Boolean.parseBoolean(c.getValue());
			}
			if(c.getName().equals("username")){
				//username이라는 쿠키가 있다면
				userName = c.getValue();
			}
		}
	}
	if(!userFlag){
		//로그인을 한적이 없다면: userFlag가 false라면
		%>		
		<script>
			alert("먼저 로그인부터 하셔야 합니다.");
			location.replace("Login.html");
		</script>
	<%}%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome!</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<div>
		<%=userName %>님! 환영합니다!
	</div>
	<div>
		회원만이 누리는 환상적인 서비스를 기대하세요.
	</div>
	<%-- 
		Cookie를 이용한 Logout 처리는 Flag Cookie를 지우면 된다.
	--%>
</body>
</html>