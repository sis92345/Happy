package com.example.libs;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/servlets/servlet/Register")
public class RegisterServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//forword의 예
		//이 페이지는 유저가 실제로 보지 않는 페이지다.
		ServletContext context = this.getServletContext(); //방법2
		int age = Integer.parseInt(req.getParameter("userage")); //방법1
		if(age < 20) {
			//html에서 넘어온 이름을 다시 Teen page로 이름을 보낸다.
			//redirect는 이거 못보냄
			RequestDispatcher teenage = context.getRequestDispatcher("/servlets/servlet/Teen"); 
			teenage.forward(req, res); 
		}else if(age < 65) {
			RequestDispatcher adult = req.getRequestDispatcher("/servlets/servlet/Adult");
			adult.forward(req, res);
		}else {
			RequestDispatcher silver = req.getRequestDispatcher("/Day64/servlets/servlet/Silver");
			silver.forward(req, res);
			//age와 name이 null redirect에서 Parameter가 넘어갈 수 없다.
		}
		
	}

}
