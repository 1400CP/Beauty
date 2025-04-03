package com.kh.calendar.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.calendar.model.service.CalendarService;
import com.kh.calendar.model.vo.Calendar;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class ScheduleInsertController
 */
@WebServlet("/insertSchedule.ca")
public class ScheduleInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ScheduleInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		String title = request.getParameter("title");
        String startDay = request.getParameter("startDay");
        String endDay = request.getParameter("endDay");
        
        Calendar c = new Calendar(title, startDay, endDay);
        
        int result = new CalendarService().insertSchedule(userNo, c);
        
        response.setContentType("text/html; charset=UTF-8");
        if(result > 0) {
            response.getWriter().print("success");
        } else {
            response.getWriter().print("fail");
        }
        
        response.getWriter().close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
