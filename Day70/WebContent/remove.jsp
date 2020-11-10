<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector"%>
<h1>삭제할 CD를 선택해 주세요.</h1>
<form method="POST">
    <select name="item">
        <option>--선택--</option>
        <%
      		//유저가 추가한 리스트를 다른 페이지의 Vector로 가져온다. Sessoion이용
        	Vector<String> cart = (Vector<String>)session.getAttribute("mycart");
        	for(int i=0;i<cart.size();i++){%>
        		<option value = "<%=cart.get(i) %>"><%=cart.get(i) %></option>
        	<%} %>
    </select>
    <!--Hidden-->
    <input type="hidden" name="step" value="remove">
    <input type="submit" value="카트에서 빼기">
    <input type="submit" value="카트에서 삭제">
</form>