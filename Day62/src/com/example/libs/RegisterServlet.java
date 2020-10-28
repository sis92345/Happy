/**
 * 
 */
package com.example.libs;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author SIST4-10
 * @Date 2020. 10. 28.
 * @Object
 * @Environment Windows 10 Pro, openJDK 14.0.2
 */
//web.xml을 사용하지 않을 경우
@WebServlet("/servlets/servlet/Regiter")
public class RegisterServlet extends HttpServlet {
	//doGet과 doPost를 둘 다 놓고 사용: GET을 메인, POST가 sub
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		req.setCharacterEncoding("utf-8"); //POST방식에서 한글 출력을 위해 반드시 해야할 것
		//POST /servlets/servlet/Regiter HTTP/1.1 ............. userage=한지민&username=24&gender=남성
		//값은 HTML의 태그 속성 중 value=""에 넣은 값이 들어온다.
		//POST방식이면 이렇게오는데 이거 전부 String이다.
		String username = req.getParameter("username");
		String userage = req.getParameter("userage");
		String gender = req.getParameter("gender");
		//hobby는 체크박스, 즉 여러개가 Tomcat으로 올거고 이를 배열로 받아야한다. 메소드도 req.getParameterValues("hobby");사용
		//checkbox를 아무것도 선택하지 않으면 null값을 받으므로 504오류
		String [] hobbyArray = req.getParameterValues("hobby");
		String hobby = "";
		for(int i=0;i<hobbyArray.length;i++) {
			hobby += hobbyArray[i] + ",";
		} //이렇게만하면 마지막에 ,남는다. 자르자
		hobby = hobby.substring(0, hobby.length() - 1);
		String city = req.getParameter("city");
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<h1>회원가입 확인</h1>");
		out.println("<ul>");
		out.println("<li> 이름 :" + username + "</li>");
		out.println("<li> 성별 :" + gender + "</li>");
		out.println("<li> 나이 :" + userage + "</li>");
		out.println("<li> 취미 :" + hobby + "</li>");
		out.println("<li> 거주지 :" + city + "</li>");
		out.println("</ul>");
		out.close();
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		//POST로 들어오면 GET으로 처리하도록한다.
		this.doGet(req, res);
	}
}
