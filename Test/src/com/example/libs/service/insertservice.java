package com.example.libs.service;

import java.sql.SQLException;

import com.example.libs.model.SalaryVO;
import com.example.libs.model.TestDAO;


public class insertservice {
	public int insertSalary(SalaryVO salary) {
		int row = 0;
		try {
			row = TestDAO.insert(calcfee(salary));
		}catch(SQLException ex) {
			System.out.println(ex);
		}
		return row;
	}
	private SalaryVO calcfee(SalaryVO s) {
		switch(Character.toUpperCase(s.getEmpno().charAt(0))) {
		case 'A' : s.setDept("영업부");break;
		case 'B' : s.setDept("시설부");break;
		case 'C' : s.setDept("자재부");break;
		case 'D' : s.setDept("관리부");break;
		case 'E' : s.setDept("경리부");break;
		case 'F' : s.setDept("총무부");break;
		case 'G' : s.setDept("운용부");break;
		case 'H' : s.setDept("연구부");break;
		}
		switch(s.getEmpno().charAt(1)) {
		case '1': s.setJfee(730000); break;
		case '2': s.setJfee(630000); break;
		case '3': s.setJfee(590000); break;
		case '4': s.setJfee(510000); break;
		case '5': s.setJfee(430000); break;
		case '6': s.setJfee(390000); break;
		case '7': s.setJfee(340000); break;
		case '8': s.setJfee(310000); break;
		case '9': s.setJfee(290000); break;
		}
		
		s.setDfee(s.getHobong()*10000);
		s.setNfee(s.getNtime()*15000);
		s.setFfee(s.getFnum()*15000);
		s.setTotal(
				s.getDfee()
				+s.getNfee()
				+s.getFfee()
				+s.getJfee()
				);
		s.setTax((int)(s.getTotal()*0.1));
		s.setResult(s.getTotal()-s.getTax());
		return s;
	}
}
