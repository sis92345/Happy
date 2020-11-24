package com.example.libs.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import oracle.jdbc.OracleTypes;

public class empDAO {
	public static Vector<String> select() throws SQLException {
		Connection conn = DBConnection.getConnection();//2
		String sql = "{ call sp_department_info(?) }";
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.registerOutParameter(1, OracleTypes.CURSOR);
		cstmt.execute();
		ResultSet rs = (ResultSet)cstmt.getObject(1);
		String result = "";
		Vector<String> vec = new Vector<String>();
		while(rs.next()) {
			result += rs.getInt("deptid") + " , ";
			result += rs.getString("deptname") + " , ";
			result += rs.getInt("cnt") + " , ";
			result += rs.getDouble("avg_sal") + " , ";
			result += rs.getInt("avg_year");
			vec.add(result);
		}
		return vec;
	}
}
