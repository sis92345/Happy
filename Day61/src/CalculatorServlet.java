import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 
 */

/**
 * @author Administrator
 * @date 2020. 10. 27.
 * @Object 프론트엔드, 백엔드 연동 분리 연습
 * @Environment Windows 10 EE, openJDK 14.0.2
 */
public class CalculatorServlet extends HttpServlet {
	//사용자는 http://www.example.com/Day61/WEB-INF/index.html로 접속
	//사용자가 값을 입력후 submit 버튼 클릭
	//form은 action 속성에 정의한 경로로 js를 전송(이건 정확한 정의 확인하기)
	//action 속성에 servlet이라는 단어가 있으므로 Apache는 ajp13에 보내고 tomcat 실행
	//post방식으로 전송(default: GET)
	//web.xml에 정의
	//이 클래스 호출
	//오버라이드 조건: https://all-record.tistory.com/60
	protected void doPost(HttpServletRequest req, HttpServletResponse res)
						  throws ServletException,IOException{
		req.setCharacterEncoding("utf-8");
		//넘어오는거: 이름, 텍스트박스 5개: 숫자도 문자열이다.
		String result = this.calc(req);
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println(result);
		out.println("<hr>");
		out.println("<img src='../../imgs/god.jpg' alter='킹갓흥'>");
		// /Day61/servlets/servlet/Calculator이므로
		//단계 내려가야 imgs폴더 나온다.
		out.close();
		
	}
	private String calc(HttpServletRequest req) {
		int count = 0;
		String name = req.getParameter("irum");
		String today = String.format("%1$tY년 %1$tM월 %1$tD일 입니다.",new Date());
		int[] array = {5+6, 8-3, 7*6, 15 / 3, 8+6-3*2/2};
		
		for(int i=1;i<6;i++) {	
			String quest = req.getParameter("question" + i);
			int su = Integer.parseInt(quest);
			if(su == array[i-1]) {
				count ++;
			}
			}
			String str = "<span style = 'color:blue'>" + name + "</span>님!<br />";
			str += today + "<br />";
			str += array.length + "문제 중" + (array.length - count) + "개를 틀려서";
			str += "<span style = 'color:red'>" + (count * 20) + "</span>점입니다.";
		    return str;
				
	}
}
