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
		
		// 한 페이지에 출력될 글 수
		
		
		// 현 페이지 정보 설정
		String pageNum = request.getParameter("currentPage");
		if(pageNum == null) {
			pageNum = "1";
		}
		
		// * listCount : 총 게시글 개수
		int listCount = new ReviewService().selectReviewList();

		// * pageLimit : 페이징바의 페이지 최대 개수(단위) ㅡ 개발자가 지정
		int pageLimit = 10;
		
		// * reviewLitmit : 게시글 최대 개수(단위) ㅡ 개발자가 지정
		int reviewLimit = 2;
		
		// 첫행 번호 계산
		int currentPage = Integer.parseInt(pageNum);
		
		
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
		int maxPage =  (int)Math.ceil((double)listCount / reviewLimit);
		
		int startPage = (currentPage - 1) * reviewLimit + 1;
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

		
		int endPage = startPage + pageLimit - 1;
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
		

		
		// startPage가 11이면 endPage는 20으로 됨 (근데 만약에 maxPage가 고작 13까지 밖에 안되면?)

		
//		listCount == 게시글의 개수 (DB에서 추출해옴)  == cnt
//		currentPage, == pageNum (jsp에서 request)
//		pageLimit, == 페이징바의 최대 개수? 지정 == pageBlock
//		reviewLimit, == 게시글의 최대 개수? 지정 == pageSize
//		maxPage, == maxPage
//		startPage, == startRow
//		endPage == endPage
		
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
