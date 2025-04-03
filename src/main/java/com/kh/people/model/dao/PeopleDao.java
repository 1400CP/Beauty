package com.kh.people.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.kh.common.JDBCTemplate.*;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

public class PeopleDao {
	
	private Properties prop = new Properties();
	
	public PeopleDao() {
		
		String filePath = MemberDao.class.getResource("/db/sql/people-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<Member> selectPeopleList(Connection conn) {
		ArrayList<Member> peopleList = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPeopleList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				peopleList.add(new Member(rset.getInt("MEM_NO"),
										  rset.getString("MEM_NAME"), 
										  rset.getInt("FOLLOWER_CNT"),
										  rset.getString("FILEPATH")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return peopleList;
	}
	
	public ArrayList<Integer> selectActive(Connection conn, int userNo) {
		ArrayList<Integer> activeList = new ArrayList<Integer>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectActive");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				activeList.add(rset.getInt("FOLLOWING"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return activeList;
	}
	
	public int insertFollow(Connection conn, int loginUserNo, int targetUserNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertFollow");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, targetUserNo);
			pstmt.setInt(2, loginUserNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteUnfollow(Connection conn, int loginUserNo, int targetUserNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteUnfollow");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, targetUserNo);
			pstmt.setInt(2, loginUserNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

}
