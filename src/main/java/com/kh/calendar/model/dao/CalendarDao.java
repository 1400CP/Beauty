package com.kh.calendar.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Properties;

import com.kh.calendar.model.vo.Calendar;
import com.kh.calendar.model.vo.Todo;

import static com.kh.common.JDBCTemplate.*;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

public class CalendarDao {
	
private Properties prop = new Properties();
	
	public CalendarDao() {
		String filePath = MemberDao.class.getResource("/db/sql/calendar-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertSchedule(Connection conn, int userNo, Calendar c) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertSchedule");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			pstmt.setString(2, c.getTitle());
			pstmt.setDate(3, Date.valueOf(c.getStartDay()));
			pstmt.setDate(4, Date.valueOf(c.getEndDay()));
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public ArrayList<Calendar> scheduleList(Connection conn, int userNo) {
		ArrayList<Calendar> scheduleList = new ArrayList<Calendar>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("scheduleList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				scheduleList.add(new Calendar(rset.getInt("sch_no"),
											  rset.getString("sch_title"), 
											  rset.getString("sch_startdate"), 
											  rset.getString("sch_enddate")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return scheduleList;
	}
	
	public int deleteSchedule(Connection conn, int scheduleNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteSchedule");
			
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, scheduleNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public ArrayList<Member> selectFollowList(Connection conn, int userNo) {
		ArrayList<Member> list = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectFollowList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Member(rset.getInt("following"),
									rset.getString("mem_id"),
									rset.getString("mem_name")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public Member selectFollowUserName(Connection conn, String userId) {
		Member userName = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectFollowUserName");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				userName = new Member();
				userName.setUserName(rset.getString("mem_name"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return userName;
	}
	
	public ArrayList<Calendar> followingScheduleList(Connection conn, String userId) {
		ArrayList<Calendar> scheduleList = new ArrayList<Calendar>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("followingScheduleList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				scheduleList.add(new Calendar(rset.getInt("sch_no"),
											  rset.getString("sch_title"), 
											  rset.getString("sch_startdate"), 
											  rset.getString("sch_enddate")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return scheduleList;
	}
	
	public ArrayList<Todo> selectTodos(Connection conn, int userNo, String dateStr) {
		ArrayList<Todo> todoList = new ArrayList<Todo>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectTodos");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setString(2, dateStr);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				todoList.add(new Todo(rset.getInt("check_no"),
									  rset.getInt("mem_no"),
									  rset.getString("check_title"),
									  rset.getString("check_yn")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return todoList;
	}
	
	public int insertTodo(Connection conn, Todo todo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertTodo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, todo.getMemNo());
			pstmt.setString(2, todo.getCheckTitle());
			pstmt.setString(3, todo.getCheckYN());
			pstmt.setString(4, todo.getCheckDate());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updateTodo(Connection conn, int todoId, String checkYN) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateTodo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, checkYN);
			pstmt.setInt(2, todoId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteTodo(Connection conn, int todoId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteTodo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, todoId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteAllTodo(Connection conn, String[] todoIds) {
		int result = 0;
	    PreparedStatement pstmt = null;
	    
	    String placeholders = String.join(",", Collections.nCopies(todoIds.length, "?"));
	    
	    String sqlTemplate = prop.getProperty("deleteAllTodo"); // "DELETE FROM TODO WHERE CHECK_NO IN (#)"
	    String sql = sqlTemplate.replace("#", placeholders);
	    
	    try {
			pstmt = conn.prepareStatement(sql);
			
			for(int i = 0; i < todoIds.length; i++) {
				pstmt.setInt(i + 1, Integer.parseInt(todoIds[i]));
			}
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
	        close(pstmt);
	    }

	    return result;
	}
	
	public ArrayList<Todo> selectFollowTodos(Connection conn, String userId, String dateStr) {
		ArrayList<Todo> todoList = new ArrayList<Todo>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectFollowTodos");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, dateStr);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				todoList.add(new Todo(rset.getInt("check_no"),
									  rset.getInt("mem_no"),
									  rset.getString("check_title"),
									  rset.getString("check_yn")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return todoList;
	}

}
