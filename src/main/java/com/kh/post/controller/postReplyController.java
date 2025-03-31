package com.kh.post.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.Reply;
import com.kh.member.model.vo.Member;
import com.kh.post.model.service.PostService;
import com.kh.review.model.service.ReviewService;

/**
 * Servlet implementation class postReplyController
 */
@WebServlet("/rinsert.po")
public class postReplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public postReplyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String refBno = request.getParameter("bno");
		int memNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		String replyContent = request.getParameter("content");
		
		Reply r = new Reply();
		r.setRefBno(Integer.parseInt(refBno));
		r.setMemNo(memNo);
		r.setReplyContent(replyContent);
		
		int result = new PostService().insertReply(r);
		
		response.getWriter().print(result); // 0, 1 둘 중 하나
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
