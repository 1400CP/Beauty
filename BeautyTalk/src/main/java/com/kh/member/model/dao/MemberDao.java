package com.kh.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import static com.kh.common.JDBCTemplate.*;
import com.kh.member.model.vo.Member;

public class MemberDao {
	
	private Properties prop = new Properties();
	
	public MemberDao() {
		String filePath = MemberDao.class.getResource("/db/sql/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public Member loginMember(Connection conn, String userId, String userPwd) {
		// select문 => ResultSet 객체(한행) => Member 객체
		Member m = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("MEM_NO"),
				               rset.getString("MEM_ID"),
				               rset.getString("MEM_PWD"),
				               rset.getString("MEM_NAME"),
				               rset.getString("EMAIL"),
				               rset.getString("NICKNAME"),
				               rset.getString("PHONE"),
				               rset.getInt("FOLLOWING_COUNT"),  // 추가 정보
				               rset.getInt("FOLLOWER_COUNT"),
				               rset.getInt("REVIEW_COUNT"),
				               rset.getInt("POST_COUNT"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}
	
	public int insertMember(Connection conn, Member m) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			pstmt.setString(3, m.getUserName());
			pstmt.setString(4, m.getEmail());
			pstmt.setString(5, m.getNickName());
			pstmt.setString(6, m.getPhone());
			pstmt.setString(7, m.getAgreeYN());
			pstmt.setString(8, m.getGender());
			pstmt.setString(9, m.getToken());
			
			result = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}
	

	public int deleteMember(Connection conn, String userPwd, String userId) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteMember");
		

			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userId);
				pstmt.setString(2, userPwd);
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
			
	}

	public int kakaoCheckUser(Connection conn, String kakaoEmail) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("kakaoCheckUser");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, kakaoEmail);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	
	public Member kakaoLoginMember(Connection conn, String kakaoEmail) {
		// select문 => ResultSet 객체(한행) => Member 객체
		Member m = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("kakaoLoginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, kakaoEmail);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("MEM_NO"),
				               rset.getString("MEM_ID"),
				               rset.getString("MEM_PWD"),
				               rset.getString("MEM_NAME"),
				               rset.getString("EMAIL"),
				               rset.getString("NICKNAME"),
				               rset.getString("PHONE"),
				               rset.getInt("FOLLOWING_COUNT"),  // 추가 정보
				               rset.getInt("FOLLOWER_COUNT"),
				               rset.getInt("REVIEW_COUNT"),
				               rset.getInt("POST_COUNT"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}
	
	public int NaverCheckUser(Connection conn, String Token) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("NaverCheckUser");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, Token);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;

	}
	
	public Member NaverLoginMember(Connection conn, String Token) {
		Member m = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("NaverLoginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, Token);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("MEM_NO"),
				               rset.getString("MEM_ID"),
				               rset.getString("MEM_PWD"),
				               rset.getString("MEM_NAME"),
				               rset.getString("EMAIL"),
				               rset.getString("NICKNAME"),
				               rset.getString("PHONE"),
				               rset.getInt("FOLLOWING_COUNT"),  // 추가 정보
				               rset.getInt("FOLLOWER_COUNT"),
				               rset.getInt("REVIEW_COUNT"),
				               rset.getInt("POST_COUNT"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}
	
	public int updateMember(Connection conn, Member m) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getUserName());
			pstmt.setString(2, m.getUserId());
			pstmt.setString(3, m.getUserPwd());
			pstmt.setString(4, m.getEmail());
			pstmt.setString(5, m.getNickName());
			pstmt.setString(6, m.getPhone());
			pstmt.setInt(7, m.getUserNo());
			
			result = pstmt.executeUpdate();
			System.out.println(result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
		
	}
	
	public Member selectMember(Connection conn, int userNo) {
		
		Member m = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("mem_no"),
							   rset.getString("mem_id"),
							   rset.getString("mem_pwd"),
							   rset.getString("mem_name"),
							   rset.getString("email"),
							   rset.getString("nickname"),
							   rset.getString("phone"),
							   rset.getDate("enroll_date"),
							   rset.getString("status"),
							   rset.getString("agree_yn"),
							   rset.getString("gender"),
							   rset.getString("token"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}
	
	public int idCheck(Connection conn, String checkId) {
		
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("idCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, checkId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("count");
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return count;
		
	}

}









