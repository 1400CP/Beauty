package com.kh.review.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.model.vo.PageInfo;
import com.kh.common.model.vo.Reply;
import com.kh.review.model.dao.ReviewDao;
import com.kh.review.model.vo.Image;
import com.kh.review.model.vo.Review;
import com.kh.review.model.vo.SubCategory;

import static com.kh.common.JDBCTemplate.*;


public class ReviewService {
	
	public int selectReviewList() {
		Connection conn = getConnection();
		
		int listCount = new ReviewDao().selectReviewList(conn);
		close(conn);
		return listCount;

	}
	
	public ArrayList<Review> selectReviewArrayList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Review> list = new ReviewDao().selectReviewArrayList(conn, pi);
		// 각 리뷰에 대해 이미지 목록을 추가
//	    for (Review rv : list) {
//	        ArrayList<Image> images = new ReviewDao().selectImagesForReview(conn, rv.getReviewNo());
//	        
//	        // 각 리뷰에 해당하는 이미지 리스트를 조회
//	        rv.setImages(images);
//	        // Review 객체에 이미지 목록 추가
//	    }
		
		close(conn);
		return list;
		
	}
	
	public ArrayList<Image> selectImageArrayList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Image> list1 = new ReviewDao().selectImageArrayList(conn, pi);
		
		close(conn);
		return list1;
	}
	
	
	public ArrayList<SubCategory> selectSubCategoryList() {
		Connection conn = getConnection();
		
		ArrayList<SubCategory> list = new ReviewDao().selectSubCategoryList(conn);
		
		close(conn);
		return list;
		
	}
	
	public int insertReview(Review rv, Image img) {
		Connection conn = getConnection();
		
		int result1 = new ReviewDao().insertReview(conn, rv);
		int result2 = 1;
		
		if(img != null) {
			result2 = new ReviewDao().insertImage(conn, img);
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result1 * result2;
		
	}
	
	public Review selectReviewTest(String refBno) {
		Connection conn = getConnection();
		
		Review rv = new ReviewDao().selectReviewTest(conn, refBno);
		
		close(conn);
		return rv;
	}
	
	public Review selectReview(String refBno) {
		Connection conn = getConnection();
		
		Review rv = new ReviewDao().selectReview(conn, refBno);
		
		close(conn);
		return rv;
	}
	
	public Image selectImage(String refBno) {
		Connection conn = getConnection();
		
		Image img = new ReviewDao().selectImage(conn, refBno);
		
		close(conn);
		return img;
	}
	
	
	public Review selectImgMemNo(String refBno) {
		Connection conn = getConnection();
		
		Review rv = new ReviewDao().selectImgMemNo(conn, refBno);
		
		close(conn);
		return rv;
		
	}
	
	public Review selectImgReview(String refBno) {
		Connection conn = getConnection();
		
		Review rv = new ReviewDao().selectImgReview(conn, refBno);
		
		close(conn);
		return rv;
	}
	
	public Image selectImgImage(String refBno) {
		Connection conn = getConnection();
		
		Image img = new ReviewDao().selectImgImage(conn, refBno);
		
		close(conn);
		return img;
	}
	
	public int updateReview2(Review rv) {
		Connection conn = getConnection();
				
		int result2 = new ReviewDao().updateReview2(conn, rv);
		
		if (result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result2;
	}
	
	public int updateReview1(Review rv, Image img) {
//		Connection conn = getConnection();
//		
//		int result1 = new ReviewDao().updateReview2(conn, rv);
//		int result2;
//		
//		if(img != null) { // 이미지가 있으면
//			result2 = new ReviewDao().updateImage(conn, img);
//		}else {
//			result2 = 1;
//		}
//		
//		
//		if(result1 > 0 && result2 > 0) {
//			commit(conn);
//		}else {
//			rollback(conn);
//		}
//		close(conn);
//		return result1 * result2;
		
		Connection conn = getConnection();
		
		int result1 = new ReviewDao().updateReview2(conn, rv);
		int result2 = 1;
		
		if(img != null) { // 이미지가 있으면
			if(img.getImgNo() != 0) { // 있으면
				result2 = new ReviewDao().updateImage(conn, img);
			}else { // 없으면
				result2 = new ReviewDao().newInsertImage(conn, img);
			}
		}

		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		System.out.println("글 업뎃 Service: " + result1);
		System.out.println("이미지 업뎃 Service: " + result2);
		close(conn);
		return result1 * result2;
	}
	
	public int deleteNewReview(Review rv) {
		Connection conn = getConnection();
		
		int result = new ReviewDao().deleteNewReview(conn, rv);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}
	
	public ArrayList<Reply> selectReplyList(String refBno){
		Connection conn = getConnection();
		
		ArrayList<Reply> list = new ReviewDao().selectReplyList(conn, refBno);
		
		close(conn);
		return list;
	}
	
	public int insertReply(Reply r) {
		Connection conn = getConnection();
		
		int result = new ReviewDao().insertReply(conn, r);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}
	
	public Review selectReviewEnroll() {
		Connection conn = getConnection();
		
		Review rv = new ReviewDao().selectReviewEnroll(conn);
		
		close(conn);
		return rv;

	}
	
	
	
	
}
