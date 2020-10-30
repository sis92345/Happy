/**
 * 
 */
package com.example.libs.view;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.libs.controller.SelectService;
import com.example.libs.model.CityVO;

/**
 * @author Administrator
 * @date 2020. 10. 29.
 * @Object 국가코드를 받아서 도시검색
 * @Environment Windows 10 EE, openJDK 14.0.2
 */
@WebServlet("/servlets/servlet/CityList")
public class CityListServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		String code = req.getParameter("code");//"KOR"
		ArrayList<CityVO> list = SelectService.getCityList(code);
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		///servlets/servlet/CountryCode에서 2단계 내려간다.
		out.println("<head>");
		out.println("<link rel='stylesheet' href='../../CSS/style.css'>");
		out.println("<script src='../../JS/myaction.js'></script>");
		out.println("</head>");		
		out.println("<h1 id = 'btnBack'><button>Back</button></h1>");
		out.println("<h1>CountryCode = " + code+"</h1>");
		out.println("<table>");
		out.println("<thead>");
		out.println("<tr><th>ID</th><th>NAME</th><th>CountryCode</th><th>DISTRICT</th><th>POPULATION</th>");
		out.println("</thead>");
		out.println("</tbody>");
		for(int i=0;i<list.size();i++) {
			out.println(list.get(i));
		}
		out.println("</tbody>");
		out.println("</table>");
		out.close();
	}
}
