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
			
			// 1. 전달되는 파일을 처리할 작업 내용 (전달되는 파일의 용량 제한, 전달된 파일을 저장시킬 경로)
			// 1_1) 전달되는 파일의 용량 제한 (int maxSize) => 10Mbyte

			int maxSize = 10*1024*1024; // 10메가바이트
			
			// 1_2) 전달된 파일을 저장시킬 폴더의 경로 알아내기 (String savePath)
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/images/");
			System.out.println(savePath);
					
			/*
			 * 2. 전달된 파일의 파일명 수정 및 서버에 업로드 작업 
			 * 		>> HttpServletRequest request => MultipartRequest multiRequest 변환
			 * 		
			 * 		아래 구문 한줄 실행만으로 넘어온 첨부파일이 해당 폴더에 무조건 업로드 됨!!
			 *		단, 파일명은 수정해주는 게 일반적임. 그래서 파일명 수정시켜주는 객체 제시해야 함
			 *		=> 같은 파일명이 존재할 경우 덮어쓸 수 있고, 파일명에 한글/특수문자/띄워쓰기가 포함될 경우 서버에 따라 문제 발생될 수 있음
			 *		
			 *		기본적으로 파일명이 안 겹치도록 수정 작업해주는 객체 있음
			 *		=> FileRenamePolicy() 객체(cos.jar에서 제공하는 객체) => 인터페이스 (추상메소드를 가지고 있는 것)
			 *		=> 내부적으로 해당 클래스에 rename() 메소드가 실행되면서 파일명 수정된 후 업로드
			 *			rename(기존의 원본파일) {
			 *				기존에 동일한 파일명이 존재할 경우
			 *				파일명 뒤에 카운팅된 숫자를 붙여줌
			 *				ex) aaa.jpg, aaa1.jpg, aaa2.jpg
			 *					꽃.png, 꽃1.png ===> 한글 처리는 못해줌
			 *				===> 한글처리 등을 위하여 오버라이딩 필요하다.
			 *				return 수정파일;
			 *			}
			 *
			 *	나만의 방식으로 절대 안 겹치도록 rename 할 수 있게
			 *	나만의 FileRenamePolicy 클래스(rename 메소드 재정의) 만들기!
			 *	com.kh.common.MyFileRenamePolicy 클래스 만들기
			 *	
			 *
			 */
			// MultipartRequest multiRequest = new MultipartRequest(request, 저장을시킬폴더경로, 용량제한, 인코딩값, 파일명수정시켜주는객체);
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			// MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
				
			// 3. DB에 기록할 데이터들 뽑아서 vo에 주섬주섬 담기
			//	> 제목, 카테고리 번호, 내용, 작성자 뽑아서 review 테이블 insert
			//	> 넘어온 첨부파일이 있다면 원본명, 수정명, 저장경로 Image 테이블 insert
			String category = multiRequest.getParameter("SC_ID");
			String reviewWriter = multiRequest.getParameter("MEM_NO");
			String reviewTitle = multiRequest.getParameter("TITLE");
			String content = multiRequest.getParameter("CONTENT");
			String pRating = multiRequest.getParameter("P_RATING"); 
			String rRating = multiRequest.getParameter("R_RATING");
			String prRating = multiRequest.getParameter("PR_RATING");
			String likeReview = multiRequest.getParameter("LIKE_REVIEW");
			
			Review rv = new Review();
			rv.setPcode(category);
			rv.setMemNo(Integer.parseInt(reviewWriter));
			rv.setTitle(reviewTitle);
			rv.setContent(content);
			rv.setpRating(Integer.parseInt(pRating));
			rv.setrRating(Integer.parseInt(rRating));
			rv.setPrRating(Integer.parseInt(prRating));
			rv.setLikeReview(Integer.parseInt(likeReview));

			Image img = null;
			// 첨에는 null로 초기화, 넘어온 첨부파일이 있다면 생성.
			// multiRequest.getOriginalFileName("키"); -- upfile 이라는 키값을 줄 거임.
			// 넘어온 첨부파일이 있었을 경우 "원본명 | 없었을 경우 null
			if(multiRequest.getOriginalFileName("upfile") != null) {
				// if문을 타면, 넘어온 첨부파일이 있을 경우
				img = new Image();
				// at.setOriginName(원본명);
				img.setOriginName(multiRequest.getOriginalFileName("upfile"));
				img.setChangeName(multiRequest.getFilesystemName("upfile"));
				img.setFilePath("resources/images/"); // /가 있어야 한다.
			}
			
			
			// 4. Service 요청 (요청처리)

			int result = new ReviewService().insertReview(rv, img);
			
			// 5. 응답뷰 지정
			// 성공 => /jsp/list.bo?cpage=1 url 재요청 => (목록페이지)
			// 실패 => 에러페이지
			
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
			
			Image img2 = new ReviewService().selectAttrImage();
			
			request.getSession().setAttribute("img2", img2);
			
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
