package com.example.libs.model;

public class SalaryVO {
	private String empno;   //사번
	private String dept;    //부서
	private int dfee;       //기본급
	private int jfee;       //직무급
	private int nfee;       //야근수당
	private int ffee;       //가족수당
	private int total;      //총지급액
	private int tax;        //소득세
	private int result;     //실수령액
	private int hobong;     //호봉
	private int ntime;     //야근시간
	private int fnum;     //부양가족수 
	
	public SalaryVO() {
		
	}
	public SalaryVO(String empno, int hobong, int ntime, int fnum) {
		
		this.empno = empno;
		this.hobong = hobong;
		this.ntime = ntime;
		this.fnum = fnum;
	}
	
	public SalaryVO(String empno, String dept, int dfee, int jfee, int nfee, int ffee, int total, int tax, int result,
			int hobong, int ntime, int fnum) {
		this.empno = empno;
		this.dept = dept;
		this.dfee = dfee;
		this.jfee = jfee;
		this.nfee = nfee;
		this.ffee = ffee;
		this.total = total;
		this.tax = tax;
		this.result = result;
		this.hobong = hobong;
		this.ntime = ntime;
		this.fnum = fnum;
	}
	public String getEmpno() {
		return empno;
	}
	public void setEmpno(String empno) {
		this.empno = empno;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public int getDfee() {
		return dfee;
	}
	public void setDfee(int dfee) {
		this.dfee = dfee;
	}
	public int getJfee() {
		return jfee;
	}
	public void setJfee(int jfee) {
		this.jfee = jfee;
	}
	public int getNfee() {
		return nfee;
	}
	public void setNfee(int nfee) {
		this.nfee = nfee;
	}
	public int getFfee() {
		return ffee;
	}
	public void setFfee(int ffee) {
		this.ffee = ffee;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getTax() {
		return tax;
	}
	public void setTax(int tax) {
		this.tax = tax;
	}
	public int getResult() {
		return result;
	}
	public void setResult(int result) {
		this.result = result;
	}
	public int getHobong() {
		return hobong;
	}
	public void setHobong(int hobong) {
		this.hobong = hobong;
	}
	public int getNtime() {
		return ntime;
	}
	public void setNtime(int ntime) {
		this.ntime = ntime;
	}
	public int getFnum() {
		return fnum;
	}
	public void setFnum(int fnum) {
		this.fnum = fnum;
	}
	
	
}
