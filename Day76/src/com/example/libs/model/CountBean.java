package com.example.libs.model;

public class CountBean {
	private int count;

	public int getCount() {
		return ++count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
}
