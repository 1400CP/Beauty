package com.kh.post.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.kh.common.MyFileRenamePolicy;
import com.kh.post.model.service.PostService;
import com.kh.post.model.vo.Image2;
import com.kh.post.model.vo.Post;
import com.kh.review.model.service.ReviewService;
import com.kh.review.model.vo.Image;
import com.kh.review.model.vo.Review;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class postInsertController
 */
@WebServlet("/post.wr")
public class postInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public postInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			// 파일 업로드를 위한 라이브러리 : cos.jar(com.oreilly.servlet의 약자)
			// http://www.servlet.com에서 다운로드

			int maxSize = 10*1024*1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/images/");
					
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String memNo = multiRequest.getParameter("MEM_NO");
			String reviewTitle = multiRequest.getParameter("TITLE");
			String content = multiRequest.getParameter("CONTENT");
			String likePost = multiRequest.getParameter("LIKE_POST");
			
			Post po = new Post();
			po.setMemNo(Integer.parseInt(memNo));
			po.setTitle(reviewTitle);
			po.setContent(content);
			po.setLikePost(Integer.parseInt(likePost));

			Image2 img = null;
			if(multiRequest.getOriginalFileName("upfile") != null) {
				// if문을 타면, 넘어온 첨부파일이 있을 경우
				img = new Image2();
				img.setRefBno(po.getMemNo());
				img.setOriginName(multiRequest.getOriginalFileName("upfile"));
				img.setChangeName(multiRequest.getFilesystemName("upfile"));
				img.setFilePath("resources/images/"); // /가 있어야 한다.
			}
			
			// 4. Service 요청 (요청처리)

			int result = new PostService().insertPost(po, img);
			
			// 5. 응답뷰 지정
			// 성공 => /jsp/list.bo?cpage=1 url 재요청 => (목록페이지)

			if(result > 0) {
				response.sendRedirect(request.getContextPath() + "/post.list?");
				request.getSession().setAttribute("alertMsg", "일반게시판등록!");
			}else {
				// 실패 => 첨부파일 있었다면 업로드 된 파일 찾아서 삭제 시킨 후 에러페이지로
				if(img != null) { // 첨부파일이 있었다면
					new File(savePath + img.getChangeName()).delete();
				}
				response.sendRedirect(request.getContextPath() + "/post.list?");
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
