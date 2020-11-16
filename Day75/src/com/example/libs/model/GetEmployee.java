package com.example.libs.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GetEmployee {
	public static String getEmp(String ename) throws SQLException {
		String na = ename.toUpperCase();
		Connection conn = DBConnection.getConnection();
		String sql = " SELECT ename, sal, job, hiredate, dname, loc "
				+ " FROM EMP INNER JOIN DEPT ON emp.deptno = dept.deptno "
				+ "WHERE ename = ? ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, na);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		String name = rs.getString("ename");
		int sal = rs.getInt("sal");
		String job = rs.getString("job");
		String hiredate = rs.getString("hiredate");
		String dname = rs.getString("dname");
		String loc = rs.getString("loc");
		String result = "<ul>" + "<li>이름: " + name + "</li><li>월급 : " + sal + "</li><li>직무 :" 
						+ job + "</li><li>입사일 : " + hiredate + "</li><li>소속 부서명 : " +  dname
						+ "</li><li>근무지 : " + loc + "</li></ul>";
		DBClose.close(conn, pstmt, rs);
		return result;
	}
}
