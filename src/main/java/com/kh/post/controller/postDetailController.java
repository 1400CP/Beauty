package com.kh.post.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.post.model.service.PostService;
import com.kh.post.model.vo.Image2;
import com.kh.post.model.vo.Post;
import com.kh.review.model.service.ReviewService;
import com.kh.review.model.vo.Image;
import com.kh.review.model.vo.Review;

/**
 * Servlet implementation class postDetailController
 */
@WebServlet("/detail.po")
public class postDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public postDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String refBno = request.getParameter("bno");

		PostService rService = new PostService();
		Post post = rService.selectPostTest(refBno);
		
		if(post != null) { // 유효한 게시글 => 게시글, 첨부파일 DB로부터 조회 
			Post po = rService.selectPost(refBno);
			Image2 img = rService.selectImage2(refBno);
			request.setAttribute("po", po); // review에 대한 정보
			request.setAttribute("img", img); // image에 대한 정보
			
			request.getRequestDispatcher("views/post/postDetail.jsp").forward(request, response);
			
		}else { // 에러 => db로부터 조회x
			response.sendRedirect(request.getContextPath() + "/post.list?");
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
