package com.kh.review.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.kh.common.MyFileRenamePolicy;
import com.kh.review.model.service.ReviewService;
import com.kh.review.model.vo.Image;
import com.kh.review.model.vo.Review;
import com.oreilly.servlet.MultipartRequest;


/**
 * Servlet implementation class ReviewInsertController
 */
@WebServlet("/insert.re")
public class ReviewInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		// enctype이 multipart/form-data로 잘 전송되었을 경우
		// 전반적인 내용들이 수행되도록 if문 수행해보자.
		if(ServletFileUpload.isMultipartContent(request)) {
			// 파일 업로드를 위한 라이브러리 : cos.jar(com.oreilly.servlet의 약자)
			// http://www.servlet.com에서 다운로드

			int maxSize = 10*1024*1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/images/");
					
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String category = multiRequest.getParameter("SC_ID");
			String memNo = multiRequest.getParameter("MEM_NO");
			String reviewTitle = multiRequest.getParameter("TITLE");
			String content = multiRequest.getParameter("CONTENT");
			String pRating = multiRequest.getParameter("P_RATING"); 
			String rRating = multiRequest.getParameter("R_RATING");
			String prRating = multiRequest.getParameter("PR_RATING");
			String likeReview = multiRequest.getParameter("LIKE_REVIEW");
			
			Review rv = new Review();
			rv.setPcode(category);
			rv.setMemNo(Integer.parseInt(memNo));
			rv.setTitle(reviewTitle);
			rv.setContent(content);
			rv.setpRating(Integer.parseInt(pRating));
			rv.setrRating(Integer.parseInt(rRating));
			rv.setPrRating(Integer.parseInt(prRating));
			rv.setLikeReview(Integer.parseInt(likeReview));

			Image img = null;
			if(multiRequest.getOriginalFileName("upfile") != null) {
				// if문을 타면, 넘어온 첨부파일이 있을 경우
				img = new Image();
				img.setRefBno(Integer.parseInt(memNo));
				img.setOriginName(multiRequest.getOriginalFileName("upfile"));
				img.setChangeName(multiRequest.getFilesystemName("upfile"));
				img.setFilePath("resources/images/"); // /가 있어야 한다.
			}
	System.out.println("리뷰 이미지 확인 : " + multiRequest.getOriginalFileName("upfile"));
			// 4. Service 요청 (요청처리)
			int result = new ReviewService().insertReview(rv, img);
			
			// 5. 응답뷰 지정
			// 성공 => /jsp/list.bo?cpage=1 url 재요청 => (목록페이지)

			if(result > 0) {
				response.sendRedirect(request.getContextPath() + "/review.li?cpage=1");
				request.getSession().setAttribute("alertMsg", "일반게시판등록!");
			}else {
				// 실패 => 첨부파일 있었다면 업로드 된 파일 찾아서 삭제 시킨 후 에러페이지로
				if(img != null) { // 첨부파일이 있었다면
					new File(savePath + img.getChangeName()).delete();
				}
				response.sendRedirect(request.getContextPath() + "/review.li?cpage=1");
				request.getSession().setAttribute("alertMsg", "등록실패!!");
			}

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
