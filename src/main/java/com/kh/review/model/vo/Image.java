package com.kh.review.model.vo;

public class Image {
	
	private int imgNo;
	private String refBno;
	private String originName;
	private String changeName;
	private String filePath;
	private String uploadDate;
	private String reviewBno;
	private String postBno;
	private String profileBno;
	private int fileLevel;
	private String status;
	
	public Image () {}

	public Image(int imgNo, String refBno, String originName, String changeName, String filePath, String uploadDate,
			String reviewBno, String postBno, String profileBno, int fileLevel, String status) {
		super();
		this.imgNo = imgNo;
		this.refBno = refBno;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.reviewBno = reviewBno;
		this.postBno = postBno;
		this.profileBno = profileBno;
		this.fileLevel = fileLevel;
		this.status = status;
	}

	public int getImgNo() {
		return imgNo;
	}

	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
	}

	public String getRefBno() {
		return refBno;
	}

	public void setRefBno(String refBno) {
		this.refBno = refBno;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(String uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getReviewBno() {
		return reviewBno;
	}

	public void setReviewBno(String reviewBno) {
		this.reviewBno = reviewBno;
	}

	public String getPostBno() {
		return postBno;
	}

	public void setPostBno(String postBno) {
		this.postBno = postBno;
	}

	public String getProfileBno() {
		return profileBno;
	}

	public void setProfileBno(String profileBno) {
		this.profileBno = profileBno;
	}

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
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
		return "Image [imgNo=" + imgNo + ", refBno=" + refBno + ", originName=" + originName + ", changeName="
				+ changeName + ", filePath=" + filePath + ", uploadDate=" + uploadDate + ", reviewBno=" + reviewBno
				+ ", postBno=" + postBno + ", profileBno=" + profileBno + ", fileLevel=" + fileLevel + ", status="
				+ status + "]";
	}
	
}