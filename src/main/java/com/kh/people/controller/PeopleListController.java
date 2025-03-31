package com.kh.people.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.calendar.model.service.CalendarService;
import com.kh.calendar.model.vo.Calendar;
import com.kh.member.model.vo.Member;
import com.kh.people.model.service.PeopleService;

/**
 * Servlet implementation class PeopleListController
 */
@WebServlet("/selectPeople.pe")
public class PeopleListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PeopleListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Member> peopleList = new PeopleService().selectPeopleList();
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		ArrayList<Integer> activeList = new ArrayList<>();

		if (loginUser != null) {
		    int userNo = loginUser.getUserNo();
		    activeList = new PeopleService().selectActive(userNo);  // 로그인 했을 때만 조회
		}
		
		request.setAttribute("peopleList", peopleList);
		request.setAttribute("activeList", activeList);
		
		RequestDispatcher view = request.getRequestDispatcher("views/people/peopleMainpage.jsp");
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
