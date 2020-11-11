package com.example.libs.service;

import java.sql.SQLException;

import com.example.libs.model.StudentVO;
import com.example.libs.model.SungjukMgmtDao;

public class UpdateService {
	public int UpdateStudent(StudentVO std) {
		int row = 0;
		try {
			row = SungjukMgmtDao.update(std/* , path */);
		}catch(SQLException e) {
			System.out.println(e);
		}
		return row;
	}
}
