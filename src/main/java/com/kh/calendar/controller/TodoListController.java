package com.kh.calendar.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.calendar.model.service.CalendarService;
import com.kh.calendar.model.vo.Todo;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class TodoListController
 */
@WebServlet("/selectTodo.ca")
public class TodoListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TodoListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String dateStr = request.getParameter("date"); // yyyy-MM-dd
        Member loginUser = (Member) request.getSession().getAttribute("loginUser");
        int userNo = loginUser.getUserNo();
        
        ArrayList<Todo> todoList = new CalendarService().selectTodos(userNo, dateStr);

        response.setContentType("application/json; charset=UTF-8");
        new Gson().toJson(todoList, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
