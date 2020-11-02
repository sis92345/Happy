<!-- JSP의 한글처리 -->
<%@ page contentType="text/html;charset=utf-8"%>
<!-- Model 1 JSP: JAVA와 HTML이 섞여있는 형태 -->
<%
	for(int i=1;i<=7;i++){
%>
	<font size="<%=i %>>">Hello, JSP, 안녕 安寧</font><br>
<%
	}
%>