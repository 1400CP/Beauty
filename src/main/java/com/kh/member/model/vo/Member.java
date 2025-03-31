package com.kh.member.model.vo;

import java.sql.Date;
import com.google.gson.annotations.SerializedName;

public class Member {

	private int userNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String email;
	private String nickName;
	private String phone;
	private Date enrollDate;
	private String status;
	private String agreeYN;
	private String gender;
	private String token;
	private int following;
	private int follower;
	private int review;
	private int post;
	private String filePath;
	private int bfNo;
    private String skinType;
    private String bodyType;
    private String scalpType;
    private String hairType;
    private String simList;
    private String himList;
    private String brandList;
    private String marketingAgree; // RELEASE 컬럼명 변경
    private String color;
	

        
        
	public Member () {}
	
	



	public Member(String nickName, String filePath, int userNo) {
		super();
		this.userNo = userNo;
		this.nickName = nickName;
		this.filePath = filePath;
	}





	public Member(int userNo, String userId, String userPwd, String userName, String email, String nickName,
			String phone, String gender, int following, int follower, int review, int post, String filePath) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.email = email;
		this.nickName = nickName;
		this.phone = phone;
		this.gender = gender;
		this.following = following;
		this.follower = follower;
		this.review = review;
		this.post = post;
		this.filePath = filePath;
	}



	public Member(int userNo, String userId, String userPwd, String userName, String email, String nickName,
			String phone, Date enrollDate, String status, String agreeYN, String gender, String token, int following,
			int follower, int review, int post) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.email = email;
		this.nickName = nickName;
		this.phone = phone;
		this.enrollDate = enrollDate;
		this.status = status;
		this.agreeYN = agreeYN;
		this.gender = gender;
		this.token = token;
		this.following = following;
		this.follower = follower;
		this.review = review;
		this.post = post;
	}





	public Member(int userNo, String userId, String userPwd, String userName, String email, String nickName,
			String phone, String gender, int following, int follower, int review, int post) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.email = email;
		this.nickName = nickName;
		this.phone = phone;
		this.gender = gender;
		this.following = following;
		this.follower = follower;
		this.review = review;
		this.post = post;
	}
	
	



	public Member(int userNo, String userId, String userPwd, String userName, String email, String nickName,
			String phone, Date enrollDate, String status, String agreeYN, String gender, String token) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.email = email;
		this.nickName = nickName;
		this.phone = phone;
		this.enrollDate = enrollDate;
		this.status = status;
		this.agreeYN = agreeYN;
		this.gender = gender;
		this.token = token;
	}



	public Member(String userId, String userPwd, String userName, String email, String nickName, String phone,
			String agreeYN, String gender, String token) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.email = email;
		this.nickName = nickName;
		this.phone = phone;
		this.agreeYN = agreeYN;
		this.gender = gender;
		this.token = token;
	}
	
	
	public Member(String userId, String userPwd, String userName, String email, String nickName, String phone,
			String agreeYN, String gender) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.email = email;
		this.nickName = nickName;
		this.phone = phone;
		this.agreeYN = agreeYN;
		this.gender = gender;

	}
	
	
	

	public Member(String userId, String userPwd, String userName, String email, String nickName, String phone) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.email = email;
		this.nickName = nickName;
		this.phone = phone;
	}
	
	
	public Member(int userNo, String userId, String userPwd, String userName, String email, String nickName,
			String phone) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.email = email;
		this.nickName = nickName;
		this.phone = phone;
	}
	



	public Member(int userNo, String userId, String userPwd, String userName, String email, String nickName,
			String phone, String gender, String token, int following, int follower, int review, int post,
			String filePath, int bfNo, String skinType, String bodyType, String scalpType, String hairType, String simList,
			String himList, String brandList, String marketingAgree, String color) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.email = email;
		this.nickName = nickName;
		this.phone = phone;
		this.gender = gender;
		this.token = token;
		this.following = following;
		this.follower = follower;
		this.review = review;
		this.post = post;
		this.filePath = filePath;
		this.bfNo = bfNo;
		this.skinType = skinType;
		this.bodyType = bodyType;
		this.scalpType = scalpType;
		this.hairType = hairType;
		this.simList = simList;
		this.himList = himList;
		this.brandList = brandList;
		this.marketingAgree = marketingAgree;
		this.color = color;
	}
	
	



	public Member(String nickName, String filePath) {
		super();
		this.nickName = nickName;
		this.filePath = filePath;
	}



	public int getBfNo() {
		return bfNo;
	}



	public void setBfNo(int bfNo) {
		this.bfNo = bfNo;
	}



	public String getSkinType() {
		return skinType;
	}



	public void setSkinType(String skinType) {
		this.skinType = skinType;
	}



	public String getBodyType() {
		return bodyType;
	}



	public void setBodyType(String bodyType) {
		this.bodyType = bodyType;
	}



	public String getScalpType() {
		return scalpType;
	}



	public void setScalpType(String scalpType) {
		this.scalpType = scalpType;
	}



	public String getHairType() {
		return hairType;
	}



	public void setHairType(String hairType) {
		this.hairType = hairType;
	}



	public String getSimList() {
		return simList;
	}



	public void setSimList(String simList) {
		this.simList = simList;
	}



	public String getHimList() {
		return himList;
	}



	public void setHimList(String himList) {
		this.himList = himList;
	}



	public String getBrandList() {
		return brandList;
	}



	public void setBrandList(String brandList) {
		this.brandList = brandList;
	}



	public String getMarketingAgree() {
		return marketingAgree;
	}



	public void setMarketingAgree(String marketingAgree) {
		this.marketingAgree = marketingAgree;
	}



	public String getColor() {
		return color;
	}



	public void setColor(String color) {
		this.color = color;
	}


	public Member(int userNo, String userId, String userName) {
			super();
			this.userNo = userNo;
			this.userId = userId;
			this.userName = userName;
	}
	

	public Member(int userNo, String userName, int follower) {
		super();
		this.userNo = userNo;
		this.userName = userName;
		this.follower = follower;
	}



	public String getFilePath() {
		return filePath;
	}



	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}


	
	public int getUserNo() {
		return userNo;
	}



	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}



	public String getUserId() {
		return userId;
	}



	public void setUserId(String userId) {
		this.userId = userId;
	}



	public String getUserPwd() {
		return userPwd;
	}



	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}



	public String getUserName() {
		return userName;
	}



	public void setUserName(String userName) {
		this.userName = userName;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getNickName() {
		return nickName;
	}



	public void setNickName(String nickName) {
		this.nickName = nickName;
	}



	public String getPhone() {
		return phone;
	}



	public void setPhone(String phone) {
		this.phone = phone;
	}



	public Date getEnrollDate() {
		return enrollDate;
	}



	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	public String getAgreeYN() {
		return agreeYN;
	}



	public void setAgreeYN(String agreeYN) {
		this.agreeYN = agreeYN;
	}



	public String getGender() {
		return gender;
	}



	public void setGender(String gender) {
		this.gender = gender;
	}



	public String getToken() {
		return token;
	}



	public void setToken(String token) {
		this.token = token;
	}



	public int getFollowing() {
		return following;
	}



	public void setFollowing(int following) {
		this.following = following;
	}



	public int getFollower() {
		return follower;
	}



	public void setFollower(int follower) {
		this.follower = follower;
	}



	public int getReview() {
		return review;
	}



	public void setReview(int review) {
		this.review = review;
	}



	public int getPost() {
		return post;
	}



	public void setPost(int post) {
		this.post = post;
	}



	public Member(int userNo, String userId, String userPwd, String userName, String email, String nickName,
			String phone, Date enrollDate, String status, String agreeYN, String gender, String token, int following,
			int follower, int review, int post, String filePath, int bfNo, String skinType, String bodyType,
			String scalpType, String hairType, String simList, String himList, String brandList, String marketingAgree,
			String color) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.email = email;
		this.nickName = nickName;
		this.phone = phone;
		this.enrollDate = enrollDate;
		this.status = status;
		this.agreeYN = agreeYN;
		this.gender = gender;
		this.token = token;
		this.following = following;
		this.follower = follower;
		this.review = review;
		this.post = post;
		this.filePath = filePath;
		this.bfNo = bfNo;
		this.skinType = skinType;
		this.bodyType = bodyType;
		this.scalpType = scalpType;
		this.hairType = hairType;
		this.simList = simList;
		this.himList = himList;
		this.brandList = brandList;
		this.marketingAgree = marketingAgree;
		this.color = color;
	}



	
}


