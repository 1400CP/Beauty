package com.kh.calendar.controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.calendar.model.service.CalendarService;

/**
 * Servlet implementation class TodoAllDeleteController
 */
@WebServlet("/deleteAllTodo.ca")
public class TodoAllDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TodoAllDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] todoIdArr = request.getParameterValues("todoIds");
		
	    if (todoIdArr != null && todoIdArr.length > 0) {
	      int result = new CalendarService().deleteAllTodo(todoIdArr);

	      response.setContentType("text/plain; charset=UTF-8");
	      response.getWriter().print(result > 0 ? "success" : "fail");
	    } else {
	      response.setContentType("text/plain; charset=UTF-8");
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
