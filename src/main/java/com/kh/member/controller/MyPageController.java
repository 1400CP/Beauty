package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;


/**
 * Servlet implementation class MyPageController
 */
@WebServlet("/myPage.me")
public class MyPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		System.out.println("1순서" +  userNo);
		
		
		if(session.getAttribute("loginUser") == null) { // 로그인 전
			session.setAttribute("alertMsg", "로그인 후 이용가능한 서비스 입니다!");
			response.sendRedirect(request.getContextPath());
		} else {
			Member updateUser = new MemberService().selectMember(userNo);
			System.out.println("성공" + updateUser.getUserNo());
			session.setAttribute("loginUser", updateUser);
			System.out.println("2번 순서" + updateUser.getUserNo());
			//response.sendRedirect(request.getContextPath() + "/views/member/myPage.jsp");
			request.getRequestDispatcher("views/member/myPage.jsp").forward(request, response);
			return;
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
