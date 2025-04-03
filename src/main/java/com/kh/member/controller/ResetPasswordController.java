package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;

/**
 * Servlet implementation class ResetPasswordController
 */
@WebServlet("/resetPassword.me")
public class ResetPasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResetPasswordController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");

        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("msg", "비밀번호가 일치하지 않습니다.");
            request.getRequestDispatcher("views/member/resetPassword.jsp").forward(request, response);
            return;
        }

        // 세션에서 인증된 사용자 정보 꺼냄
        HttpSession session = request.getSession();
        String name = (String) session.getAttribute("verifiedName");
        String userId = (String) session.getAttribute("verifiedUserId");
        String email = (String) session.getAttribute("verifiedEmail");

        // DB에 비밀번호 업데이트
        int result = new MemberService().updatePassword(userId, name, email, newPassword);

        boolean success = false;
        if(result > 0) {
        	success = true;
        }
        
        if (success) {
            session.removeAttribute("verifiedName");
            session.removeAttribute("verifiedUserId");
            session.removeAttribute("verifiedEmail");
            session.setAttribute("alertMsg", "비밀번호가 변경되었습니다!");
            response.sendRedirect(request.getContextPath() + "/loginForm.me");
        } else {
        	session.setAttribute("alertMsg", "비밀번호 변경에 실패했습니다.");
            request.getRequestDispatcher("views/member/resetPassword.jsp").forward(request, response);
        }
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
