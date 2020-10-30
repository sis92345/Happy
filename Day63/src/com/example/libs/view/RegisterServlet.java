/**
 * 
 */
package com.example.libs.view;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.libs.controller.InsertService;

/**
 * @author SIST4-10
 * @Date 2020. 10. 28.
 * @Object
 * @Environment Windows 10 Pro, openJDK 14.0.2
 */
//web.xml을 사용하지 않을 경우
@WebServlet("/servlets/servlet/Register")
public class RegisterServlet extends HttpServlet {
	//doGet과 doPost를 둘 다 놓고 사용: GET을 메인, POST가 sub
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		req.setCharacterEncoding("utf-8"); //POST방식에서 한글 출력을 위해 반드시 해야할 것
		//POST /servlets/servlet/Regiter HTTP/1.1 ............. userage=한지민&username=24&gender=남성
		//값은 HTML의 태그 속성 중 value=""에 넣은 값이 들어온다.
		//POST방식이면 이렇게오는데 이거 전부 String이다.
		String username = req.getParameter("username");
		String userage = req.getParameter("userage");
		if(userage.equals("")) {
			userage = "0";
		}
		int age = Integer.parseInt(userage);
		String gender = req.getParameter("gender");
		//hobby는 체크박스, 즉 여러개가 Tomcat으로 올거고 이를 배열로 받아야한다. 메소드도 req.getParameterValues("hobby");사용
		//checkbox를 아무것도 선택하지 않으면 null값을 받으므로 504오류
		String [] hobbyArray = req.getParameterValues("hobby");
		String hobby = "";
		if(hobbyArray == null || hobbyArray.length == 0) {
			hobby = "";
		}
		for(int i=0;i<hobbyArray.length;i++) {
			hobby += hobbyArray[i] + ",";
		} //이렇게만하면 마지막에 ,남는다. 자르자
		hobby = hobby.substring(0, hobby.length() - 1);
		String city = req.getParameter("city");	
		if(city.equals("")) {
			city = "";
		}
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		
		int row = InsertService.insertMember(username, age, gender, hobby, city);
		if(row==1) {
			//성공이면
//			out.println("<body style='background-color: lightgreen'>");
//			out.println("<h1>회원가입에 성공했습니다.</h1>");
			//Java에서 redirect: res(나가는거).sendRedirect(url); 해당 url로 redirect, 절대경로, 상대경로 가능
			//또는 자바스크립트의 location 객체를 이용
			//forword는 같은 도메인만 가능
			res.sendRedirect("../../");
//			out.println("<script>");
//			out.println("alert('회원가입에 성했습니다. ');");		
//			out.println("location.href='../../';");
//			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('회원가입에 실패했습니다. 확인 후 다시 입력하세요');");		
			out.println("history.back();");
			out.println("</script>");
//			out.println("<body style='background-color: darkred'>");
//			out.println("<h1>회원가입에 실패했습니다.</h1>");
		}
		out.close();
		
		
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		//POST로 들어오면 GET으로 처리하도록한다.
		this.doGet(req, res);
	}
}
