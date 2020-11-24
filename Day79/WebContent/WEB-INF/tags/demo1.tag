<%@ tag language="java" body-content="scriptless" pageEncoding="utf-8" %> <!-- body-content="scriptless": body 존재 -->
<%@ tag import="java.util.Date" %>
<%
Date now = new Date();
%>
<!-- body 처리는 jsp:doBody -->
Now is <%=now %>
<jsp:doBody /> <!-- now 출력한 후 body 내용 실행 -->