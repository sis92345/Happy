package com.example.libs.service;

import java.sql.SQLException;
import java.util.Vector;

import com.example.libs.model.empDAO;

public class SelectService {
	public static Vector<String> selectService(){
		Vector<String> vec = null;
		try {
			vec = empDAO.select();
		}catch(SQLException e) {
			System.out.println(e);
		}
		return vec;
	}
}
