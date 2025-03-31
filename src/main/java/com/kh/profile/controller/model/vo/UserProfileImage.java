package com.kh.profile.controller.model.vo;

public class UserProfileImage {
	
	private int imageNo;
	private int refNo;
	private String originName;
	private String changename;
	private String filepath;
	private String uploadDate;
	private String fileLevel;
	private String status;
	
	public UserProfileImage() {}

	public UserProfileImage(int imageNo, int refNo, String originName, String changename, String filepath,
			String uploadDate, String fileLevel, String status) {
		super();
		this.imageNo = imageNo;
		this.refNo = refNo;
		this.originName = originName;
		this.changename = changename;
		this.filepath = filepath;
		this.uploadDate = uploadDate;
		this.fileLevel = fileLevel;
		this.status = status;
	}

	public int getImageNo() {
		return imageNo;
	}

	public void setImageNo(int imageNo) {
		this.imageNo = imageNo;
	}

	public int getRefNo() {
		return refNo;
	}

	public void setRefNo(int refNo) {
		this.refNo = refNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangename() {
		return changename;
	}

	public void setChangename(String changename) {
		this.changename = changename;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public String getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(String uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(String fileLevel) {
		this.fileLevel = fileLevel;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "UserProfileImage [imageNo=" + imageNo + ", refNo=" + refNo + ", originName=" + originName
				+ ", changename=" + changename + ", filepath=" + filepath + ", uploadDate=" + uploadDate
				+ ", fileLevel=" + fileLevel + ", status=" + status + "]";
	}

	
	
}
