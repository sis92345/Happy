package com.example.libs.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ElDemo {
	public static String getFormat(Date now) {
		String pattern = "GG yyyy년 MM월 dd일 EE aa hh시 mm분 ss초";
		SimpleDateFormat s = new SimpleDateFormat(pattern);
		return "<span style='color:red;'>" + s.format(now) + "</span>";
	}
}
