<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String username = request.getParameter("username");
	String userage = request.getParameter("userage");
	if(username==null && userage==null){
		//첫페이지라면
		out.println("<h1>This page is first page</h1>");
		out.println("<h1>if you enter a age</h1>");
		out.println("<h1>this page will redirect a Appropriate page</h1>");
		username="";
		userage="0";
	}
	int age = Integer.parseInt(userage);
	if(age<10 && age>0){
		response.sendRedirect("https://jr.naver.com");
	}else if(age>10&&age<65){%>
	<script>
		location.href = "./register.jsp?"; /*Redirect의 경우 유저이름을 넘기기가 어렵다.*/
	</script>
<%
} else if(age>=65){
	response.sendRedirect("../Day65/gugudan.jsp");
}
%>

<link rel="stylesheet" href="css/style.css">
<form action="">
	Name : <input type="text" name="username"><br>
	Age : <input type="number" name="userage"><br>
	<button type="submit">전송하기</button>
	<p>response.sendRedirect()는 상대경로, 절대경로, 다른 도메인 모두 redirect할 수 있다</p>
	<p>하지만 forword는 자신의 도메인에서 상대경로만으로 한정된다.</p>
</form>