<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, java.util.Vector, java.util.HashMap"%>
<h1>Collection & Array과 EL</h1>
<%
	//List 개열: Vector, ArrayList..의 경우 index를 사용
	//세팅은 EL에서 못함
	ArrayList<String> alist = new ArrayList<String>();
	Vector<String> vec = new Vector<String>();
	vec.addElement("사과");
	vec.addElement("딸기");
	vec.addElement("복숭아");
	vec.addElement("수박");
	alist.add("사과");
	alist.add("딸기");
	alist.add("복숭아");
	alist.add("수박");
	String[] array = {"사과", "딸기", "복숭아", "수박"};
	pageContext.setAttribute("MYFRUITS", array); //돌려가면서 ㄱㄱ
	//SET: EL에서 사용 불가(get이 없다)
	//MAP: key value
	HashMap<String, Object> map = new HashMap<String, Object>();
	map.put("username","한지민");
	map.put("userage",24);
	map.put("useraddress","서울시 강남구 역삼동");
	pageContext.setAttribute("YOURINFO", map);
%>
<ul>
	<li>${MYFRUITS[0]}</li>
	<li>${MYFRUITS[1]}</li>
	<li>${MYFRUITS[2]}</li>
	<li>${MYFRUITS[3]}</li>
</ul>
<hr>
<ul>
	<li>이름 : ${YOURINFO['username']}</li>
	<li>나이 : ${YOURINFO['userage']}</li>
	<li>주소 : ${YOURINFO['useraddress']}</li>
</ul>