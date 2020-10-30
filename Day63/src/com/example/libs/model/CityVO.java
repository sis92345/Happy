/**
 * 
 */
package com.example.libs.model;

/**
 * @author Administrator
 * @date 2020. 10. 29.
 * @Object city table VO
 * @Environment Windows 10 EE, openJDK 14.0.2
 */
public class CityVO {
	/*
	 * Value Object: M,V,C를 계속 이동*/
	//Member 
	private int id, population;
	private String name, countryCode, district;
	//Constructor
	public CityVO(int id, String name, String countryCode, String district, int population) {
		this.id = id;
		this.name = name;
		this.countryCode = countryCode;
		this.district = district;
		this.population = population;
	}
	//Method
	@Override
	public String toString() {
		return String.format("<tr> <td>%d</td> <td>%s</td> <td>%s</td> <td>%s</td> <td>%,d</td> </tr>", this.id, this.name, this.countryCode, this.district, this.population);
	}
	
	
}
