package com.kh.calendar.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.calendar.model.dao.CalendarDao;
import com.kh.calendar.model.vo.Calendar;
import com.kh.calendar.model.vo.Todo;
import com.kh.member.model.vo.Member;

import static com.kh.common.JDBCTemplate.*;

public class CalendarService {
	
	public int insertSchedule(int userNo, Calendar c) {
		Connection conn = getConnection();
		int result = new CalendarDao().insertSchedule(conn, userNo, c);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}
	
	public ArrayList<Calendar> scheduleList(int userNo) {
		Connection conn = getConnection();
		ArrayList<Calendar> scheduleList = new CalendarDao().scheduleList(conn, userNo);
		close(conn);
		return scheduleList;
	}
	
	public int deleteSchedule(int scheduleNo) {
		Connection conn = getConnection();
		int result = new CalendarDao().deleteSchedule(conn, scheduleNo);
		
		if(result > 0) {
			commit(conn);
			
		} else {
			rollback(conn);
		}
		return result;
	}
	
	public ArrayList<Member> selectFollowList(int userNo) {
		Connection conn = getConnection();
		ArrayList<Member> list = new CalendarDao().selectFollowList(conn, userNo);
		close(conn);
		return list;
	}
	
	public Member selectFollowUserName(String userId) {
		Connection conn = getConnection();
		Member userName = new CalendarDao().selectFollowUserName(conn, userId);
		close(conn);
		return userName;
	}
	
	public ArrayList<Calendar> followingScheduleList(String userId) {
		Connection conn = getConnection();
		ArrayList<Calendar> scheduleList = new CalendarDao().followingScheduleList(conn, userId);
		close(conn);
		return scheduleList;
	}
	
	public ArrayList<Todo> selectTodos(int userNo, String dateStr) {
		Connection conn = getConnection();
		ArrayList<Todo> todoList = new CalendarDao().selectTodos(conn, userNo, dateStr);
		close(conn);
		return todoList;
	}
	
	public int insertTodo(Todo todo) {
		Connection conn = getConnection();
		int result = new CalendarDao().insertTodo(conn, todo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}
	
	public int updateTodo(int todoId, String checkYN) {
		Connection conn = getConnection();
		int result = new CalendarDao().updateTodo(conn, todoId, checkYN);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}
	
	public int deleteTodo(int todoId) {
		Connection conn = getConnection();
		int result = new CalendarDao().deleteTodo(conn, todoId);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}
	
	public int deleteAllTodo(String[] todoIds) {
		Connection conn = getConnection();
		int result = new CalendarDao().deleteAllTodo(conn, todoIds);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}
	
	public ArrayList<Todo> selectFollowTodos(String userId, String dateStr) {
		Connection conn = getConnection();
		ArrayList<Todo> todoList = new CalendarDao().selectFollowTodos(conn, userId, dateStr);
		close(conn);
		return todoList;
	}

}
