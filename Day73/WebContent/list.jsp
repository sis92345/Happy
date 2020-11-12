<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.example.libs.model.TelephoneVO"%>
<jsp:useBean id="select" class="com.example.libs.service.SelectService" />
<%
	ArrayList<TelephoneVO> list = select.selectTelephone();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쌍용전화국 전화요금 관리웹</title>
<link rel="stylesheet" href="css/bootstrap.css">
<script src="js/jquery-3.5.1.js"></script>
<style>
	body{
		background-color: #dbf6e9;
	}
	#tableInput1, #tableInput2{
		background-color: #dbf6e9; 
		color: black;
	}
	#resultTable, th, td{
		text-align: center;
		background-color: white;
	}
	tr:hover{
		font-size: 1.2em;
		font-weight: bold; 
	}
	tr:nth-of-type(2n) {
		background-color: #5c6e91;
	}	
</style>
</head>
<body>
    <h1 class="text-center">&lt;&lt;11월 전화요금&gt;&gt;</h1>
    <div class="container">
        <div class="row">
            <table class="table table-striped">
                <tr >
                    <td class="text-left" id="tableInput1"><a href="input.html">입력하기</a></td>
                    <td class="text-right" id="tableInput2"><%=select.getCurrentDate() %></td>
                </tr>
            </table>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <table class="table table-striped rounded" id="resultTable">
                <thead>
                    <tr class="info">
                        <th>구분</th>
                        <th>전화번호</th>
                        <th>이름</th>
                        <th>기본요금</th>
                        <th>통화료</th>
                        <th>세금</th>
                        <th>합계</th>
                    </tr>
                </thead>
                <tbody>
                	<%if(list == null){%>
                		<tr>
                			<td colspan="7" class="danger">No Date</td>
                		</tr>
                	<%}else{
                	for(int i=0;i<list.size();i++){
                		TelephoneVO tel = list.get(i);
                		String kid = null;
                		switch(tel.getKind()){
                			case 1: kid = "영업용"; break;
                			case 2: kid = "관청용";break;
                			case 3: kid = "가정용"; break;
                		}
                		if((i%2)==0){
                	%>
                	<tr>
                		<td><%=kid %>(<%=tel.getKind() %>)</td>
                		<td><%=tel.getTel() %></td>
                		<td><%=tel.getName() %></td>
                		<td><%=tel.getDefaultFee() %></td>
                		<td><%=tel.getFee() %></td>
                		<td><%=tel.getTax() %></td>
                		<td><%=tel.getTot() %></td>
                	</tr>	
                		<%}else{%>
                	<tr class="success">
                		<td><%=kid %>(<%=tel.getKind() %>)</td>
                		<td><%=tel.getTel() %></td>
                		<td><%=tel.getName() %></td>
                		<td><%=tel.getDefaultFee() %></td>
                		<td><%=tel.getFee() %></td>
                		<td><%=tel.getTax() %></td>
                		<td><%=tel.getTot() %></td>
                	</tr>		
                	<%}%>
                	<%}%>
                	<%}%>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>