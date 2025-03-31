package com.kh.review.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.review.model.service.ReviewService;
import com.kh.review.model.vo.Review;

/**
 * Servlet implementation class ReviewDeleteController
 */
@WebServlet("/review.de")
public class ReviewDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String refBno = request.getParameter("bno");
		
		Review rv = new Review();
		rv.setReviewNo(refBno);
		
		int result = new ReviewService().deleteNewReview(rv);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "삭제되었습니다.");
			response.sendRedirect(request.getContextPath() + "/review.li?cpage=1");
		}else {
			request.getSession().setAttribute("alertMsg", "에러가 발생하였습니다.");
			response.sendRedirect(request.getContextPath() + "/review.li?cpage=1");
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
