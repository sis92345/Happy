package com.example.libs;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/servlets/servlet/Register1")
public class RegisterServlet1 extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//forword이 아닌 rediret 처리: register1의 form 태그의 action속성을 바꾸면서 차이 이해
		//redirect: forword는 상대경로, 그리고 자기 도메인에 한정되지만
		//redirect는 절대 경로가 가능하다.
		//또한 redirect는 userage와 username을 같이 가져갈 수 없다.

		PrintWriter out = res.getWriter();
		int age = Integer.parseInt(req.getParameter("userage"));
		if(age < 20) {
			//html에서 넘어온 이름을 다시 Teen page로 이름을 보낸다.
			//redirect는 이거 못보냄
			res.sendRedirect("https://jr.naver.com/");
		}else if(age < 65) {
			out.println("<script>");
			out.println("location.href = 'https://www.youtube.com';");
			out.println("</script>");
		}else {
			res.sendRedirect("/servlets/servlet/Silver");
		}
		out.close();
		
	}

}
