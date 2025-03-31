package com.kh.calendar.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.kh.calendar.model.service.CalendarService;
import com.kh.calendar.model.vo.Calendar;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class FollowingScheduleListController
 */
@WebServlet("/followingSchList.ca")
public class FollowingScheduleListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FollowingScheduleListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		String userId = request.getParameter("userId");
		
		ArrayList<Calendar> scheduleList = new CalendarService().followingScheduleList(userId);
		
		JSONArray jsonArray = new JSONArray();
		for (Calendar sch : scheduleList) {
			JSONObject obj = new JSONObject();
			obj.put("id", sch.getScheduleNo());
			obj.put("title", sch.getTitle());
			obj.put("start", sch.getStartDay());
			obj.put("end", sch.getEndDay());
			obj.put("allDay", true);
			jsonArray.add(obj);
		}
		
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().print(jsonArray);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
