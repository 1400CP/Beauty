package com.kh.review.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.model.vo.PageInfo;
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
		
		close(conn);
		return list;
		
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
	
	public int selectMemNo(int boardNo) {
		Connection conn = getConnection();
		
		int result = new ReviewDao().selectMemNo(conn, boardNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}
	
	public Review selectReview(int boardNo) {
		Connection conn = getConnection();
		
		Review rv = new ReviewDao().selectReview(conn, boardNo);
		
		close(conn);
		return rv;
	}
	
	public Image selectImage(int boardNo) {
		Connection conn = getConnection();
		
		Image img = new ReviewDao().selectImage(conn, boardNo);
		
		close(conn);
		return img;
	}
	
	public Image selectAttrImage() {
		Connection conn = getConnection();
		
		Image img = new ReviewDao().selectAttrImage(conn);
		
		close(conn);
		return img;
		
	}

}
