package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.util.EmailUtil;

/**
 * Servlet implementation class SendEmailAjaxController
 */
@WebServlet("/sendEmailAjax.me")
public class SendEmailAjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendEmailAjaxController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userEmail = request.getParameter("email");
        String code = String.valueOf((int)((Math.random() * 900000) + 100000));

        HttpSession session = request.getSession();
        session.setAttribute("authCode", code);
        session.setAttribute("authEmail", userEmail);
        session.setAttribute("authTime", System.currentTimeMillis());

        boolean emailSent = EmailUtil.sendEmail(userEmail, "비밀번호 찾기 인증코드", "인증코드: " + code);

        response.setContentType("application/json");
        response.getWriter().write("{\"success\":" + emailSent + "}");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
