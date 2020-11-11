<%@ page buffer="4kb" autoFlush="false"%>
<%
	for(int i=0;i<4000;i++){
	%>
	<%=i %>	
	<%
	if(i==100){
		out.flush();
	} 
	
	}
%>