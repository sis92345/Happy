<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("scope", "I AM PAGE SCOPE");
	request.setAttribute("scope", "I AM REQEUST SCOPE");
	session.setAttribute("scope", "I AM SESSION SCOPE");
	application.setAttribute("scope", "I AM APPLICATION SCOPE");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SCOPE</title>
<link rel="stylesheet" href="css/bootstrap.css">
<script src="js/jquery-3.5.1.js"></script>
<script>
	document.cookie = "username=sis945;";
</script>
<style>
	body{
		background: linear-gradient(45deg, #B2FEFA, #0ED2F7);
		background-repeat: no-repeat;
		height: 1500px;
		background-size: cover;

	}
	table{
		background-color: #dbf6e9; 
		color: black;
	}
	table, th, td{
		text-align: center;
		background-color: white;
	}
	tr:hover{
		font-size: 1.2em;
		font-weight: bold; 
	}
	tr:nth-child(2n){
    	color: fuchsia;
	}
</style>
</head>
<body>
   <div class="container">
       <div class="row">
           <form action="el_scriptlet.jsp" method="POST">
                <fieldset class="form-group">
                    <legend>Form</legend>
					<input type="text" name="name1" id="txtName" size="10"> &nbsp;&nbsp;&nbsp;
					<input type="text" name="name2" id="txtName" size="10">
                    <button type="submit" id="btnSubmit" class="btn btn-success">전송하기</button>
                </fieldset>
           </form>
           ${"page:"}${pageScope.scope}<br/>
			${"request:"}${requestScope.scope}<br/>
			${"session:"}${sessionScope.scope}<br/>
			${"application:"}${applicationScope.scope}<br/>
       </div>
   </div>
</body>
</html>