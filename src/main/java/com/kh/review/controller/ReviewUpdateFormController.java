package com.kh.review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.review.model.vo.Image;
import com.kh.review.model.vo.Review;
import com.kh.review.model.vo.SubCategory;
import com.kh.common.model.vo.PageInfo;
import com.kh.review.model.service.*;

/**
 * Servlet implementation class ReviewUpdateForm
 */
@WebServlet("/updateReview.wr")
public class ReviewUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String refBno = request.getParameter("bno");
		
		ReviewService rService = new ReviewService();
		rService.selectReview(refBno);
		
		Review rv = rService.selectReview(refBno);
		
		int listCount;		// 현재 총 게시글 개수
		
		int currentPage;	// 현재 페이지 (즉, 사용자가 요청한 페이지)
		int pageLimit;		// 페이지 하단에 보여질 페이징바의 최대 개수(몇개 단위씩 보여질건지)
		int reviewLimit;	// 한 페이지 내에 보여질 게시글 최대 개수(몇개 단위씩)

		int startPage;		// 페이징바의 시작수
		int endPage;		// 페이징바의 끝수
		
		int maxPage;		// 가장 마지막 페이지 (총 페이지 수)
		
		listCount = new ReviewService().selectReviewList();
		
		int cpage = 1;
		if(request.getParameter("cpage") != null && !request.getParameter("cpage").equals("")) {
			currentPage = Integer.parseInt(request.getParameter("cpage"));
		}else {
			currentPage = 1;
		}
		
		pageLimit = 5;
		
		reviewLimit = 5;
		
		maxPage = (int)Math.ceil((double)listCount / reviewLimit);
		
		startPage = ((currentPage - 1) / pageLimit) * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, reviewLimit, maxPage, startPage, endPage);
		
		ArrayList<Review> list = new ReviewService().selectReviewArrayList(pi);
		
		ArrayList<SubCategory> list1 = new ReviewService().selectSubCategoryList();
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.setAttribute("list1", list1);
		
		if(rv != null) { // 유효한 게시글 => 게시글, 첨부파일 DB로부터 조회 
			Review rv1 = rService.selectReview(refBno);
			Image img = rService.selectImage(refBno);
			request.setAttribute("rv1", rv1); // review에 대한 정보
			request.setAttribute("img", img); // image에 대한 정보
		
			request.getRequestDispatcher("views/review/reviewUpdateForm.jsp").forward(request, response);
			
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
