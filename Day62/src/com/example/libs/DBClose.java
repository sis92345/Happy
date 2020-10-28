package com.example.libs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBClose {
	public static void close(Connection conn) {
		try {
			if(conn != null) conn.close();
		}catch(SQLException ex) {
			System.out.println(ex);
		}
	}
	public static void close(Connection conn, PreparedStatement pstmt) {
		try {
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
		}catch(SQLException ex) {
			System.out.println(ex);
		}
	}
	public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		try {
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
		}catch(SQLException ex) {
			System.out.println(ex);
		}
	}
}
