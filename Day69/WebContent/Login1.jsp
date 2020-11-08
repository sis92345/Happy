<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.HashMap"%>
<jsp:useBean id="Login" class="com.example.libs.LoginBean" scope="page">
	<%-- <jsp:setProperty name = "Login" property="username" param="username"/> --%>
</jsp:useBean>
<%
	request.setCharacterEncoding("UTF-8");
	String userid = request.getParameter("userid");
	String userpwd = request.getParameter("userpwd");
	if(userid.equals(Login.getUserid()) && userpwd.equals(Login.getUserpwd())){
		//login success
		/* Login.setFlag(true); //Bean에 로그인 성공 저장하고 */
	//세션 생성
	HashMap<String, Object> map = new HashMap<String, Object>();
	map.put("USERNAME", "한지민");
	session.setAttribute("mysession", map);
	response.sendRedirect("Welcome1.jsp");
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