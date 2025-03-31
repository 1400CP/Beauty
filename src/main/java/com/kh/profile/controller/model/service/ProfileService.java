package com.kh.profile.controller.model.service;
import java.sql.Connection;

import com.kh.profile.controller.model.dao.ProfileDao;
import com.kh.profile.controller.model.vo.Profile;
import com.kh.profile.controller.model.vo.UserProfileImage;

import static com.kh.common.JDBCTemplate.*;


public class ProfileService {
	
	public int insertProfile(Profile p) {
		
		Connection conn = getConnection();
		int result = new ProfileDao().insertProfile(conn, p);
		
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
	public int updateProfile(Profile p) {
		Connection conn = getConnection();
		int result = new ProfileDao().updateProfile(conn, p);
		
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int insertUserImage(UserProfileImage up, int userNo) {
		
		Connection conn = getConnection();
		
		int result = new ProfileDao().insertUserImage(conn, up, userNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}
	
//	public UserProfileImage selectProfileImg(String userNo) {
//		
//		
//		
//	}
	
	

}
