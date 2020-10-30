/**
 * 
 */
package com.example.libs.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 * @author Administrator
 * @date 2020. 10. 29.
 * @Object city table 가져오기
 * @Environment Windows 10 EE, openJDK 14.0.2
 */
public class CityDao {
	public static ArrayList<String> getCountryCode() throws SQLException{
		DBConnection dbconn = new DBConnection();
		Connection conn = dbconn.getConnection(); //2,3
		Statement stmt = conn.createStatement(); //4
		String sql = "SELECT Code FROM Country ORDER BY Code";
		ResultSet rs = stmt.executeQuery(sql); //5
		//6
		ArrayList<String> list = new ArrayList<String>(); //기본 생성자: 자동으로 방 10개 생성
		//MariaDB에서 Char 는 String
		while(rs.next()) {
			String code = rs.getString("code");
			list.add(code);
		}
		DBClose.close(conn, stmt, rs);
		return list;
	}

	public static ArrayList<CityVO> getCityList(String code) throws SQLException {
		DBConnection dbconn = new DBConnection();
		Connection conn = dbconn.getConnection(); //2,3
		String sql = "SELECT * FROM city WHERE CountryCode = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);//4
		pstmt.setString(1, code);
		ResultSet rs = pstmt.executeQuery();//5
		ArrayList<CityVO> list = new ArrayList<CityVO>();
		while(rs.next()) {
			int id = rs.getInt("id");
			String name = rs.getString("name");
			String countryCode = rs.getString("CountryCode");
			String district = rs.getString("district");
			int population = rs.getInt("population");
			CityVO city = new CityVO(id, name, countryCode, district, population);
			list.add(city);
		}
		DBClose.close(conn, pstmt, rs); //7
		return list;
	}

	public static int insertMember(String username, int userage, String gender, String hobby, String city) throws SQLException {
		DBConnection dbconn = new DBConnection();
		Connection conn = dbconn.getConnection(); //2,3
		String sql = "INSERT INTO Member(username, userage, gender, hobby, city) VALUES(?,?,?,?,?) ";
		PreparedStatement pstmt = conn.prepareStatement(sql);//4
		pstmt.setString(1, username);
		pstmt.setInt(2, userage);
		pstmt.setString(3, gender);
		pstmt.setString(4, hobby);
		pstmt.setString(5, city);
		int row = pstmt.executeUpdate();
		DBClose.close(conn, pstmt);
		return row;
	}
}
