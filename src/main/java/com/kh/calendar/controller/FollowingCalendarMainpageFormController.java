package com.kh.calendar.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.calendar.model.service.CalendarService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class FollowingCalendarMainpageFormController
 */
@WebServlet("/followingCalendarMainpage.ca")
public class FollowingCalendarMainpageFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FollowingCalendarMainpageFormController() {
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
		
		ArrayList<Member> list = new CalendarService().selectFollowList(userNo);
		Member userName = new CalendarService().selectFollowUserName(userId);
		
		request.setAttribute("list", list);
		request.setAttribute("userName", userName);
		
		RequestDispatcher view = request.getRequestDispatcher("views/calendar/followingCalendarMainpage.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
