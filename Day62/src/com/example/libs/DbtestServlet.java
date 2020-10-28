/**
 * 
 */
package com.example.libs;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author SIST4-10
 * @Date 2020. 10. 28.
 * @Object Servlet - DB Connector 연결 테스트
 * @Environment Windows 10 Pro, openJDK 14.0.2
 */
@WebServlet("/servlets/servlet/DbTest")
public class DbtestServlet extends HttpServlet{
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		//Maria DB 연결: JDBC
		//유저가 GET 방식으로 요청
		//GET방식이므로 URL에 다음과 같이 입력 가능: http://localhost/Day62/servlets/servlet/DbTest?countrycode=USA
		//countrycode=USA
		//countrycode: 변수 이름
		//USA: 변수 값
		String countrycode = req.getParameter("countrycode");
		if(countrycode == null || countrycode.equals("")) {
			countrycode = "KOR";
		}
		PrintWriter out = res.getWriter();
		out.println("<h1 style='color: aqua;text-align:center;font:D2Coding'>City Table's Korea Cities List</h1>");
		out.println("<ui style='color:crimson;font-weight:bold;'>");
		try {
			ResultSet rs = this.getResultSet(countrycode);
			while(rs.next()) {
				String str = String.format("%d,  %s,  %s,  %s,  %d", 
							rs.getInt("ID"), rs.getString("Name"), rs.getString("CountryCode"), rs.getString("District")
							,rs.getInt("Population"));
				out.println("<li>" + str +"<li>");
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		out.println("</ui>");
	}
	private ResultSet getResultSet(String countrycode) throws SQLException{
		DBConnection dbconn = new DBConnection();
		Connection conn = dbconn.getConnection(); //2,3
		String sql = "SELECT * FROM city WHERE countrycode = ?";
		//오버라이딩한 메소드인데 부모의 메소드에서 예외가 없는데 여기서 또 예외를 던질 수 없다: try catch 사용
		PreparedStatement pstmt = conn.prepareStatement(sql);
		//4. statement
		pstmt.setString(1, countrycode); //CHAR 3자리는 String, 완전 SQL
		//5. execute
		ResultSet rs = pstmt.executeQuery();
		DBClose.close(conn, pstmt); //7
		return rs;
	}
}
