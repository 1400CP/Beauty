package com.kh.review.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.model.vo.PageInfo;
import com.kh.review.model.dao.ReviewDao;
import com.kh.review.model.vo.Review;

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
	
	public int selectReviewCpage(int cpage1) {
		Connection conn = getConnection();
		
		int result = new ReviewDao().selectReviewCpage(conn, cpage1);
		
		close(conn);
		return result;
	}

}
