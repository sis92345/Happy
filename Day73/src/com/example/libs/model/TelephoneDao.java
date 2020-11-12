package com.example.libs.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class TelephoneDao {
	public static ArrayList<TelephoneVO> select() throws SQLException{
		Connection conn = DBConnection.getConnection();
		Statement stmt = conn.createStatement();
		String sql = "SELECT * FROM Telephone";
		ResultSet rs = stmt.executeQuery(sql);
		ArrayList<TelephoneVO> list = new ArrayList<TelephoneVO>();
		if(rs.next()) {
			//데이터 존재			
			do {
				TelephoneVO tel = new TelephoneVO(rs.getInt("kind"),rs.getString("tel")
						,rs.getString("name"),rs.getInt("quantity"), rs.getInt("defaultFee")
						,rs.getInt("fee"), rs.getInt("tax"), rs.getInt("total"));
				list.add(tel);
			}while(rs.next());
		}else {
			list = null;
		}
		DBClose.close(conn);
		return list;
	}
	public static String getCurrentDate() throws SQLException {
		Connection conn = DBConnection.getConnection();
		Statement stmt = conn.createStatement();
		String sql = "SELECT DATE_FORMAT(Now(),'%Y-%m-%d %T')";
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
		String date = rs.getString(1);
		DBClose.close(conn);
		return date;	
		
	}
	public static int insert(TelephoneVO tel) throws SQLException{
		Connection conn = DBConnection.getConnection();
		String sql = "INSERT INTO Telephone(kind, tel, name, quantity, defaultFee, fee, tax, total)" 
				+ "VALUES(?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, tel.getKind());
		pstmt.setString(2, tel.getTel());
		pstmt.setString(3, tel.getName());
		pstmt.setInt(4, tel.getQuantity());
		pstmt.setInt(5, tel.getDefaultFee());
		pstmt.setInt(6, tel.getFee());
		pstmt.setInt(7, tel.getTax());
		pstmt.setInt(8, tel.getTot());
		int row = pstmt.executeUpdate();
		DBClose.close(conn, pstmt);
		return row;
	}
}
