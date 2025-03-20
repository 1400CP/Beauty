package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MemberInsertController
 */
@WebServlet("/insert.me")
public class MemberInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");

		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		String email = request.getParameter("email");
		String nickName = request.getParameter("nickName");
		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender");
		String agreeYN = request.getParameter("agree");
		String Token = request.getParameter("Token");

		// Member 객체 생성
		Member m = new Member(userId, userPwd, userName, email, nickName, phone, gender, agreeYN, Token);

		// DB에 회원 정보 삽입
		int result = new MemberService().insertMember(m);

		if (result > 0) {
		    HttpSession session = request.getSession();
		    session.setAttribute("alertMsg", "성공적으로 회원가입 되었습니다.");
		    response.sendRedirect(request.getContextPath());
		} else {
			HttpSession session = request.getSession();
		    session.setAttribute("alertMsg", "탈퇴한 아이디 혹은 잘못된 형식입니다.");
		    response.sendRedirect(request.getContextPath());
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
