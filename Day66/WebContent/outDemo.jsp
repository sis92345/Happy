<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" buffer="none"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<li>Buffer Size: <%=out.getBufferSize() %>KB></li>
		<li>Remain Size: <%=out.getRemaining() %>KB></li>
	</ul>
</body>
</html>
<%
	out.println("이 글자는 유저에게 전달되지 않을 겁니다");
	//out.clear(); //이걸 제거하고 해보자
	out.println("이 글자는 유저에게");
	out.newLine();
	out.println("전달될 겁니다"); //buffer로 println
	out.flush();
%>