package com.kh.review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.review.model.service.ReviewService;
import com.kh.review.model.vo.Image;
import com.kh.review.model.vo.Review;
import com.kh.review.model.vo.SubCategory;

/**
 * Servlet implementation class ReviewDetailController
 */
@WebServlet("/detail.im")
public class ReviewDetailImgController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewDetailImgController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String refBno = request.getParameter("bno");
		
		ReviewService rService = new ReviewService();
		
		Review rv = rService.selectImgMemNo(refBno);
		
		if(rv != null) { // 유효한 게시글 => 게시글, 첨부파일 DB로부터 조회 
			Review rv2 = rService.selectImgReview(refBno);
			Image img2 = rService.selectImgImage(refBno);
			
			request.setAttribute("rv2", rv2); // review에 대한 정보
			request.setAttribute("img2", img2); // image에 대한 정보
			
			request.getRequestDispatcher("views/review/reviewDetail.jsp").forward(request, response);
			
		}else { // 에러 => db로부터 조회x
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
