package com.kh.post.controller;

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
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class PostUpdateController2
 */
@WebServlet("/updatePost2.wr")
public class PostUpdateController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostUpdateController2() {
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
			
			String refBno = multiRequest.getParameter("bno"); // POST_NO
			String postTitle = multiRequest.getParameter("TITLE");
			String content = multiRequest.getParameter("CONTENT");
	System.out.println("POST_NO : " + refBno);
			String imgNo = multiRequest.getParameter("originFileNo");
	System.out.println("포스트 업뎃 이미지넘버 : " + imgNo);		
			Post po = new Post();
			po.setTitle(postTitle);
			po.setContent(content);
			po.setPostNo(Integer.parseInt(refBno));
			
			Image2 img = null; // 처음에는 null로 초기화
			img = new Image2();
			img.setOriginName(multiRequest.getOriginalFileName("upfile"));
			img.setChangeName(multiRequest.getFilesystemName("upfile"));
			img.setFilePath("resources/images/");
			
	System.out.println("포스트 업뎃 이미지이름 : " + multiRequest.getOriginalFileName("upfile"));
			
			if(multiRequest.getOriginalFileName("upfile") != null) {
				if(imgNo == null) { // insert
					img.setRefBno(Integer.parseInt(refBno));
					img.setOriginName(multiRequest.getOriginalFileName("upfile"));
					img.setChangeName(multiRequest.getFilesystemName("upfile"));
					img.setFilePath("resources/images/");

					int result = new PostService().updatePost(po, img);
					
					if(result > 0) { // 성공
						response.sendRedirect(request.getContextPath() + "/detail.po?bno=" + refBno);
						
					}else { // 실패
						request.getSession().setAttribute("alertMsg", "오류 발생");
						response.sendRedirect(request.getContextPath() + "/post.list?");
					}
					
				}else { // IMAGE_NO 있음 == update
					img.setOriginName(multiRequest.getOriginalFileName("upfile"));
					img.setChangeName(multiRequest.getFilesystemName("upfile"));
					img.setFilePath("resources/images/");
					img.setImgNo(Integer.parseInt(imgNo));
					
					int result = new PostService().updatePost(po, img);
					
					if(result > 0) { // 성공
						response.sendRedirect(request.getContextPath() + "/detail.po?bno=" + refBno);
						
					}else { // 실패
						request.getSession().setAttribute("alertMsg", "오류 발생");
						response.sendRedirect(request.getContextPath() + "/post.list?");
					}
					
				}
			}else { // 게시글만
				img.setRefBno(0);
				img.setOriginName("게시글 전용 업로드");
				img.setChangeName("게시글 전용 업로드");
				img.setFilePath("resources/images/");
				
				int result = new PostService().updatePost(po, img);

				if(result > 0) { // 성공
					response.sendRedirect(request.getContextPath() + "/detail.po?bno=" + refBno);
					
				}else { // 실패
					request.getSession().setAttribute("alertMsg", "오류 발생");
					response.sendRedirect(request.getContextPath() + "/post.list?");
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
