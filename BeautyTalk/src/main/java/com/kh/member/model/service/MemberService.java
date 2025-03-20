package com.kh.member.model.service;

import java.sql.Connection;

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

	
	public int kakaoCheckUser(String kakaoEmail) {
		Connection conn = getConnection();
		int result = new MemberDao().kakaoCheckUser(conn, kakaoEmail);
		close(conn);
		return result;
	}
	




	public Member kakaoLoginMember(String kakaoEmail) {
		Connection conn = getConnection();
		Member m = new MemberDao().kakaoLoginMember(conn, kakaoEmail);
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
		System.out.println(result);
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
	
	


}
