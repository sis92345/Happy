package com.example.libs.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SungjukMgmtDao {

	public static ArrayList<StudentVO> select(/* String path */) throws SQLException{
		Connection conn = DBConnection.getConnection(); //DBCP 이용
		String sql = "{ call SP_SELECT_ALL(?) }";
		CallableStatement cstmt = conn.prepareCall(sql); //4
		cstmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR); // 5, sqlType: oracle에서만 사용하는 타입, oracle을 import, jdbc의 cursor가 아님
		cstmt.execute(); //매우 주의하자: 그냥 execute
		ResultSet rs = (ResultSet)cstmt.getObject(1); //6, 자바에서는 커서가 없으므로 Object로 바꾼다. 
		ArrayList<StudentVO> list = new ArrayList<StudentVO>();
		//커서는 이제 rs의 제일 첫번째
		if(rs.next()) {
			do {
				String hakbun = rs.getString("hakbun");
				String name = rs.getString("name");
				int kor = rs.getInt("kor");
				int eng = rs.getInt("eng");
				int mat = rs.getInt("mat");
				StudentVO std = new StudentVO(hakbun, name, kor, eng, mat);
				list.add(std);
			}while(rs.next());	
		}else {
			//데이터가 없다면
			list = null;
		}
	
		DBClose.close(conn); //7
		return list;
	}

	public static int insert(StudentVO student /* ,String path */) throws SQLException {
		Connection conn = DBConnection.getConnection(); //DBCP 이용
		String sql = "{ call SP_STUDENT_INSERT(?,?,?,?,?) }";
		CallableStatement cstmt = conn.prepareCall(sql); //4
		cstmt.setString(1, student.getHakbun());
		cstmt.setString(2, student.getName());
		cstmt.setInt(3, student.getKor());
		cstmt.setInt(4, student.getEng());
		cstmt.setInt(5, student.getMat());
		int row = cstmt.executeUpdate(); //5
		DBClose.close(conn, cstmt); //6
		return row;
	}

	public static StudentVO selectOne(String hakbun/* , String path */) throws SQLException {
		Connection conn = DBConnection.getConnection(); //DBCP 이용
		String sql = "{ call SP_SELECT(?,?) }";
		CallableStatement cstmt = conn.prepareCall(sql); //4
		cstmt.setString(1, hakbun);
		cstmt.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);
		cstmt.execute(); //5, 매우 주의하자
		ResultSet rs = (ResultSet)cstmt.getObject(2);
		
		rs.next();
		StudentVO std = new StudentVO(rs.getString("hakbun"), rs.getString("name"), rs.getInt("kor"), rs.getInt("eng"), rs.getInt("mat"));
		std.setTot(rs.getInt("tot"));
		std.setAvg(rs.getDouble("avg"));
		std.setGrade(rs.getString("grade")); //6
		
		DBClose.close(conn, cstmt); //7
		return std;	
	}

	public static int delete(String hakbun/* , String path */) throws SQLException {
		Connection conn = DBConnection.getConnection(); //DBCP 이용
		String sql = "{ call SP_DELETE(?) }";
		CallableStatement cstmt = conn.prepareCall(sql); //4
		cstmt.setString(1, hakbun);
		int row = cstmt.executeUpdate(); 
		DBClose.close(conn, cstmt); //7
		return row;
	}

	public static int update(StudentVO std/* , String path */) throws SQLException {
		Connection conn = DBConnection.getConnection(); //DBCP 이용
		String sql = "{ call SP_UPDATE(?,?,?,?) }";
		CallableStatement cstmt = conn.prepareCall(sql); //4
		cstmt.setString(1, std.getHakbun());
		cstmt.setInt(2, std.getKor());
		cstmt.setInt(3, std.getEng());
		cstmt.setInt(4, std.getMat());
		int row = cstmt.executeUpdate();//5 
		DBClose.close(conn, cstmt); //6
		return row;
	}
	

}
