package com.kh.review.controller;

import java.io.Console;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Formatter;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.crypto.dsig.Transform;

import com.kh.common.model.vo.PageInfo;
import com.kh.review.model.service.ReviewService;
import com.kh.review.model.vo.Review;


/**
 * Servlet implementation class ReviewListController
 */
@WebServlet("/review.li")
public class ReviewListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewListController() {
        super();

    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// ------------- 페이징 처리 -------------
		int listCount;		// 현재 총 게시글 개수
		int currentPage;	// 현재 페이지 (즉, 사용자가 요청한 페이지)
		int pageLimit;		// 페이지 하단에 보여질 페이징바의 최대 개수(몇개 단위씩 보여질건지)
		int reviewLimit;	// 한 페이지 내에 보여질 게시글 최대 개수(몇개 단위씩)
		
		// 위의 4개를 가지고 아래의 3개 값을 구할 것임
		int maxPage;		// 가장 마지막 페이지 (총 페이지 수)
		int startPage;		// 페이징바의 시작수
		int endPage;		// 페이징바의 끝수
		
		// * listCount : 총 게시글 개수
		listCount = new ReviewService().selectReviewList();

//		int cpage1 = 0;
//	    int cpage = new ReviewService().selectReviewCpage(cpage1);
//	    cpage = (listCount - reviewLimit) + 1;
	 // * currentPage : 현재 페이지(즉, 사용자가 요청한 페이지)
		
		
		
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null && !request.getParameter("currentPage").equals("")) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		// * pageLimit : 페이징바의 페이지 최대 개수(단위) ㅡ 개발자가 지정
		pageLimit = 5;
		
		// * reviewLitmit : 게시글 최대 개수(단위) ㅡ 개발자가 지정
		reviewLimit = 3;
		


		
		/* 공식을 외우란 것이 아닌,, 원리를 이해하기!!
		 * * maxPage : 제일 마지막 페이지 수 (총 페이지 수)
		 * 
		 * listCount, baordLimit에 영향을 받음
		 * 
		 * ex) 게시글이 10개 단위씩 보여진다는 가정하에 ㅡ listCount를 더블형으로 만들어서 boardLimit으로 나눈 값의 나머지가 0으로 소수점 없으면 그대로,, 소수점 있으면 올림처리
		 * 
		 * listCount reviewLimit				maxPage
		 *   100.0	/	10		=> 10.0		  10
		 * 	 101.0	/	10		=> 10.1		  11
		 *   105.0	/	10		=> 10.5		  11
		 *   110.0	/	10		=> 11.0		  11
		 *   
		 *   ex) 게시글이 5개 단위씩 보여진다는 가정하에
		 * listCount reviewLimit				maxPage
		 * 	 10.0	/	5		=> 2.0		  2
		 * 	 11.0	/	5		=> 2.1		  3
		 * 	 14.0	/	5		=> 2.4		  3
		 * 
		 * 총게시글개수(실수형) / boardLimit => 올림처리 ㅡ Math.ceil(올림처리하려고하는값)
		 *   
		 */
		maxPage = (int)Math.ceil((double)listCount / reviewLimit); // ㅡ maxPage는 listCount와 boardLimit의 영향을 받음.. listCount를 double로 바꾸고 listCount를 boardLimit으로 나눈값을 Math.ceil 사용해서 올림처리 한 후 그 값을 int로 형변환한다.★
		
		/*
		 * * startPage : 페이징바의 시작수
		 * 
		 * currentPage, pageLimit 에 영향을 받음
		 * 
		 * ex) 페이징바의 목록이 10개 단위(pageLimit)씩 이라는 가정하에 ㅡ n * 10 + 1
		 * 	   startPage : 1,11,21,31, ....
		 * 				 => n * pageLimit + 1
		 * 
		 * currentPage  startPage
		 * 		1			1		=> 0 * pageLimit + 1	=> n=0
		 * 		5			1		=> 0 * pageLimit + 1 	=> n=0
		 * 		10			1		=> 0 * pageLimit + 1	=> n=0
		 * 		11			11		=> 1 * pageLimit + 1	=> n=1
		 * 		15			11		=> 1 * pageLimit + 1	=> n=1
		 * 		20			11		=> 1 * pageLimit + 1	=> n=1
		 * 
		 * 		1~10		=> n=0
		 * 		11~20		=> n=1
		 * 		21~30		=> n=2
		 * 		...
		 * 	currentPage-1	/ pageLimit => n
		 * 		0~9
		 * 		10~19
		 * 		20~29
		 * 
		 * 	startPage = n 							* pageLimit + 1
		 * 				currentPage-1	/ pageLimit * pageLimit + 1
		 * 				ㄴ n을 구하려면 이런 공식을 도출.. 나눴을 때의 몫 * pageLimit + 1
		 * 
		 */
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		/*
		 * * endPage : 페이징바의 끝 수
		 * 
		 * startPage, pageLimit에 영향을 받음(단, maxPage에도 영향을 받긴함)
		 * 
		 * ex) pageLimit : 10 이라는 가정하에
		 * 
		 * startPage: 1		=> endPage : 10
		 * startPage: 11	=> endPage : 20
		 * startPage: 21	=> endPage : 30
		 * 
		 */
		
		endPage = startPage + pageLimit - 1;
		
		// startPage가 11이면 endPage는 20으로 됨 (근데 만약에 maxPage가 고작 13까지 밖에 안되면?)
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		// com.kh.common.model.vo.PageInfo - jsp 가져가야해서 가방에 담아야함
		// * jsp에서 페이징바를 만드려면 7개의 값이 필요한데
		// 그걸 담기 위한 가방, 그릇! (vo)
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, reviewLimit, maxPage, startPage, endPage);
		
		// * 현재 요청한 페이지(c)에 보여질 게시글 리스트 boardLimit 수만큼 조회
		ArrayList<Review> list = new ReviewService().selectReviewArrayList(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		
		RequestDispatcher rd = request.getRequestDispatcher("views/bodyTestLYH/reviewContentPost.jsp");
		rd.forward(request, response);
		

//		request.setAttribute("request","requestValue");
//		response.sendRedirect("views/bodyTestLYH/reviewlyh.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
