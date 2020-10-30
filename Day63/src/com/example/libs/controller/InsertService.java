package com.example.libs.controller;

import java.sql.SQLException;

import com.example.libs.model.CityDao;

public class InsertService {

	public static int insertMember(String username, int userage, String gender, String hobby, String city){
		int row = 0;
		try {
			row = CityDao.insertMember(username, userage, gender, hobby, city);
		}catch(SQLException e) {
			e.getStackTrace();
		}
		return row;
	}

}
