package com.kh.review.controller;

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
 * Servlet implementation class ReviewUpdateController2
 */
@WebServlet("/updateReview2.up")
public class ReviewUpdateController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewUpdateController2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10 * 1024 * 1024;
			
			// page, request, session, application
			String savePath = request.getSession().getServletContext().getRealPath("/resources/images/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String refBno = multiRequest.getParameter("bno"); // url용

			// String category = multiRequest.getParameter("SC_ID"); // pcode
			
			String memNo = multiRequest.getParameter("MEM_NO");
			String reviewTitle = multiRequest.getParameter("TITLE");
			String content = multiRequest.getParameter("CONTENT");
			String pRating = multiRequest.getParameter("P_RATING"); 
			String rRating = multiRequest.getParameter("R_RATING");
			String prRating = multiRequest.getParameter("PR_RATING");
			String imgNo = multiRequest.getParameter("originFileNo");
			
			Review rv = new Review();
			rv.setTitle(reviewTitle);
			rv.setContent(content);
			rv.setpRating(Integer.parseInt(pRating));
			rv.setrRating(Integer.parseInt(rRating));
			rv.setPrRating(Integer.parseInt(prRating));
			rv.setReviewNo(refBno);
			
			Image img = null; // 처음에는 null로 초기화
			img = new Image();
			img.setOriginName(multiRequest.getOriginalFileName("upfile"));
			img.setChangeName(multiRequest.getFilesystemName("upfile"));
			img.setFilePath("resources/images/");

			if(multiRequest.getOriginalFileName("upfile") != null) {
				if(imgNo != null) {
					// 기존의 첨부파일이 있을 경우 => (기존의첨부파일번호 필요)
					img.setImgNo(Integer.parseInt(imgNo));

					int result = new ReviewService().updateReview1(rv, img);
	
					if(result > 0) { // 성공
						response.sendRedirect(request.getContextPath() + "/detail.re?bno=" + refBno);
						
					}else { // 실패
						request.getSession().setAttribute("alertMsg", "오류 발생");
						response.sendRedirect(request.getContextPath() + "/review.li?cpage=1");
					}
				}else {
					// 기존의 첨부파일이 없었을 경우 => (해당, 현재게시글의 번호)
					img.setRefBno(Integer.parseInt(memNo));
					
					int result = new ReviewService().updateReview1(rv, img);
			
					if(result > 0) { // 성공
						response.sendRedirect(request.getContextPath() + "/detail.re?bno=" + refBno);
						
					}else { // 실패
						request.getSession().setAttribute("alertMsg", "오류 발생");
						response.sendRedirect(request.getContextPath() + "/review.li?cpage=1");
					}
				}

			}else {
				// 새로운 첨부파일 없음 => at 객체 null
			    img.setOriginName("첨부파일없음"); // 챗gpt 추천이긴한데, 완전 임시방편인데?
			    img.setChangeName("첨부파일없음");
			    
				int result = new ReviewService().updateReview1(rv, img);

				if(result > 0) { // 성공
					response.sendRedirect(request.getContextPath() + "/detail.re?bno=" + refBno);
					
				}else { // 실패
					request.getSession().setAttribute("alertMsg", "오류 발생");
					response.sendRedirect(request.getContextPath() + "/review.li?cpage=1");
				}
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
