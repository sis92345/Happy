<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:setDataSource dataSource="jdbc/myoracle" var="conn" />
<sql:query dataSource="${conn}" var="rs">
	SELECT DISTINCT sido FROM zipcode ORDER BY sido
</sql:query>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Ajax Demo</title>
<script src="js/jquery-3.5.1.js"></script>
<script>
	var xhr = null;
	//페이지가 로드된 후
	//원래 JS: window.on --> 이미지가 로딩된 후 함수 호출
	//.ready는 이미지 로딩 전에 해당 함수 호출
	$('document').ready(function() {
				//1. 객체 생성
				xhr = new XMLHttpRequest();

				//로딩된 후 할 일
				$('#selSido').on('change',function() {
					//시도 Select가 변경됬다면...
					//2. OPEN
					xhr.onreadystatechange = getGugun;
					xhr.open('POST','getGugunlist.jsp', true);
					xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=utf-8");
					//3.SEND
					xhr.send('sido=' + $(this).val()); //this: 이벤트를 발생시킨 객체: 즉 시도 선택 Select 
					}); //false면 안되는건가?: 왜?
				$('#btnSearch').on('click',function(){
					xhr.onreadystatechange = getAddress;
					xhr.open('POST','getAddresslist.jsp',true);
					xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=utf-8");
					let param = "dong=" + $('#txtDong').val().trim() + "&sido=" + $('#selSido').val().trim() + "&gugun=" + $('#selGugun').val().trim();
					xhr.send(param);
				});			
	});
				
	function getGugun() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			$('#gugunDiv').html(xhr.responseText.trim()); //taglib 코드도 공백 한 칸으로 같이 들어옴 alert로 확인 ㄱ --> 그래서 trim()
		}
	}
	function getAddress(){
		if (xhr.readyState == 4 && xhr.status == 200) {
			$('#result').html(xhr.responseText.trim()); //taglib 코드도 공백 한 칸으로 같이 들어옴 alert로 확인 ㄱ --> 그래서 trim()
		}
	}
</script>
</head>
<body>
	<form id="frmZip" name="frmZip">
		<table width="800" cellpadding="3" cellspacing="0">
			<tr>
				<td><select name="sido" id="selSido">
						<option value="">--시도선택--</option>
						<c:forEach items="${rs.rows}" var="row">
							<option value="${row.sido}">${row.sido}</option>
						</c:forEach>
				</select></td>
				<td>
					<div id="gugunDiv">
						<select name="gugun" id="selGugun">
							<option value=""> --구군선택-- </option> <!-- 강사님꺼도 확인 :나는 getGugunlist.jsp에서 넘어오는 --구군선택-- value를 ""로 처리 -->
						</select>
					</div>
				</td>
				<td>읍/면/동이름 : 
					<input type="text" name="dong" id="txtDong" />&nbsp;&nbsp;
					<input type="button" value="우편번호검색" id="btnSearch" />
				</td>				
			</tr>
		</table>
	</form>
	<div id="result"></div>
</body>
</html>