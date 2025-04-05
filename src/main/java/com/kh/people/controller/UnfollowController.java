package com.kh.people.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.people.model.service.PeopleService;

/**
 * Servlet implementation class UnfollowController
 */
@WebServlet("/unfollow.pe")
public class UnfollowController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UnfollowController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int loginUserNo = Integer.parseInt(request.getParameter("loginUserNo"));
		int targetUserNo = Integer.parseInt(request.getParameter("targetUserNo"));
		
		int result = new PeopleService().deleteUnfollow(loginUserNo, targetUserNo);
		
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
