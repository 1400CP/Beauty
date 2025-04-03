package com.kh.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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

			if (rset.next()) {
				m = new Member(rset.getInt("MEM_NO"), rset.getString("MEM_ID"), rset.getString("MEM_PWD"),
						rset.getString("MEM_NAME"), rset.getString("EMAIL"), rset.getString("NICKNAME"),
						rset.getString("PHONE"), rset.getString("GENDER"), rset.getInt("FOLLOWING_COUNT"),
						rset.getInt("FOLLOWER_COUNT"), rset.getInt("REVIEW_COUNT"), rset.getInt("POST_COUNT"),
						rset.getString("PROFILE_IMAGE_PATH"));

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

	public int kakaoCheckUser(Connection conn, String kakaoId) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("kakaoCheckUser");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, kakaoId);

			rset = pstmt.executeQuery();

			if (rset.next()) {
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

	public Member kakaoLoginMember(Connection conn, String kakaoId) {
		// select문 => ResultSet 객체(한행) => Member 객체
		Member m = null;

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("kakaoLoginMember");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, kakaoId);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				m = new Member(rset.getInt("MEM_NO"), rset.getString("MEM_ID"), rset.getString("MEM_PWD"),
						rset.getString("MEM_NAME"), rset.getString("EMAIL"), rset.getString("NICKNAME"),
						rset.getString("PHONE"), rset.getString("GENDER"), rset.getInt("FOLLOWING_COUNT"), // 추가 정보
						rset.getInt("FOLLOWER_COUNT"), rset.getInt("REVIEW_COUNT"), rset.getInt("POST_COUNT"),
						rset.getString("PROFILE_IMAGE_PATH"));
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

			if (rset.next()) {
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

			if (rset.next()) {
				m = new Member(rset.getInt("MEM_NO"), // userNo
						rset.getString("MEM_ID"), // userId
						rset.getString("MEM_PWD"), // userPwd
						rset.getString("MEM_NAME"), // userName
						rset.getString("EMAIL"), // email
						rset.getString("NICKNAME"), // nickName
						rset.getString("PHONE"), // phone
						rset.getString("GENDER"), // gender (MEMBER 테이블의 GENDER)
						rset.getString("TOKEN"), // token
						rset.getInt("FOLLOWING_COUNT"), // following
						rset.getInt("FOLLOWER_COUNT"), // follower
						rset.getInt("REVIEW_COUNT"), // review
						rset.getInt("POST_COUNT"), // post
						rset.getString("PROFILE_IMAGE_PATH") != null ? rset.getString("PROFILE_IMAGE_PATH") : "", // filePath
						rset.getInt("BF_NO"), rset.getString("SKIN_TYPE"), // skinType
						rset.getString("BODY_TYPE"), // bodyType
						rset.getString("SCALP_TYPE"), // scalpType
						rset.getString("HAIR_TYPE"), // hairType
						rset.getString("SIM_LIST"), // simList
						rset.getString("HIM_LIST"), // himList
						rset.getString("BRANDLIST"), // brandList
						rset.getString("MARKETING_AGREE"), // release (마케팅 정보 수신 여부)
						rset.getString("PERSONAL_COLOR") // color
				);
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
			System.out.println(userNo);

			rset = pstmt.executeQuery();
			System.out.println("💡 실행할 SQL: " + sql);

			if (rset.next()) {
				System.out.println("왔냐/" + m);
				m = new Member(rset.getInt("MEM_NO"), // userNo
						rset.getString("MEM_ID"), // userId
						rset.getString("MEM_PWD"), // userPwd
						rset.getString("MEM_NAME"), // userName
						rset.getString("EMAIL"), // email
						rset.getString("NICKNAME"), // nickName
						rset.getString("PHONE"), // phone
						rset.getString("GENDER"), // gender (MEMBER 테이블의 GENDER)
						rset.getString("TOKEN"), // token
						rset.getInt("FOLLOWING_COUNT"), // following
						rset.getInt("FOLLOWER_COUNT"), // follower
						rset.getInt("REVIEW_COUNT"), // review
						rset.getInt("POST_COUNT"), // post
						rset.getString("PROFILE_IMAGE_PATH") != null ? rset.getString("PROFILE_IMAGE_PATH") : "", // filePath
						rset.getInt("BF_NO"), 
						rset.getString("SKIN_TYPE"), // skinType
						rset.getString("BODY_TYPE"), // bodyType
						rset.getString("SCALP_TYPE"), // scalpType
						rset.getString("HAIR_TYPE"), // hairType
						rset.getString("SIM_LIST"), // simList
						rset.getString("HIM_LIST"), // himList
						rset.getString("BRANDLIST"), // brandList
						rset.getString("MARKETING_AGREE"), // release (마케팅 정보 수신 여부)
						rset.getString("PERSONAL_COLOR") // color
						
				);
				System.out.println("왔냐/" + m);
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

			if (rset.next()) {
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

	public ArrayList<Member> followList(Connection conn, String nickname) {

		ArrayList<Member> list = new ArrayList<Member>();

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		// 프로퍼티 파일에서 SQL 쿼리 가져오기
		String sql = prop.getProperty("followList");

		try {
			pstmt = conn.prepareStatement(sql);

			// 닉네임을 파라미터로 설정
			pstmt.setString(1, "%" + nickname + "%");

			rset = pstmt.executeQuery();

			while (rset.next()) {
				// rset에서 닉네임과 파일 경로를 가져옴
				int followUserNo = rset.getInt("MEM_NO");
				String nicknameFromDB = rset.getString("NICKNAME");
				String filePath = rset.getString("FILEPATH");

				// 콘솔에 출력
				System.out.println("Nickname: " + nicknameFromDB + ", FilePath: " + filePath);

				// 리스트에 추가
				list.add(new Member(followUserNo, nicknameFromDB, filePath));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}
	
	public ArrayList<Member> followerList(Connection conn, String nickname) {

		ArrayList<Member> list = new ArrayList<Member>();

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		// 프로퍼티 파일에서 SQL 쿼리 가져오기
		String sql = prop.getProperty("followerList");

		try {
			pstmt = conn.prepareStatement(sql);

			// 닉네임을 파라미터로 설정
			pstmt.setString(1, "%" + nickname + "%");

			rset = pstmt.executeQuery();

			while (rset.next()) {
				// rset에서 닉네임과 파일 경로를 가져옴
				int followerUserNo = rset.getInt("MEM_NO");
				String nicknameFromDB = rset.getString("NICKNAME");
				String filePath = rset.getString("FILEPATH");

				// 콘솔에 출력
				System.out.println("Nickname: " + nicknameFromDB + ", FilePath: " + filePath);

				// 리스트에 추가
				list.add(new Member(followerUserNo, nicknameFromDB, filePath));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public ArrayList<Member> selectListFollow(Connection conn, int userNo) {

		ArrayList<Member> list = new ArrayList<Member>();

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectListFollowing");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();

			while (rset.next()) {
				int followUserNo = rset.getInt("MEM_NO");
				String nicknameFromDB = rset.getString("NICKNAME");
				String filePath = rset.getString("FILEPATH");

				// 콘솔에 출력 (디버깅 용)
				System.out.println("followUserNo: " + followUserNo + ", Nickname: " + nicknameFromDB + ", FilePath: " + filePath);

				// 리스트에 추가
				list.add(new Member(followUserNo, nicknameFromDB, filePath));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	
	public ArrayList<Member> selectListFollower(Connection conn, int userNo) {

		ArrayList<Member> list = new ArrayList<Member>();

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectListFollower");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();

			while (rset.next()) {
				int followUserNo = rset.getInt("MEM_NO");
				String nicknameFromDB = rset.getString("NICKNAME");
				String filePath = rset.getString("FILEPATH");

				// 콘솔에 출력 (디버깅 용)
				System.out.println("followUserNo: " + followUserNo + ", Nickname: " + nicknameFromDB + ", FilePath: " + filePath);
				// 리스트에 추가
				list.add(new Member(followUserNo, nicknameFromDB, filePath));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public Member findID(Connection conn, Member m) {
		Member findIdResult = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("findID");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, m.getUserName());
			pstmt.setString(2, m.getEmail());
			pstmt.setString(3, m.getPhone());

			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				findIdResult = new Member();
				findIdResult.setUserId(rset.getString("MEM_ID"));
				findIdResult.setUserName(rset.getString("MEM_NAME"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return findIdResult;
	}
	
	public int checkUserExists(Connection conn, String name, String userId, String email) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("checkUserExists");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, name);
			pstmt.setString(2, userId);
			pstmt.setString(3, email);
			
			rset = pstmt.executeQuery();

			if (rset.next()) {
				result = rset.getInt("count");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	
	public int updatePassword(Connection conn, String userId, String name, String email, String newPassword) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updatePassword");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newPassword);
			pstmt.setString(2, userId);
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

}
