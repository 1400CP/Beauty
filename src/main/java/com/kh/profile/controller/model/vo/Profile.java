package com.kh.profile.controller.model.vo;

public class Profile {

	private int bfNO;
    private int userNo;   // MEM_NO (회원 번호)
    private String skinTypeNo;  // T_NO (피부 타입)
    private String bodyTypeNo;
    private String hairTypeNo;
    private String scalpTypeNo;
    private String skinList;
    private String scalpList;
    private String brandList;
    private String release;  // 마케팅 동의 여부 (Y/N)
    private String gender;// 성별 (M/F)
    private String color;
	
	public Profile () {}


	
	

	public Profile(int bfNO, int userNo, String skinTypeNo, String bodyTypeNo, String hairTypeNo, String scalpTypeNo,
			String skinList, String scalpList, String brandList, String release, String gender, String color) {
		super();
		this.bfNO = bfNO;
		this.userNo = userNo;
		this.skinTypeNo = skinTypeNo;
		this.bodyTypeNo = bodyTypeNo;
		this.hairTypeNo = hairTypeNo;
		this.scalpTypeNo = scalpTypeNo;
		this.skinList = skinList;
		this.scalpList = scalpList;
		this.brandList = brandList;
		this.release = release;
		this.gender = gender;
		this.color = color;
	}







	public Profile(int userNo, String skinTypeNo, String bodyTypeNo, String hairTypeNo, String scalpTypeNo, String skinList,
			String scalpList, String brandList, String release, String gender, String color) {
		super();
		this.userNo = userNo;
		this.skinTypeNo = skinTypeNo;
		this.bodyTypeNo = bodyTypeNo;
		this.hairTypeNo = hairTypeNo;
		this.scalpTypeNo = scalpTypeNo;
		this.skinList = skinList;
		this.scalpList = scalpList;
		this.brandList = brandList;
		this.release = release;
		this.gender = gender;
		this.color = color;
	}





	public int getBfNO() {
		return bfNO;
	}





	public void setBfNO(int bfNO) {
		this.bfNO = bfNO;
	}





	public int getUserNo() {
		return userNo;
	}





	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}





	public String getSkinTypeNo() {
		return skinTypeNo;
	}





	public void setSkinTypeNo(String skinTypeNo) {
		this.skinTypeNo = skinTypeNo;
	}





	public String getBodyTypeNo() {
		return bodyTypeNo;
	}





	public void setBodyTypeNo(String bodyTypeNo) {
		this.bodyTypeNo = bodyTypeNo;
	}





	public String getHairTypeNo() {
		return hairTypeNo;
	}





	public void setHairTypeNo(String hairTypeNo) {
		this.hairTypeNo = hairTypeNo;
	}





	public String getScalpTypeNo() {
		return scalpTypeNo;
	}





	public void setScalpTypeNo(String scalpTypeNo) {
		this.scalpTypeNo = scalpTypeNo;
	}





	public String getSkinList() {
		return skinList;
	}





	public void setSkinList(String skinList) {
		this.skinList = skinList;
	}





	public String getScalpList() {
		return scalpList;
	}





	public void setScalpList(String scalpList) {
		this.scalpList = scalpList;
	}





	public String getBrandList() {
		return brandList;
	}





	public void setBrandList(String brandList) {
		this.brandList = brandList;
	}





	public String getRelease() {
		return release;
	}





	public void setRelease(String release) {
		this.release = release;
	}





	public String getGender() {
		return gender;
	}





	public void setGender(String gender) {
		this.gender = gender;
	}





	public String getColor() {
		return color;
	}





	public void setColor(String color) {
		this.color = color;
	}





	@Override
	public String toString() {
		return "Profile [bfNO=" + bfNO + ", userNo=" + userNo + ", skinTypeNo=" + skinTypeNo + ", bodyTypeNo="
				+ bodyTypeNo + ", hairTypeNo=" + hairTypeNo + ", scalpTypeNo=" + scalpTypeNo + ", skinList=" + skinList
				+ ", scalpList=" + scalpList + ", brandList=" + brandList + ", release=" + release + ", gender="
				+ gender + ", color=" + color + "]";
	}



}
