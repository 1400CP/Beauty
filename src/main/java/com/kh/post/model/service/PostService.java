package com.kh.post.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.model.vo.PageInfo;
import com.kh.common.model.vo.Reply;
import com.kh.post.model.dao.PostDao;
import com.kh.post.model.vo.Post;
import com.kh.post.model.vo.Image2;
import com.kh.post.model.vo.SubCategory2;

public class PostService {
	
	public int selectPostList() {
		Connection conn = getConnection();
		
		int listCount = new PostDao().selectPostList(conn);
		close(conn);
		return listCount;

	}
	
	public ArrayList<Post> selectPostArrayList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Post> list = new PostDao().selectPostArrayList(conn, pi);
		
//	    for (Post po : list) {
//	        ArrayList<Image2> images = new PostDao().selectImagesForPost(conn, po.getPostNo());
//	        // 각 리뷰에 해당하는 이미지 리스트를 조회
//	        po.setImages(images);
//	        // Review 객체에 이미지 목록 추가
//	    }
		
		close(conn);
		return list;
		
	}
	
	public ArrayList<Image2> selectImage2Arraylist(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Image2> list2 = new PostDao().selectImage2Arraylist(conn, pi);
		
		close(conn);
		return list2;
	}
	
	
	public ArrayList<SubCategory2> selectSubCategory2List() {
		Connection conn = getConnection();
		
		ArrayList<SubCategory2> list = new PostDao().selectSubCategory2List(conn);
		
		close(conn);
		return list;
		
	}
	
	public int insertPost(Post po, Image2 img) {
		Connection conn = getConnection();
		
		int result1 = new PostDao().insertPost(conn, po);
		int result2 = 1;
		
		if(img != null) {
			result2 = new PostDao().insertImage2(conn, img);
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result1 * result2;
		
	}
	
	public Post selectPostTest(String refBno) {
		Connection conn = getConnection();
		
		Post rv = new PostDao().selectPostTest(conn, refBno);
		
		close(conn);
		return rv;
	}
	
	public Post selectPost(String refBno) {
		Connection conn = getConnection();
		
		Post po = new PostDao().selectPost(conn, refBno);
		
		close(conn);
		return po;
	}
	
	public Image2 selectImage2(String refBno) {
		Connection conn = getConnection();
		
		Image2 img = new PostDao().selectImage2(conn, refBno);
		
		close(conn);
		return img;
	}
	
	
	public Post selectImgMemNo(String refBno) {
		Connection conn = getConnection();
		
		Post rv = new PostDao().selectImgMemNo(conn, refBno);
		
		close(conn);
		return rv;
		
	}
	
	public Post selectImgPost(String refBno) {
		Connection conn = getConnection();
		
		Post rv = new PostDao().selectImgPost(conn, refBno);
		
		close(conn);
		return rv;
	}
	
	public Image2 selectImgImage2(String refBno) {
		Connection conn = getConnection();
		
		Image2 img = new PostDao().selectImgImage2(conn, refBno);
		
		close(conn);
		return img;
	}
	
	public int updatePost(Post rv, Image2 img) {
		Connection conn = getConnection();
		
		int result1 = new PostDao().updatePost(conn, rv);
		int result2;
System.out.println("포스트 Service 글 result1 : " + result1);

		if(img != null) { // 기존 이미지가 있으면
			if(img.getImgNo() == 0) { // 기존이미지, 기존 이미지가 없으면
				result2 = new PostDao().newInsertImage2(conn, img);
			}else { // 기존 이미지, 이미지가 있으면
				result2 = new PostDao().updateImage2(conn, img);
			}
		}else { // 이미지가 없으면 게시글 update
			result2 = 1;
		}
		
System.out.println("포스트 Service 이미지 result2 : " + result2);		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1 * result2;
		
	}
	
	public int deleteNewPost(Post po) {
		Connection conn = getConnection();
		
		int result = new PostDao().deleteNewPost(conn, po);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}
	
	public ArrayList<Reply> selectReplyList(String refBno){
		Connection conn = getConnection();
		
		ArrayList<Reply> list = new PostDao().selectReplyList(conn, refBno);
		
		close(conn);
		return list;
	}
	
	public int insertReply(Reply r) {
		Connection conn = getConnection();
		
		int result = new PostDao().insertReply(conn, r);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}
	
	public Post selectPostEnroll() {
		Connection conn = getConnection();
		
		Post rv = new PostDao().selectPostEnroll(conn);
		
		close(conn);
		return rv;

	}


}
