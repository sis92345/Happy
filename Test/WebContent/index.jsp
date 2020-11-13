<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.example.libs.model.SalaryVO" %>
<jsp:useBean id="service" class="com.example.libs.service.SelectService" />
<%
   ArrayList<SalaryVO> list = service.selectAll();   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 봉급 정보 출력창</title>
<link rel="stylesheet" href="css/bootstrap.css" />
</head>
<body>
   <h1 class="text-center">사원 봉급 정보 리스트</h1>
   
   <div class="container">
      <div class="row">
         <table class="table" style="border : 0px">
            <tr>
               <td>[<a href="input.html">입력하기</a>]</td>
               <td class="text-right">(<%=(list == null) ? "0" : list.size() %>)명</td>
            </tr>
         </table>
      </div>
   </div>
   <div class="container">
   <div class="row">
   <table class="table table-bordered">
   <thead>
      <tr class="info">
         <th>사번</th><th>부서</th><th>기본급</th>
         <th>직무급</th><th>야근수당</th><th>가족수당</th>
         <th>총지급액</th><th>소득세</th><th>실수령액</th>
      </tr>
   </thead>
   <tbody>
   <% if(list == null){ %>
      <tr>
         <td colspan="9" class="text-center">No Data</td>
      </tr>
   <% 
      }else{ 
         for(int i = 0 ; i < list.size() ; i++){
        	 SalaryVO salary = list.get(i);
            String empno = salary.getEmpno();
   %>
      <tr>
         <td><%=salary.getEmpno() %></td><td><%=salary.getDept() %></td>
         <td><%=salary.getDfee() %></td><td><%=salary.getJfee() %></td>
         <td><%=salary.getNfee() %></td><td><%=salary.getFfee() %></td>
         <td><%=salary.getTotal() %></td><td><%=salary.getTax() %></td>
         <td><%=salary.getResult() %></td>
      </tr>
   <%
          } //for end
      } //if end
   %>
   </tbody>
   </table>
   </div>
   </div>
</body>
</html>