package com.kh.review.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.model.vo.PageInfo;
import com.kh.review.model.vo.Image;
import com.kh.review.model.vo.Review;
import com.kh.review.model.vo.SubCategory;

import static com.kh.common.JDBCTemplate.*;


public class ReviewDao {
	
	private Properties prop = new Properties();
	
	public ReviewDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(ReviewDao.class.getResource("/db/sql/review-mapper.xml").getPath()));
		} catch (IOException e) {

			e.printStackTrace();
		}
		
	}
	
	public int selectReviewList(Connection conn) {
		// 갯수로 처리하는 거니까 int 인줄 알았는데, 조회라서 ResultSet이래
		int result = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReviewList");
	
		try {
			pstmt = conn.prepareStatement(sql); // 완성형
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
		
	}
	
	public ArrayList<Review> selectReviewArrayList(Connection conn, PageInfo pi){
		// select 조회해야 하니까 ResultSet, 다행렬 조회
		ArrayList<Review> list = new ArrayList<Review>(); // 초기화
		
		PreparedStatement pstmt = null; // 초기화
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReviewArrayList"); 
		
		try {
			pstmt = conn.prepareStatement(sql); // 미완성
			
			/*
			 * currentPage : 1 => 시작값(RNUM) : 1 | 끝값(RNUM) : 5
			 * currentPage : 2 => 시작값 : 6 | 끝값 : 10
			 * currentPage : 3 => 시작값 : 11 | 끝값 : 15
			 * 
			 * 시작값 : (current - 1) * reviewLimit + 1
			 * 끝값 : 시작값 + reviewLimit - 1
			 */
			
			int startReview = (pi.getCurrentPage() - 1) * (pi.getreviewLimit() + 1);
			int endReview = startReview + pi.getreviewLimit() - 1;
			
			pstmt.setInt(1, startReview);
			pstmt.setInt(2, endReview);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Review rv = new Review();
				rv.setReviewNo(rset.getString("REVIEW_NO"));
				rv.setCreateDate(rset.getString("CREATE_DATE"));
				rv.setTitle(rset.getString("TITLE"));
				rv.setContent(rset.getString("CONTENT"));
				rv.setPrRating(rset.getInt("PR_RATING"));
				rv.setpRating(rset.getInt("P_RATING"));
				rv.setrRating(rset.getInt("R_RATING"));
				rv.setLikeReview(rset.getInt("LIKE_REVIEW"));
				
				list.add(rv);

			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;

	}
	
	public Image selectImageArraylist(Connection conn, PageInfo pi){
		Image img = null; // 초기화
		
		PreparedStatement pstmt = null; // 초기화
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectImageArraylist"); 
		
		int startReview = (pi.getCurrentPage() - 1) * (pi.getreviewLimit() + 1);
		int endReview = startReview + pi.getreviewLimit();

		try {
			pstmt = conn.prepareStatement(sql); // 미완성
			
			pstmt.setInt(1, startReview);
			pstmt.setInt(2, endReview);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				img = new Image();
				img.setImgNo(rset.getInt("IMAGE_NO"));
				img.setRefBno(rset.getString("REF_BNO"));
				img.setOriginName(rset.getString("ORIGIN_NAME"));
				img.setChangeName(rset.getString("CHANGE_NAME"));
				img.setFilePath(rset.getString("FILE_PATH"));
				img.setUploadDate(rset.getString("UPLOAD_DATE"));
				img.setReviewBno(rset.getString("REVIEW_BNO"));
				img.setPostBno(rset.getString("POST_BNO"));
				img.setProfileBno(rset.getString("PROFILE_BNO"));
				img.setFileLevel(rset.getInt("FILE_LEVEL"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return img;

	}
	
	public Review selectRefBno(Connection conn, String refBno) {
		Review rv = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectRefBno");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				rv = new Review();
				rv.setReviewNo(rset.getString("REVIEW_NO"));
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return rv;
	}
	
	public ArrayList<SubCategory> selectSubCategoryList(Connection conn){
		// select에 여러 행 조회 => Resultset
		
		ArrayList<SubCategory> list = new ArrayList<SubCategory>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSubCategoryList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				SubCategory sc = new SubCategory();
				sc.setScId(rset.getInt("SC_ID"));
				sc.setScName(rset.getString("SC_NAME"));
				list.add(sc);
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;

	}
	
	public int insertReview(Connection conn, Review rv) {
		// insert => 삽입! DML => 트랜잭션이 필요함.
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertReview");
		
		try {
			pstmt = conn.prepareStatement(sql); // 미완성
			
			pstmt.setString(1, rv.getPcode());
			pstmt.setInt(2, rv.getMemNo());
			pstmt.setString(3, rv.getTitle());
			pstmt.setString(4, rv.getContent());
			pstmt.setInt(5, rv.getpRating());
			pstmt.setInt(6, rv.getrRating());
			pstmt.setInt(7, rv.getpRating());
			pstmt.setInt(8, rv.getLikeReview());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;

	}
	
	public int insertImage(Connection conn, Image img) {
		// insert => 삽입! DML => 트랜잭션이 필요함.
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertImage");
		
		try {
			pstmt = conn.prepareStatement(sql); // 미완성
			
			pstmt.setString(1, img.getOriginName());
			pstmt.setString(2, img.getChangeName());
			pstmt.setString(3, img.getFilePath());
			// 리뷰는 Level 1로
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}
	
	public Review selectMemNo(Connection conn, String refBno) {
		// select 조회 => 대량으로 될 수도 있지 않나? 하나만인가?
		Review rv = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMemNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				rv = new Review();
				rv.setMemNo(rset.getInt("MEM_NO"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return rv;

	}
	
	public Review selectReview(Connection conn, String refBno) {
		// select인데 게시글 하나 조회하는 거니까 Array는 아니지.
		Review rv = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReview");
		// insert 때 다 적어야지! 필요한 것만 조회함.
		
		try {
			pstmt = conn.prepareStatement(sql); // 미완성
			
			pstmt.setString(1, refBno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) { // 수정할 때 필요한 멤버 넘버, 생성날짜, 제목, 카테고리 = PCODE, 내용, 가격, 성분, 재구매, 따봉수
				rv = new Review();
				rv.setReviewNo(rset.getString("REVIEW_NO"));
				rv.setPcode(rset.getString("PCODE"));
				rv.setMemNo(rset.getInt("MEM_NO"));
				rv.setTitle(rset.getString("TITLE"));
				rv.setContent(rset.getString("CONTENT"));
				rv.setCreateDate(rset.getString("CREATE_DATE"));
				rv.setpRating(rset.getInt("P_RATING"));
				rv.setrRating(rset.getInt("R_RATING"));
				rv.setPrRating(rset.getInt("PR_RATING"));
				rv.setLikeReview(rset.getInt("LIKE_REVIEW"));
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return rv;

	}
	
	public Image selectImage(Connection conn, String refBno) {
		// select 조회인데, 게시글 하나임
		Image img = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectImage");
		// (해당 게시글에 달린 이미지를 조회해야 함.)
		// 이미지 데이터중 뭘 불러와야 할까?
		
		
		try {
			pstmt = conn.prepareStatement(sql); // 미완성'
			
			pstmt.setString(1, refBno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				img = new Image();
				img.setImgNo(rset.getInt("IMAGE_NO"));
				img.setRefBno(rset.getString("REF_BNO"));
				img.setOriginName(rset.getString("ORIGIN_NAME"));
				img.setChangeName(rset.getString("CHANGE_NAME"));
				img.setFilePath(rset.getString("FILE_PATH"));
				img.setReviewBno(rset.getString("REVIEW_BNO"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return img;
		
	}
	
	public Review selectImgMemNo (Connection conn) {
		// 조회 ResultSet 다만, 조회를 하나만 할 거여.
		Review rv = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectImgMemNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) { // 수정할 때 필요한 멤버 넘버, 생성날짜, 제목, 카테고리 = PCODE, 내용, 가격, 성분, 재구매, 따봉수
				rv = new Review();
				rv.setMemNo(rset.getInt("MEM_NO"));
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return rv;

	}
	
	public Review selectImgReview(Connection conn) {
		Review rv = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectImgReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				rv = new Review();
				rv.setReviewNo(rset.getString("REVIEW_NO"));
				rv.setPcode(rset.getString("PCODE"));
				rv.setMemNo(rset.getInt("MEM_NO"));
				rv.setTitle(rset.getString("TITLE"));
				rv.setContent(rset.getString("CONTENT"));
				rv.setCreateDate(rset.getString("CREATE_DATE"));
				rv.setpRating(rset.getInt("P_RATING"));
				rv.setrRating(rset.getInt("R_RATING"));
				rv.setPrRating(rset.getInt("PR_RATING"));
				rv.setLikeReview(rset.getInt("LIKE_REVIEW"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return rv;

	}
	
	public Image selectImgImage(Connection conn) {
		Image img = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
				
		String sql = prop.getProperty("selectImgImage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				img = new Image();
				img.setImgNo(rset.getInt("IMAGE_NO"));
				img.setRefBno(rset.getString("REF_BNO"));
				img.setOriginName(rset.getString("ORIGIN_NAME"));
				img.setChangeName(rset.getString("CHANGE_NAME"));
				img.setFilePath(rset.getString("FILE_PATH"));
				img.setReviewBno(rset.getString("REVIEW_BNO"));
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return img;

	}

}
