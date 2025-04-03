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
import com.kh.profile.controller.model.vo.Profile;
import com.kh.profile.controller.model.service.ProfileService;

/**
 * Servlet implementation class NaverCheckUserController
 */
@WebServlet("/NaverCheckUser.me")
public class NaverCheckUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NaverCheckUserController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String Token = (String) session.getAttribute("naverId"); 
		System.out.println("왔냐" + Token);
		
		
		int result = new MemberService().NaverCheckUser(Token);
		System.out.println("왔냐" + result);
		
		Member loginUser = null;
		if(result > 0) {
			System.out.println(result);
			loginUser = new MemberService().NaverLoginMember(Token);
			session.setAttribute("loginUser", loginUser);
			response.sendRedirect(request.getContextPath());
			
			
		} else {
			response.sendRedirect(request.getContextPath()+ "/views/member/memberEnrollForm.jsp");
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
