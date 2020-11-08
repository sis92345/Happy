<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="Login" class="com.example.libs.LoginBean" scope="page">
	<%-- <jsp:setProperty name = "Login" property="username" param="username"/> --%>
</jsp:useBean>
<%
	request.setCharacterEncoding("UTF-8");
	Cookie cookieName = null;
	Cookie cookieFlag = null;
	String userid = request.getParameter("userid");
	String userpwd = request.getParameter("userpwd");
	if(userid.equals(Login.getUserid()) && userpwd.equals(Login.getUserpwd())){
		//login success
		/* Login.setFlag(true); //Bean에 로그인 성공 저장하고 */
	//쿠키 생성
	cookieFlag = new Cookie("flag", "true"); 
	cookieName = new Cookie("username", request.getParameter("username"));
	response.addCookie(cookieFlag);
	response.addCookie(cookieName);
	response.sendRedirect("Welcome.jsp");
	}else{
		//일치 ㄴㄴ
%>
		<script>
			alert("아이디 혹은 비밀번호가 일치하지 않습니다.");
			history.back();
		</script>
<%
	}
%>