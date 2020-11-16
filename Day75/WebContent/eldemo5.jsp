<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 기존의 방법 -->
User Address : <%=request.getRemoteAddr()%> <br />
<!-- EL을 이용 -->
User Address : ${pageContext.request.remoteAddr} <br>
Request URI : <%=request.getRequestURI()%> <br>
Request URI : ${pageContext.request.requestURI}
