package com.kh.people.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.common.JDBCTemplate.*;
import com.kh.member.model.vo.Member;
import com.kh.people.model.dao.PeopleDao;

public class PeopleService {
	
	public ArrayList<Member> selectPeopleList() {
		Connection conn = getConnection();
		ArrayList<Member> peopleList = new PeopleDao().selectPeopleList(conn);
		close(conn);
		return peopleList;
	}
	
	public ArrayList<Integer> selectActive(int userNo) {
		Connection conn = getConnection();
		ArrayList<Integer> activeList = new PeopleDao().selectActive(conn, userNo);
		close(conn);
		return activeList;
	}
	
	public int insertFollow(int loginUserNo, int targetUserNo) {
		Connection conn = getConnection();
		int result = new PeopleDao().insertFollow(conn, loginUserNo, targetUserNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}
	
	public int deleteUnfollow(int loginUserNo, int targetUserNo) {
		Connection conn = getConnection();
		int result = new PeopleDao().deleteUnfollow(conn, loginUserNo, targetUserNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}

}
