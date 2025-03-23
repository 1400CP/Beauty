package com.kh.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.review.model.vo.Image;
import com.kh.review.model.vo.Review;
import com.kh.review.model.service.*;

/**
 * Servlet implementation class ReviewUpdateForm
 */
@WebServlet("/updateReview.wr")
public class ReviewUpdateForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewUpdateForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String refBno = request.getParameter("bno");
		
		ReviewService rService = new ReviewService();
		rService.selectMemNo(refBno);
		
		System.out.println("bno parameter: " + request.getParameter("bno"));
		
		Review rv = rService.selectMemNo(refBno);
		
		if(rv != null) { // 유효한 게시글 => 게시글, 첨부파일 DB로부터 조회 
			Review rv1 = rService.selectReview(refBno);
			Image img = rService.selectImage(refBno);
	
			request.setAttribute("rv1", rv1);
			request.setAttribute("img", img);
		
			request.getRequestDispatcher("views/review/reviewUpdateForm.jsp").forward(request, response);
			
		}else {
			response.sendRedirect(request.getContextPath() + "/review.li?cpage=1");
			request.getSession().setAttribute("alertMsg", "게시글 조회 오류");
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
