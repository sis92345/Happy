package com.example.libs.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBClose {
	public static void close(Connection conn) {
		try {
			if(conn != null) conn.close();
		}catch(SQLException ex) {
			System.out.println(ex);
		}
	}
	public static void close(Connection conn, Statement pstmt) {
		try {
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
		}catch(SQLException ex) {
			System.out.println(ex);
		}
	}
	public static void close(Connection conn, Statement pstmt, ResultSet rs) {
		try {
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
		}catch(SQLException ex) {
			System.out.println(ex);
		}
	}
}
