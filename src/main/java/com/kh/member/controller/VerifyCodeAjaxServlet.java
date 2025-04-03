package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class VerifyCodeAjaxServlet
 */
@WebServlet("/verifyCodeAjax.me")
public class VerifyCodeAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VerifyCodeAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String inputCode = request.getParameter("code");
        HttpSession session = request.getSession();

        String realCode = (String) session.getAttribute("authCode");
        Long sentTime = (Long) session.getAttribute("authTime");

        boolean isValid = false;

        if (realCode != null && sentTime != null) {
            long now = System.currentTimeMillis();
            long elapsed = now - sentTime;

            long expireMillis = 3 * 60 * 1000; // 3분 = 180,000ms

            if (elapsed <= expireMillis && realCode.equals(inputCode)) {
                isValid = true;
            }
        }


        response.setContentType("application/json");
        response.getWriter().write("{\"valid\":" + isValid + "}");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
