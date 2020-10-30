package com.example.libs.model;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DBConnection {
	private static final String DBDRIVER = "org.mariadb.jdbc.Driver";
	private static final String DBURL = "jdbc:mariadb://localhost:3306/world";
	private static final String DBUSER = "root";
	private static final String DBPWD = "javamariadb";
	
	//private Properties info;
	
//	public DBConnection() {   //������
//		this.info = new Properties();
//		//jar가 없으므로 드라이버 로딩 불가
//		//jar로딩해도 또 같은 오류: 여기가 달라진 점
//		/*
//		 * 자바로 만든 Web Application으로 인정을 받으려면 WEB-INF
//		 * WEB-INF/classes
//		 * WEB-INF/lib
//		 * Web.xml
//		 * 근데 안만들었으니까 Web에서 구동이 안되는 것
//		 * 모든 jar는 lib밑에 있어야 한다.
//		 * */
//		File file = new File("C:/temp/mariadb.properties");
//		try {
//			this.info.load(new FileInputStream(file));
//		} catch (FileNotFoundException e) {
//			System.out.println("File Not Found");
//		} catch (IOException e) {
//			System.out.println(e.toString());
//		}
//	}
	
	public Connection getConnection() {
		//2. Step
		try {
			//File Not Found
			Class.forName(DBConnection.DBDRIVER);   //oracle.jdbc.driver.OracleDriver
		} catch (ClassNotFoundException e) {
			System.out.println("Oracle Driver Loading Failure");
		}    
		//3. Step
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(DBConnection.DBURL, 
					                                                DBConnection.DBUSER, 
					                                                DBConnection.DBPWD);
		} catch (SQLException e) {
			System.out.println("Connection Failure");
		}
		return conn;
	}
}





