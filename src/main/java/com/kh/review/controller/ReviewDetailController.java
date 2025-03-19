package com.kh.review.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.review.model.service.ReviewService;
import com.kh.review.model.vo.Image;
import com.kh.review.model.vo.Review;

/**
 * Servlet implementation class ReviewDetailController
 */
@WebServlet("/detail.re")
public class ReviewDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int boardNo = Integer.parseInt(request.getParameter("bno"));
		
		ReviewService rService = new ReviewService();
		rService.selectMemNo(boardNo);
		
		int result = rService.selectMemNo(boardNo);
		
		if(result > 0) { // 유효한 게시글 => 게시글, 첨부파일 DB로부터 조회 
			Review rv = rService.selectReview(boardNo);
			Image img = rService.selectImage(boardNo);
			
			
			request.setAttribute("rv", rv); // board에 대한 정보
			request.setAttribute("img", img); // attachment에 대한 정보
			
			request.getRequestDispatcher("views/review/reviewDetail.jsp").forward(request, response);
			
			
		}else { // 에러 => db로부터 조회x
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
