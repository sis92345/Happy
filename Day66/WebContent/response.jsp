<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//HTTP/1.1 부터 "Cache-control", "no-cache"
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", -1L); //Expire: 쿠키의 만료날짜
	//회사에서는 캐싱 서버가 따로 있기에 로그아웃하고 뒤로가기 누르면 오류나지만
	//문제는 우리는 캐쉬 서버가 없기에 뒤로가기 가능
%>