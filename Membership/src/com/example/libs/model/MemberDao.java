package com.example.libs.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import oracle.jdbc.OracleTypes;

public class MemberDao {
	public static int register(MemberVO member) throws SQLException {
		Connection conn = DBConnection.getConnection(); //2,3
		String sql = "{ call sp_member_insert(?,?,?,?,?,?,?) }";
		CallableStatement cstmt = conn.prepareCall(sql);      //4
		cstmt.setString(1, member.getUserid());
		cstmt.setString(2, member.getPasswd());
		cstmt.setString(3, member.getName());
		cstmt.setString(4, member.getEmail());
		cstmt.setString(5, member.getGender());
		cstmt.setString(6, member.getCity());
		cstmt.setInt(7, member.getAge());
		int row = cstmt.executeUpdate();                          //5
		DBClose.close(conn, cstmt);   //6
		return row;
	}
	
	//-1 : 존재하지 않는 아이디이다.    0 : 아이디는 있으나 비밀번호가 일치하지 않는다.    1 : 모두 일치한다.
	public static int login(String userid, String passwd) throws SQLException{
		Connection conn = DBConnection.getConnection();  //2, 3
		String sql = "{ call sp_member_login(?, ?) }";
		CallableStatement cstmt = conn.prepareCall(sql);    //4
		cstmt.setString(1, userid);
		cstmt.registerOutParameter(2, OracleTypes.CURSOR);
		cstmt.execute();   //매우 주의하자.
		Object obj = cstmt.getObject(2);
		ResultSet rs = (ResultSet)obj;
		int key = -2;
		if(rs.next()) {   //아이디에 맞는 비밀번호를 가져왔다면
			String db_passwd = rs.getString("passwd");
			if(db_passwd.trim().equals(passwd.trim())) {
				key = 1;   //모두 일치
			}else {
				key = 0;  //비밀번호 불일치
			}
		}else {   //아예 그런 아이디가 없다면
			key = -1;
		}
		DBClose.close(conn, cstmt);   //7
		return key;
	}
	
	public static MemberVO select(String userid) throws SQLException{
		Connection conn = DBConnection.getConnection();  //2,3 
		String sql = "{ call sp_member_select(?, ?) }";
		CallableStatement cstmt = conn.prepareCall(sql);    //4
		cstmt.setString(1, userid);
		cstmt.registerOutParameter(2, OracleTypes.CURSOR);
		cstmt.execute();   //5. 매우 주의하자.
		ResultSet rs = (ResultSet)cstmt.getObject(2);
		rs.next();             //6
		MemberVO member = new MemberVO(userid, null, 
				  rs.getString("name"), rs.getString("email"), rs.getString("gender"),
				  rs.getString("city"), rs.getInt("age"), rs.getInt("flag"));
		DBClose.close(conn, cstmt, rs);  //7
		return member;
	}
	
	public static ArrayList<MemberVO> selectAll() throws SQLException{
		Connection conn = DBConnection.getConnection();  //2,3 
		String sql = "{ call sp_member_select_all(?) }";
		CallableStatement cstmt = conn.prepareCall(sql);    //4
		cstmt.registerOutParameter(1, OracleTypes.CURSOR);
		cstmt.execute();   //5. 매우 주의하자.
		ResultSet rs = (ResultSet)cstmt.getObject(1);
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		while(rs.next()) {
			//String userid, String passwd, String name, String email, String gender
			MemberVO mem = new MemberVO(rs.getString("userid"), "", rs.getString("name"), rs.getString("email"), rs.getString("gender"));
			mem.setCity(rs.getString("city"));
			mem.setAge(rs.getInt("Age"));
			list.add(mem);
		}
		
		DBClose.close(conn, cstmt, rs);  //7
		return list;
	}
	
	public static int delete(String userid) throws SQLException{
		Connection conn = DBConnection.getConnection();  //2,3 
		String sql = "{ call sp_member_delete(?) }";
		CallableStatement cstmt = conn.prepareCall(sql);    //4
		cstmt.setString(1, userid);
		int row = cstmt.executeUpdate();  //5. 매우 주의하자.	
		DBClose.close(conn, cstmt);  //6
		return row;
	}
	public static int update(MemberVO mem) throws SQLException{ 
		/*
		 * 	CRUD
		 * 	INSERT UPDATE : VO
		 *  SELECT, DELETE : PK
		 * */
		/*
		 *  <RESTful API>
		 *  - C: INSERT	  POST member
		 *  - R: SELECT   GET member/3(3번 글을 보고 싶다.)
		 *  - R(ALL):     GET member(전체를 가져온다.)
		 *  - U: UPDATE	  PUT member/3(3번 업데이트)
		 *  - D: DELETE	  DELETE member/3(3번 지운다.)
		 *  - 즉 delete.jsp가 DELETE를 담당, update.jsp가 UPDATE를 담당하는 것이 아니라
		 *  - 프로토콜을 이용한다.
		 *  - 즉 POST라면 INSERT를, GET이라면 SELECT를 실행하는 개념이 RESTful API이다.
		 *  - RESTful은 무조건 Ajax 통신을 이용해야한다.
		 * */
		Connection conn = DBConnection.getConnection();  //2,3 
		String sql = "{ call sp_member_update(?,?,?,?) }";
		CallableStatement cstmt = conn.prepareCall(sql);    //4
		cstmt.setString(1, mem.getUserid());
		cstmt.setString(2, mem.getEmail());
		cstmt.setString(3, mem.getCity());
		cstmt.setInt(4, mem.getAge());
		int row = cstmt.executeUpdate();
		DBClose.close(conn, cstmt);
		return row;
	}
	public static boolean idCheck(String userid) throws SQLException{
		Connection conn = DBConnection.getConnection();  //2,3 
		//아이디를 체크: 이미 있는 아이디면 false를, 사용할 수 있으면 true를 return
		String sql = "{ call sp_member_idcheck(?,?)}";
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.setString(1, userid);
		cstmt.registerOutParameter(2, OracleTypes.CURSOR);
		cstmt.execute(); //5
		ResultSet rs = (ResultSet)cstmt.getObject(2);
		boolean check = false;
		if(rs.next()) {
			//rs가 된다면 == 값이 있다면 == 내가 선택한 아이디가 이미 있다면
			check = false;
		}else {
			check = true;
		}
		DBClose.close(conn, cstmt, rs);
		return check;
	}
}




