package com.example.libs.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.example.libs.model.StudentVO;
import com.example.libs.model.SungjukMgmtDao;

public class SelectService {
	public ArrayList<StudentVO> selectAll(){ //jsp가 selectAll()를 부른다.
		ArrayList<StudentVO> list = null;
		try {
			list = SungjukMgmtDao.select(/* this.path */);
		}catch(SQLException e) {
			System.out.println(e);
		}
		return list;
	}
	public StudentVO select(String hakbun) {
		StudentVO std = null;
		try {
			std = SungjukMgmtDao.selectOne(hakbun/* , this.path */);
		}catch(SQLException e) {
			System.out.println(e);
		}
		return std;
	}
}
