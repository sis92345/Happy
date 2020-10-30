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
@WebServlet("/servlets/servlet/CountryCode")
public class CountryCodeServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		ArrayList<String> list = SelectService.getCountryCode();
		PrintWriter out = res.getWriter();
		res.setContentType("text/html;charset=utf-8");
		out.println("<link rel='stylesheet' href='../../CSS/style.css'>");
		out.println("<h1>Select CountryCode</h1>");
		out.println("<form action='/Day63/servlets/servlet/CityList' method='GET'>");
		out.print("CountryCode : ");
		out.println("<select name='code'>");
		out.println("<option value=''>--Options--</option>");
		for(int i=0;i<list.size();i++) {
			out.println("<option value='"+list.get(i) + "'>" + list.get(i) + "</option>");
		}
		out.print("</select>&nbsp;&nbsp;&nbsp;");
		out.print("<button type='submit'>Select Code</button>"); //<form>안의 <button>은 자동으로 type이 submit
		out.println("</form>");
		out.close();
		
	}
}
