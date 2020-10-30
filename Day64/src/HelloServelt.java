

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HelloServelt
 */
@WebServlet("/servlets/servlet/Hello")
public class HelloServelt extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("Hello, 서블릿");
		out.println("<hr>");
		out.println("<img src='../../images/god.jpg'>");
		//왜 경로에 WebContent를 쓰지 않지?
		
		//저장할 때 마다 init -> destory()
		//이미지 경로: eclipse에서는 webcontent
		out.close();
	}

}
