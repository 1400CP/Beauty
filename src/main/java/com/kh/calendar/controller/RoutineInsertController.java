package com.kh.calendar.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.calendar.model.service.CalendarService;
import com.kh.calendar.model.vo.RoutineRequest;
import com.kh.calendar.model.vo.Todo;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class RoutineInsertController
 */
@WebServlet("/insertRoutine.ca")
public class RoutineInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoutineInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");

		
		BufferedReader reader = request.getReader();
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }

        Gson gson = new Gson();
        RoutineRequest req = gson.fromJson(sb.toString(), RoutineRequest.class);

        Member loginUser = (Member) request.getSession().getAttribute("loginUser");
        if (loginUser == null) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }

        int userNo = loginUser.getUserNo();
        String title = req.getTitle();
        String memo = req.getMemo();
        List<Integer> weekdays = req.getWeekdays();

        LocalDate start = LocalDate.parse(req.getStartDate());
        LocalDate end = LocalDate.parse(req.getEndDate());

        List<LocalDate> targetDates = new ArrayList<>();
        for (LocalDate date = start; !date.isAfter(end); date = date.plusDays(1)) {
            int dayValue = date.getDayOfWeek().getValue(); // 1(월) ~ 7(일)
            if (weekdays.contains(dayValue)) {
                targetDates.add(date);
            }
        }

        CalendarService service = new CalendarService();
        for (LocalDate date : targetDates) {
            Todo todo = new Todo();
            todo.setMemNo(userNo);
            todo.setCheckTitle(title);
            todo.setCheckDate(Date.valueOf(date).toString());
            todo.setCheckMemo(memo);
            todo.setCheckYN("N");

            service.insertTodo(todo);
        }

        response.setContentType("text/plain");
        response.getWriter().write("success");
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
