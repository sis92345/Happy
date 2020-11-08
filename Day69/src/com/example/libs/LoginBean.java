package com.example.libs;

public class LoginBean {
	//Web에서 사용하는 bean은 반드시 패키지를 사용해야한다.
	private String userid;
	private String userpwd;
	private String username;
	private boolean flag;
	
	public LoginBean() {
		this.userid = "jimin";
		this.userpwd = "1234567";
	}

	public String getUserid() {
		return userid;
	}

	public String getUserpwd() {
		return userpwd;
	}

	

	
}
