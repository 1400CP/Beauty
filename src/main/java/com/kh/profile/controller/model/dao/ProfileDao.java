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
	
	public Profile selectProfile(Connection conn, int userNo) {
		
		Profile p = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectProfile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				p = new Profile(rset.getInt("bf_no"),
								rset.getInt("mem_no"),
								rset.getString("st_no"),
								rset.getString("bt_no"),
								rset.getString("ht_no"),
								rset.getString("scalp_no"),
								rset.getString("sim_list"),
								rset.getString("him_list"),
								rset.getString("brandlist"),
								rset.getString("release"),
								rset.getString("gender"),
								rset.getString("color"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return p;
		
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
			
			System.out.println(p.getScalpList());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
}
