package com.kh.post.model.vo;

import java.util.ArrayList;
import java.util.Date;

import com.kh.review.model.vo.Image;

public class Post {
	
	private int postNo;
	private int memNo;
	private String title;
	private String content;
	private Date createDate;
	private int likePost;
	private String status;
	
	private ArrayList<Image2> images;
	
	public Post() {}

	public Post(int postNo, int memNo, String title, String content, Date createDate, int likePost, String status,
			ArrayList<Image2> images) {
		super();
		this.postNo = postNo;
		this.memNo = memNo;
		this.title = title;
		this.content = content;
		this.createDate = createDate;
		this.likePost = likePost;
		this.status = status;
		this.images = images;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public int getLikePost() {
		return likePost;
	}

	public void setLikePost(int likePost) {
		this.likePost = likePost;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public ArrayList<Image2> getImages() {
		return images;
	}

	public void setImages(ArrayList<Image2> images) {
		this.images = images;
	}

	@Override
	public String toString() {
		return "Post [postNo=" + postNo + ", memNo=" + memNo + ", title=" + title + ", content=" + content
				+ ", createDate=" + createDate + ", likePost=" + likePost + ", status=" + status + ", images=" + images
				+ "]";
	}
	
}
