package com.kh.member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.common.JDBCTemplate.*;

import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

public class MemberService {
	
	public Member loginMember(String userId, String userPwd) {
		Connection conn = getConnection();
		Member m = new MemberDao().loginMember(conn, userId, userPwd);
		close(conn);
		return m;
	}
	
	public int insertMember(Member m) {
		
		Connection conn = getConnection();
		int result = new MemberDao().insertMember(conn, m);
		
		if(result > 0) {
			commit(conn);
			
		} else {
			rollback(conn);
		}
		return result;
	}
	

	public int deleteMember(String userPwd, String userId) {
		Connection conn = getConnection();
		
		int result = new MemberDao().deleteMember(conn, userPwd, userId);
		
		Member deleteMem = null;
		if(result > 0) { //실패
			commit(conn);
		} else { //성공
			rollback(conn);
		}
		return result;
	}

	
	public int kakaoCheckUser(String kakaoId) {
		Connection conn = getConnection();
		int result = new MemberDao().kakaoCheckUser(conn, kakaoId);
		close(conn);
		return result;
	}
	




	public Member kakaoLoginMember(String kakaoId) {
		Connection conn = getConnection();
		Member m = new MemberDao().kakaoLoginMember(conn, kakaoId);
		close(conn);
		return m;
	}
	
	public int NaverCheckUser(String Token) {
		Connection conn = getConnection();
		int result = new MemberDao().NaverCheckUser(conn, Token);
		
		close(conn);
		return result;
		
	}
	
	public Member NaverLoginMember(String Token) {
		Connection conn = getConnection();
		Member m = new MemberDao().NaverLoginMember(conn, Token);
		close(conn);
		return m;
	}
	
	public Member updateMember(Member m) {
		Connection conn = getConnection();
		int result = new MemberDao().updateMember(conn, m);
		Member updateMem = null;
		if(result > 0) {
			commit(conn);
			updateMem = new MemberDao().selectMember(conn, m.getUserNo());
		} else {
			rollback(conn);
		}
		close(conn);
		return updateMem;
	}
	
	public int idCheck(String checkId) {
		
		Connection conn = getConnection();
		int count = new MemberDao().idCheck(conn, checkId);
		
		close(conn);
		return count;
	}
	
public Member selectMember(int userNo) {
		
		Connection conn = getConnection();
		Member updateMem = new MemberDao().selectMember(conn, userNo);
		close(conn);
		return updateMem;
		
		
	}
	

	
public ArrayList<Member> selectListFollow(int userNo) {
		
		Connection conn = getConnection();
		ArrayList<Member> list = new MemberDao().selectListFollow(conn, userNo);
		close(conn);
		return list;
		
		
	}

public ArrayList<Member> selectListFollower(int userNo) {
	
	Connection conn = getConnection();
	ArrayList<Member> list = new MemberDao().selectListFollower(conn, userNo);
	close(conn);
	return list;
	
	
}

public ArrayList<Member> followList(String nickname) {
	
	Connection conn = getConnection();
	ArrayList<Member> list = new MemberDao().followList(conn, nickname);
	close(conn);
	return list;
		
}

public ArrayList<Member> followerList(String nickname) {
	
	Connection conn = getConnection();
	ArrayList<Member> list = new MemberDao().followerList(conn, nickname);
	close(conn);
	return list;
		
}

	public Member findID(Member m) {
		Connection conn = getConnection();
		Member findIDResult = new MemberDao().findID(conn, m);
		close(conn);
		return findIDResult;
	}

	public int checkUserExists(String name, String userId, String email) {
		Connection conn = getConnection();
		int result = new MemberDao().checkUserExists(conn, name, userId, email);
		close(conn);
		return result;
	}
	
	public int updatePassword(String userId, String name, String email, String newPassword) {
		Connection conn = getConnection();
		int result = new MemberDao().updatePassword(conn, userId, name, email, newPassword);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}


}
