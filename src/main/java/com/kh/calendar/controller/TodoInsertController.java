package com.kh.calendar.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.calendar.model.service.CalendarService;
import com.kh.calendar.model.vo.Todo;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class TodoInsertController
 */
@WebServlet("/insertTodo.ca")
public class TodoInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TodoInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");

	    Member loginUser = (Member)request.getSession().getAttribute("loginUser");
	    int userNo = loginUser.getUserNo(); // 로그인된 사용자

	    String title = request.getParameter("checkTitle");
	    String date = request.getParameter("checkDate");
	    String yn = request.getParameter("checkYN");

	    Todo todo = new Todo(userNo, title, yn, date);
	    int result = new CalendarService().insertTodo(todo);

	    response.setContentType("text/plain; charset=UTF-8");
	    response.getWriter().write(result > 0 ? "success" : "fail");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
