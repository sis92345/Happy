import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Administrator
 * @date 2020. 10. 27.
 * @Object 프론트 엔드와 백 엔드의 메커니즘
 * @Environment Windows 10 EE, openJDK 14.0.2
 */
public class RegisterServlet extends HttpServlet {
	//Get과 Post방식을 바꾸어 가면서 해볼 것
	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException,IOException{
		req.setCharacterEncoding("utf-8"); //Post방식일때 한글 출력을 위해서 필요
		//req 요청 측, 즉 요청 측에서 보낸 get 주소 중 파라미터(HTML의 name 등)를 얻는다.
		String user = req.getParameter("username"); //url에서 name에 정의한 명칭, 변수 확인 가능
		//Date d = new Date();
		//String today = String.format("%tY년 %tM월 %tD일 입니다.", d, d, d); 이렇게 하거나
		String today = String.format("%1$tY년 %1$tM월 %1$tD일 입니다.",new Date()); //이렇게 하나의 파라메터를 다수의 포멧에 적용
		res.setContentType("text/html; charset=utf-8"); //한글 사용하려면 반드시 사용
		PrintWriter out = res.getWriter();
		out.println("<div><span style=\"color: aqua\">" + user + "</span>님! 귀하의 방문 시간은</div>");
		out.println("<div>" + today + "입니다. </div>");
		out.close();
	}
}
