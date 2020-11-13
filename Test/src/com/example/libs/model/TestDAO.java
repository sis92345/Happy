package com.example.libs.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 * @author SIST4-10
 * @Date 2020. 11. 13.
 * @Object 안병현
 * @Environment Windows 10 Pro, openJDK 14.0.2
 */
public class TestDAO {
	//SELECT(): 전체 목록을 가져온다.
	/*
	 * SELECT: 
	 */
	public static ArrayList<SalaryVO> select() throws SQLException{
		ArrayList<SalaryVO> list = new ArrayList<SalaryVO>();
		Connection conn = DBConnection.getConnection(); //2
		Statement stmt = conn.createStatement();//3
		String sql = "SELECT * FROM salary ORDER BY result desc";
		ResultSet rs = stmt.executeQuery(sql);//4
		while(rs.next()) {		
			String empno = rs.getString("empno");
			String dept = rs.getString("dept");
			int dfee = rs.getInt("dfee");
			int jfee = rs.getInt("jfee");
			int nfee = rs.getInt("nfee");
			int ffee = rs.getInt("ffee");
			int total = rs.getInt("total");
			int tax = rs.getInt("tax");
			int result = rs.getInt("result");
			int hobong = rs.getInt("hobong");
			int ntime = rs.getInt("ntime");
			int fnum = rs.getInt("fnum");
			SalaryVO sal = new SalaryVO(empno,  dept,  dfee,  jfee, nfee, ffee, total, tax, result,hobong, ntime,fnum);
			list.add(sal);
		}
		DBClose.close(conn, stmt);
		return list;
	}
	public static int insert(SalaryVO sal) throws SQLException{
		Connection conn = DBConnection.getConnection(); //2
		String sql = " INSERT INTO salary(empno, dept, dfee, jfee, nfee, ffee, total, tax, result, hobong, ntime, fnum) "
				+ "   VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, sal.getEmpno());
		pstmt.setString(2, sal.getDept());
		pstmt.setInt(3, sal.getDfee());
		pstmt.setInt(4, sal.getJfee());
		pstmt.setInt(5, sal.getNfee());
		pstmt.setInt(6, sal.getFfee());
		pstmt.setInt(7, sal.getTotal());
		pstmt.setInt(8, sal.getTax());
		pstmt.setInt(9, sal.getResult());
		pstmt.setInt(10, sal.getHobong());
		pstmt.setInt(11, sal.getNtime());
		pstmt.setInt(12, sal.getFnum());
		int row = pstmt.executeUpdate();
		DBClose.close(conn, pstmt);
		return row;
	}
}