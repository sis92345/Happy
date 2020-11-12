package com.example.libs.service;

import java.sql.SQLException;

import com.example.libs.model.TelephoneDao;
import com.example.libs.model.TelephoneVO;

public class InsertService {
	private CalcService calc;
	public InsertService() {
		//Default Constructor
		this.calc = new CalcService();
	}
	int row = 0;
	public int InsertTelephone(TelephoneVO tel) {
		try {
			calc.calc(tel);
			row = TelephoneDao.insert(tel);
		}catch(SQLException e) {
			System.out.println(e);
		}
		return row;
	}
}
