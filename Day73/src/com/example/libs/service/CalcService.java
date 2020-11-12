package com.example.libs.service;

import com.example.libs.model.TelephoneVO;

public class CalcService {

	public void calc(TelephoneVO tel) {
		switch(tel.getKind()) {
			case 1:tel.setDefaultFee(6000); break;
			case 2:tel.setDefaultFee(4800); break;
			case 3:tel.setDefaultFee(3000); break;
		}
		int fee = tel.getQuantity() * 12;
		int tax = (int)((tel.getDefaultFee() + fee) * 0.1);
		int tot = tel.getDefaultFee() + fee + tax;
		
		tel.setFee(fee);
		tel.setTax(tax);
		tel.setTot(tot);
	}

}
