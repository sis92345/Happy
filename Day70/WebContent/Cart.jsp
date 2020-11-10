<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %> 
    <!-- session="false" -->
    <!-- 
    session="false"를 설정하면 세션을 사용하지 않을 것이고, 이는 페이지마다 공유할 수 있는 정보가 없는 것 
    여기서 page(pageContext), application을 사용할 수 있는데 page의 Scope는 페이지로 한정되어 있으므로 공유할 수 없다. 
    실제로 아래 실행해보면 cart는 null로 나와서 오류
    application의 경우 문제: application의 scope는 모든 사용자, 모든 브라우저이므로 이 페이지를 이용해 실행한 후 그 걸 다른 브라우저로 실행하면 그대로 결과가 실행되는 결과가 나온다.
    즉 해당 Cart는 모든 사람이 공유하고 있는 것
    강사님 것도 비교할 것
    -->
<%@ page import="java.util.Vector" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--같은 페이지 같지만 다른 페이지 --%>
<jsp:include page="menu.html" />
<%
	//menu.html과 이 페이지는 다른 페이지
	request.setCharacterEncoding("UTF-8");
	String item = request.getParameter("item");
	String step = request.getParameter("step");	
	Vector<String> cart = null;
	if(item != null){
		cart = (Vector<String>)session.getAttribute("mycart");  /* pageContext.getAttribute("mycart"); */ /* application.getAttribute("mycart"); */
		if(cart == null){
			//만약 첫 번째 페이지라면...
			cart = new Vector<String>(1,1);
			cart.addElement(item);
			//session은 집어넣을 때 object, 쿠키는 오직 String
			 session.setAttribute("mycart", cart);  /*  pageContext.getAttribute("mycart"); */ /* application.getAttribute("mycart"); */
		}else{
			//세션이 있었다면
			if(step.equals("add")) cart.addElement(item);
			else cart.removeElement(item);
		}
%>
	<h2>현재 카드에 <%=cart.size() %>개의 상품이 담겨있습니다.</h2>
	<hr>
	<ol>
	<%for(int i=0;i<cart.size();i++){%>
			<li><%=cart.get(i) %></li>	
	<%}%>
	</ol><br /><br />
	<%if(cart.size() > 0){%>
		<%--같은 페이지 같지만 다른 페이지 --%>
		<jsp:include page="remove.jsp"/>
	<% } %>
<% } %>
</body>
</html>
<%--
이 페이지는 하나같지만 실제로 Cart.jsp, menu.html, remove.jsp 3가지 이며 Session을 통해서 Vector를 공유한다.
--%>