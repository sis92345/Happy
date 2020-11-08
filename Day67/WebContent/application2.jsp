<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.io.File"%>
<%@ page import="java.io.RandomAccessFile"%><!-- RandomAccessFile: http://cris.joongbu.ac.kr/course/java/api/java/io/RandomAccessFile.html -->
<%!
	private String intConvertToImage(int count){
	String str = "<img src='images/'>";
	String strCount = String.valueOf(count); //"101"
	for(int i = 0; i < (6-strCount.length()) ; i++){
		str += "<img src='images/0.png'>";
	}
	for(int i = 0; i < strCount.length() ; i++){
		str += "<img src='images/" + i + ".png'>";

	}
	return str;
}
%>
<%
	//이클립스일 경우, 다른 툴마다 물리적 경로는 다르다.
	//이클립스의 경우
	//D:\git_env\WebHome\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Day67\
	//이게 txt의 진짜경로
	String path = application.getRealPath("/");  //1104 Context의 물리적 경로
	path += "WEB-INF/Count.txt";
	RandomAccessFile raf = new RandomAccessFile(new File(path), "rw");
	String strCount = raf.readLine(); //0
	int count = Integer.parseInt(strCount);
	count++;
	
%> 
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- <%=path%> --%>
	<%="방문자 수 :  " + intConvertToImage(count)%>
</body>
</html>
<%	
	//RandomAccessFile은 숫자로 저장하면 뒤에 쓸때없는거 들어가서 숫자 그대로 저장하지 말고
	//이렇게한다.
	raf.seek(0);
	raf.writeBytes(String.valueOf(count));
	raf.close();
	//또한 포인터는 계속 앞으로 나아가므로 seek()로 포인터를 계속 앞에 두어서 덮어쓰게 한다.
%>