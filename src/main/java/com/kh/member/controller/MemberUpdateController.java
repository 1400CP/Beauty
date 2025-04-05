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
 * Servlet implementation class MemberUpdateController
 */
@WebServlet("/update.me")
public class MemberUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		String email = request.getParameter("email");
		String nickName = request.getParameter("nickName");
		String phone = request.getParameter("phone");
	
		
		Member m = new Member(userNo, userId, userPwd, userName, email, nickName, phone);
		Member updateMem = new MemberService().updateMember(m);
		
		
		if(updateMem == null) {
			
			request.setAttribute("errorMsg", "회원정보 수정을 실패 했습니다.");
			request.getRequestDispatcher("views/common/menubar.jsp").forward(request, response);
		} else {
			HttpSession session = request.getSession();
			
			session.setAttribute("loginUser", updateMem);
			session.setAttribute("alertMsg", "회원정보 수정 완료했습니다.");
			
			response.sendRedirect(request.getContextPath() + "/myPage.me?userNo=" + updateMem.getUserNo());
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
