import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet{
	//모든 서블릿은 HttpServlet의 자식이어야한다.
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException{
		//get방식으로 요청
		//Servlet이 되려면 jar가 있어야 한다
		//C:\Program Files\Apache Software Foundation\Tomcat 9.0\lib\servlet-api.jar를 Add External jar 
		
		//res니까 나가는거
		res.setContentType("text/html; charset=utf-8");
		PrintWriter pw = res.getWriter();
		//브라우저로 해당 태그를 사용
		//즉 브라우저에서 클래스를 실행하기위한 것이 서블릿
		//자바속에 HTML은 servlet
		//HTML속에 자바는 JSP: 이게 더 편해서 이거 사용함
		//쉽게말해 Servlet을 쉽게 만든게 JSP
		//근데 이거 배워야하는 이유
		//Spring의 MVC중 C가 Servlet
		//web.xml 수정
		/*
		 
		 * */
		//meta 태그가 있어야 한글 나옴
		//MIME TYPE: 다목적 인터넷 메일 익스텐션 
		//auto/MP3
		//HTML, CSS 전부 text/html, text/css, text/javascript
		//res.setContentType("text/html");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8'>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<p style=\"font-size: 3em; color: red\">Hello Servlet 한글</p>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();
		
	}
}
