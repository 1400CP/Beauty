package com.kh.calendar.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.calendar.model.vo.Calendar;
import static com.kh.common.JDBCTemplate.*;
import com.kh.member.model.dao.MemberDao;

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

}
