<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
	1부터 10까지의 합은 
	<span style ='color:red;font-size:2em;'>
		<%-- <%= %> 이용--%>
		<%--주의: Exprsssion에는 절대로 ;을 붙이지 않는다. 자동으로 붙여준다.--%>
		<%=1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10 %>
	</span>
</div>
<div>
	20부터 30까지의 합은 
	<span style ='color:blue;font-size:2em;'>
		<%--주의: Exprsssion에는 절대로 ;을 붙이지 않는다. 자동으로 붙여준다.--%>
		<%
			//out 이용
			int sum = 0;
			sum = 10 + 11 + 12 + 13 + 14 + 15 + 16 + 17 + 18 + 19 + 20;
			out.println(sum);
		%>
	
	</span>
		<%
			
			int sum1 = 0;
			sum1 = 10 + 11 + 12 + 13 + 14 + 15 + 16 + 17 + 18 + 19 + 20;
			out.println("<span style ='color:blue;font-size:2em;'>");
			out.println(sum1);
			out.println("</span>");
		%>
</div>