package com.example.libs.model;

public class TelephoneVO {
	//MEMBER
	private int kind; //구분
	private String tel; //전화번호
	private String name;//전화주
	private int quantity; //통화량
	private int defaultFee; //기본요금
	private int fee; //통화료
	private int tax; //세금
	private int tot; //합계
	
	//CONSTRUCTOR
	public TelephoneVO() {

	}
	public TelephoneVO(int kind, String tel, String name, int quantity) {
		super();
		this.kind = kind;
		this.tel = tel;
		this.name = name;
		this.quantity = quantity;
	}	
	
	public TelephoneVO(int kind, String tel, String name, int quantity, int defaultFee, int fee, int tax, int tot) {
		this.kind = kind;
		this.tel = tel;
		this.name = name;
		this.quantity = quantity;
		this.defaultFee = defaultFee;
		this.fee = fee;
		this.tax = tax;
		this.tot = tot;
	}
	//GETTER SETTER
	public int getKind() {
		return kind;
	}
	public void setKind(int kind) {
		this.kind = kind;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getDefaultFee() {
		return defaultFee;
	}
	public void setDefaultFee(int defaultFee) {
		this.defaultFee = defaultFee;
	}
	public int getFee() {
		return fee;
	}
	public void setFee(int fee) {
		this.fee = fee;
	}
	public int getTax() {
		return tax;
	}
	public void setTax(int tax) {
		this.tax = tax;
	}
	public int getTot() {
		return tot;
	}
	public void setTot(int tot) {
		this.tot = tot;
	}
	@Override
	public String toString() {
		return String.format(
				"TelephoneVO [kind=%s, tel=%s, name=%s, quantity=%s, defaultFee=%s, fee=%s, tax=%s, tot=%s]", kind, tel,
				name, quantity, defaultFee, fee, tax, tot);
	}
	
}
