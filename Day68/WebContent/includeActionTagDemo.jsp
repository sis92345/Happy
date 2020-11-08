<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page = "header.jsp" />
<jsp:include page = "date.jsp" flush="false">
	//include action tag는 태그로 파라미터를 넘길 수 있다.
	<jsp:param value="2020" name="year"/>
	<jsp:param value="11" name="month"/>
	<jsp:param value="5" name="day"/>
</jsp:include>
<jsp:include page = "copyright.jsp" />
