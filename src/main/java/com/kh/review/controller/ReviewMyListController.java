package com.kh.review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.PageInfo;
import com.kh.post.model.service.PostService;
import com.kh.post.model.vo.Image2;
import com.kh.post.model.vo.Post;
import com.kh.review.model.service.ReviewService;
import com.kh.review.model.vo.Image;
import com.kh.review.model.vo.Review;

/**
 * Servlet implementation class ReviewMyListController
 */
@WebServlet("/review.my")
public class ReviewMyListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewMyListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
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
		
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, reviewLimit, maxPage, startPage, endPage);
		
		// * 현재 요청한 페이지(c)에 보여질 게시글 리스트 boardLimit 수만큼 조회
		ArrayList<Review> list = new ReviewService().selectReviewArrayList(pi);
		ArrayList<Image> list1 = new ReviewService().selectImageArraylist(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.setAttribute("list1", list1);

		RequestDispatcher rd = request.getRequestDispatcher("views/review/reviewMyPost.jsp");
		rd.forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
