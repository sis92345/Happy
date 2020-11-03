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
		//response.sendRedirect("https://jr.naver.com");
		pageContext.forward("/a.jsp"); //이름을 넘길 수 있다.
	}else if(age>10&&age<65){
		pageContext.forward("/register.jsp");
	%>
	
	<!-- <script>
		location.href = "./register.jsp?"; /*Redirect의 경우 유저이름을 넘기기가 어렵다.*/
	</script> -->
<%
} else if(age>=65){
	response.sendRedirect("/../Day65/gugudan.jsp"); //forward면 위로 못올라감 --> 무조건 /로 시작★★★★
}
%>

<link rel="stylesheet" href="css/style.css">
<form action="">
	Name : <input type="text" name="username"><br>
	Age : <input type="number" name="userage"><br>
	<button type="submit">전송하기</button>
	<p>response.sendRedirect()는 상대경로, 절대경로, 다른 도메인 모두 redirect할 수 있다</p>
	<p>하지만 forword는 자신의 도메인에서 상대경로만으로 한정된다. 반드시 /로 시작해야한다.</p>
	<p>forward는 url과 내용이 다르다. 즉 10살 이하로 입력하면 a페이지로 넘어가지만 url은 그대로</p>
	<p>forward는 값을 Parameter로 넘길 수 있다.</p>
	<p>GET 방식은 URL에서 한글을 지원한다.</p>
	<p>Redirect: JavaScript를 이용하거나 response.sendRedirect()를 이용</p>
</form>