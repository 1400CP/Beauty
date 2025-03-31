package com.kh.profile.controller.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.member.model.dao.MemberDao;
import com.kh.profile.controller.model.vo.Profile;
import com.kh.profile.controller.model.vo.UserProfileImage;

import static com.kh.common.JDBCTemplate.*;

public class ProfileDao {
	
	private Properties prop = new Properties();
	
	public ProfileDao() {
		String filePath = MemberDao.class.getResource("/db/sql/profile-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertProfile(Connection conn, Profile p) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertProfile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, p.getUserNo());
			pstmt.setString(2, p.getSkinTypeNo());
			pstmt.setString(3, p.getBodyTypeNo());
			pstmt.setString(4, p.getHairTypeNo());
			pstmt.setString(5, p.getScalpTypeNo());
			pstmt.setString(6, p.getSkinList());
			pstmt.setString(7, p.getScalpList());
			pstmt.setString(8, p.getBrandList());
			pstmt.setString(9, p.getRelease());
			pstmt.setString(10, p.getGender());
			pstmt.setString(11, p.getColor());
			   	        
			        
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
		
	}
	
	
	
	public int updateProfile(Connection conn, Profile p) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateProfile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, p.getSkinTypeNo());
			pstmt.setString(2, p.getBodyTypeNo());
			pstmt.setString(3, p.getHairTypeNo());
			pstmt.setString(4, p.getScalpTypeNo());
			pstmt.setString(5, p.getSkinList());
			pstmt.setString(6, p.getScalpList());
			pstmt.setString(7, p.getBrandList());
			pstmt.setString(8, p.getRelease());
			pstmt.setString(9, p.getColor());
			pstmt.setInt(10, p.getUserNo());
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertUserImage(Connection conn, UserProfileImage up, int userNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertUserImage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setString(2, up.getOriginName());
			pstmt.setString(3, up.getChangename());
			pstmt.setString(4, up.getFilepath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
}
