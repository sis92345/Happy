<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	//pageContext.setAttribute("ENAME", request.getParameter("ename"));
%>
<%@ taglib prefix="emp" uri="/WEB-INF/tlds/el-functions.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body{
		background-color: #dbf6e9;
    
	}
  .container{
    background-color:#f4f4f2;
    padding-right: 7%;
    border-radius: 1.5em;
  }
  input:hover{
        background-color: #9ddfd3;
  }
  input:focus{
        background-color: #ffdada;
  }
</style>
</head>
<body>
	<h1>${param['ename']}'s Info</h1>
	<div>${emp:myemp(param.ename)}</div>
	<%-- <div>${empty (emp:myemp(param.ename)) ? "Not Found": (emp:myemp(param.ename)}</div> --%>

</body>
</html>