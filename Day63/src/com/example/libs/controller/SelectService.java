/**
 * 
 */
package com.example.libs.controller;

import java.sql.SQLException;
import java.util.ArrayList;

import com.example.libs.model.CityDao;
import com.example.libs.model.CityVO;

/**
 * @author Administrator
 * @date 2020. 10. 29.
 * @Object Controller: 국가코드를 가져오는 Controller
 * @Environment Windows 10 EE, openJDK 14.0.2
 */
public class SelectService {
	public static ArrayList<String> getCountryCode(){
		ArrayList<String> list = null;
		try {
			list = CityDao.getCountryCode();
		} catch (SQLException e) {
			System.out.println("국가 코드를 가져오는동안 문제가 발생했습니다. 오류 코드를 확인하세요");
			e.printStackTrace();
		}
		return list;
	}

	public static ArrayList<CityVO> getCityList(String code) {
		ArrayList<CityVO> list = null;
		try {
			list = CityDao.getCityList(code);
		}catch(SQLException e) {
			e.getStackTrace();
		}
		return list;
	}
	
}
