package com.kh.review.vo;

import java.sql.Date;

public class Review {
	
	private int reviewNo;
	private String pcode;
	private int memNo;
	private String content;
	private Date createDate;
	private int pRating;
	private int rRating;
	private int prRating;
	private int likeReview;
	private String status;
	
	public Review () {}

	public Review(int reviewNo, String pcode, int memNo, String content, Date createDate, int pRating, int rRating,
			int prRating, int likeReview, String status) {
		super();
		this.reviewNo = reviewNo;
		this.pcode = pcode;
		this.memNo = memNo;
		this.content = content;
		this.createDate = createDate;
		this.pRating = pRating;
		this.rRating = rRating;
		this.prRating = prRating;
		this.likeReview = likeReview;
		this.status = status;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getPcode() {
		return pcode;
	}

	public void setPcode(String pcode) {
		this.pcode = pcode;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public int getpRating() {
		return pRating;
	}

	public void setpRating(int pRating) {
		this.pRating = pRating;
	}

	public int getrRating() {
		return rRating;
	}

	public void setrRating(int rRating) {
		this.rRating = rRating;
	}

	public int getPrRating() {
		return prRating;
	}

	public void setPrRating(int prRating) {
		this.prRating = prRating;
	}

	public int getLikeReview() {
		return likeReview;
	}

	public void setLikeReview(int likeReview) {
		this.likeReview = likeReview;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", pcode=" + pcode + ", memNo=" + memNo + ", content=" + content
				+ ", createDate=" + createDate + ", pRating=" + pRating + ", rRating=" + rRating + ", prRating="
				+ prRating + ", likeReview=" + likeReview + ", status=" + status + "]";
	};

}
