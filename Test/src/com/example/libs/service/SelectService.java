package com.example.libs.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.example.libs.model.SalaryVO;
import com.example.libs.model.TestDAO;

public class SelectService {

	public ArrayList<SalaryVO> selectAll() {
		ArrayList<SalaryVO> list = null;
		try {
			list = TestDAO.select();
		} catch (SQLException ex) {
			System.out.println(ex);
		}
		return list;
	}
}
