package com.kh.calendar.model.vo;

public class Todo {
	
	private int checkNo;
	private int memNo;
	private String checkTitle;
	private String checkYN;
	private String checkMemo;
	private String checkDate;
	
	public Todo () {}

	public Todo(int checkNo, int memNo, String checkTitle, String checkYN, String checkMemo, String checkDate) {
		super();
		this.checkNo = checkNo;
		this.memNo = memNo;
		this.checkTitle = checkTitle;
		this.checkYN = checkYN;
		this.checkMemo = checkMemo;
		this.checkDate = checkDate;
	}
	
	

	public Todo(int checkNo, String checkTitle, String checkYN) {
		super();
		this.checkNo = checkNo;
		this.checkTitle = checkTitle;
		this.checkYN = checkYN;
	}

	public Todo(int memNo, String checkTitle, String checkYN, String checkDate) {
		super();
		this.memNo = memNo;
		this.checkTitle = checkTitle;
		this.checkYN = checkYN;
		this.checkDate = checkDate;
	}
	
	

	public Todo(int checkNo, int memNo, String checkTitle, String checkYN) {
		super();
		this.checkNo = checkNo;
		this.memNo = memNo;
		this.checkTitle = checkTitle;
		this.checkYN = checkYN;
	}

	public int getCheckNo() {
		return checkNo;
	}

	public void setCheckNo(int checkNo) {
		this.checkNo = checkNo;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getCheckTitle() {
		return checkTitle;
	}

	public void setCheckTitle(String checkTitle) {
		this.checkTitle = checkTitle;
	}

	public String getCheckYN() {
		return checkYN;
	}

	public void setCheckYN(String checkYN) {
		this.checkYN = checkYN;
	}

	public String getCheckMemo() {
		return checkMemo;
	}

	public void setCheckMemo(String checkMemo) {
		this.checkMemo = checkMemo;
	}

	public String getCheckDate() {
		return checkDate;
	}

	public void setCheckDate(String checkDate) {
		this.checkDate = checkDate;
	}

	@Override
	public String toString() {
		return "Todo [checkNo=" + checkNo + ", memNo=" + memNo + ", checkTitle=" + checkTitle + ", checkYN=" + checkYN
				+ ", checkMemo=" + checkMemo + ", checkDate=" + checkDate + "]";
	}
	

}
