package com.example.libs.service;

import java.sql.SQLException;

import com.example.libs.model.MemberDao;
import com.example.libs.model.MemberVO;

public class UpdateService {
	public int updateService(MemberVO mem) {
		int row = 0;
		try {
			row = MemberDao.update(mem);
		}catch(SQLException e) {
			System.out.println(e);
		}
		return row;
	}
}
