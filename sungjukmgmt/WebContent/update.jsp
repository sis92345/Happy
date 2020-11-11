<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.example.libs.model.StudentVO" %>
<jsp:useBean id="select" class="com.example.libs.service.SelectService" />
<jsp:useBean id="update" class="com.example.libs.service.UpdateService" />
<%
	String hakbun = request.getParameter("hakbun");
	StudentVO std = select.select(hakbun);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 점수 수정 페이지</title>
<link rel="stylesheet" href="css/bootstrap.css">
<script src="js/jquery-3.5.1.js"></script>
<script >
	$(document).ready(function(){
		$("button[type='button']").on('click',function(){
			history.go(-1);
		});
	})
</script>
<style>
	body{
		background-color: #dbf6e9;
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
	<div class="container" id="a">
      <div class="row">
      	<h1 class="text-center"><%= std.getName()%>(<%= std.getHakbun() %>)'s 수정 페이지</h1>
        <form class="form-horizontal" action="update_ok.jsp" method="POST">
          <div class="form-group">
            <label for="txtKor" class="col-sm-2 control-label">국어</label>
            <div class="col-sm-10">
              <input type="number" min="0" max="100" name="kor" class="form-control" id="txtKor" placeholder="<%=std.getKor() %>" required>
            </div>
          </div>
          <div class="form-group">
            <label for="txtEng" class="col-sm-2 control-label">영어</label>
            <div class="col-sm-10">
              <input type="number" min="0" max="100" name="eng" class="form-control" id="txtEng" placeholder="<%=std.getEng() %>" required>
            </div>
          </div>
          <div class="form-group">
            <label for="txtMat" class="col-sm-2 control-label">수학</label>
            <div class="col-sm-10">
              <input type="number" min="0" max="100" name="mat" class="form-control" id="txtMat" placeholder="<%=std.getMat() %>" required>
            </div>
          </div>
          <!-- 수정 로직으로 학번도 같이 넘긴다. -->
          <input type="hidden" name="hakbun" value="<%=std.getHakbun()%>">
          <hr>
          <p class="text-center">Read Only</p>
          <div class="form-group">
            <label for="txtTot" class="col-sm-2 control-label">총점</label>
            <div class="col-sm-10">
              <input type="number" min="0" max="100" class="form-control" id="txtTot" placeholder="<%=std.getTot() %>" readonly="readonly" disabled="disabled">
            </div>
          </div>
          <div class="form-group">
            <label for="txtAvg" class="col-sm-2 control-label">평균</label>
            <div class="col-sm-10">
              <input type="number" min="0" max="100" class="form-control" id="txtAvg" placeholder="<%=std.getAvg() %>" readonly="readonly" disabled="disabled">
            </div>
          </div>
          <div class="form-group">
            <label for="txtGrade" class="col-sm-2 control-label">평점</label>
            <div class="col-sm-10">
              <input type="number" min="0" max="100" class="form-control" id="txtGrade" placeholder="<%=std.getGrade() %>" readonly="readonly" disabled="disabled">
            </div>
          </div>
          <div class="form-group">
          	<div class="col-sm-offset-2 col-sm-10 text-right">
	          	<button type="submit" class="btn btn-info ">수정하기</button>
	            <button type="button" class="btn btn-warning ">취소하기</button>
          	</div>
          </div>
        </form>
      </div>
    </div>
</body>
</html>
