<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!-- 기존 JSP 방식 -->
<%-- Name: <%=request.getParameter("name") %> <br />
Age: <%=request.getParameter("Age") %> <br /> --%>

<!-- EL을 이용 1: NULL값에 관대하다: Null이면 안찍는다. -->
Name : ${param.name} <br />
Age : ${param.age}<br />
<hr />
<!-- EL을 이용 2: 자동 형변환이 가능, 입력값은 String이므로 String + String, 그러나 EL은 INT로 자동 형변환 -->
<%="입력값: http://localhost:8080/Day75/eldemo.jsp?num1=9&num2=4" %> <br />
<br />
Num1 : <%=request.getParameter("num1") %> <br />
Num2 : <%=request.getParameter("num2") %> <br />
Num1 + Num2 : <%=request.getParameter("num1") + request.getParameter("num2")%> <br />
<br />
Num1 : ${param.num1} <br />
Num2 : ${param.num2} <br />
Num1 + Num2 : ${param.num1 + param.num2} <br />