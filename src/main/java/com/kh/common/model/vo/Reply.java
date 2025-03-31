package com.kh.common.model.vo;

import java.util.Date;

import com.kh.member.model.vo.Member;

public class Reply {
	
	private int replyNo;
	private int refBno;
	private int memNo;
	private String replyContent;
	private String createDate;
	private String replyStatus;
	
	private String userId;
	
	public Reply() {};
	
	public Reply(int replyNo, int refBno, int memNo, String replyContent, String createDate, String replyStatus) {
		super();
		this.replyNo = replyNo;
		this.refBno = refBno;
		this.memNo = memNo;
		this.replyContent = replyContent;
		this.createDate = createDate;
		this.replyStatus = replyStatus;
	}
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public int getRefBno() {
		return refBno;
	}

	public void setRefBno(int refBno) {
		this.refBno = refBno;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getReplyStatus() {
		return replyStatus;
	}

	public void setReplyStatus(String replyStatus) {
		this.replyStatus = replyStatus;
	}

	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", refBno=" + refBno + ", memNo=" + memNo + ", replyContent="
				+ replyContent + ", createDate=" + createDate + ", replyStatus=" + replyStatus + "]";
	}

}
