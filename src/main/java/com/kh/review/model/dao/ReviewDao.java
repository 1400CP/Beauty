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
import com.kh.common.model.vo.Reply;
import com.kh.member.model.vo.Member;
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
			
			int startReview = (pi.getCurrentPage() - 1) * pi.getreviewLimit() + 1;
			int endReview = startReview + pi.getreviewLimit() - 1;
			
			pstmt.setInt(1, startReview);
			pstmt.setInt(2, endReview);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Review rv = new Review();
				rv.setReviewNo(rset.getString("REVIEW_NO"));
				rv.setMemNo(rset.getInt("MEM_NO"));
				rv.setCreateDate(rset.getDate("CREATE_DATE"));
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
	
	public ArrayList<Image> selectImageArraylist(Connection conn, PageInfo pi){
		ArrayList<Image> list2 = new ArrayList<Image>(); // 초기화
		
		PreparedStatement pstmt = null; // 초기화
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectImageArraylist"); 
		
		int startReview = (pi.getCurrentPage() - 1) * pi.getreviewLimit() + 1;
		int endReview = startReview + pi.getreviewLimit() - 1;

		try {
			pstmt = conn.prepareStatement(sql); // 미완성
			
			pstmt.setInt(1, startReview);
			pstmt.setInt(2, endReview);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				Image img = new Image();
				img.setImgNo(rset.getInt("IMAGE_NO"));
				img.setRefBno(rset.getInt("REF_BNO"));
				img.setOriginName(rset.getString("ORIGIN_NAME"));
				img.setChangeName(rset.getString("CHANGE_NAME"));
				img.setFilePath(rset.getString("FILE_PATH"));
				img.setUploadDate(rset.getDate("UPLOAD_DATE"));
				img.setFileLevel(rset.getString("FILE_LEVEL"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list2;

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
			
			pstmt.setInt(1, img.getRefBno());
			pstmt.setString(2, img.getOriginName());
			pstmt.setString(3, img.getChangeName());
			pstmt.setString(4, img.getFilePath());
			// 리뷰는 Level R로
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}
	
	public Review selectReviewTest(Connection conn, String refBno) {
		// select 조회 => 대량으로 될 수도 있지 않나? 하나만인가?
		Review rv = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReviewTest");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, refBno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				rv = new Review();
				rv.setReviewNo(rset.getString("REVIEW_NO"));
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
			
			if(rset.next()) { // 이거 업뎃용 아니잖아.
				rv = new Review();
				rv.setReviewNo(rset.getString("REVIEW_NO"));
				rv.setPcode(rset.getString("PCODE"));
				rv.setMemNo(rset.getInt("MEM_NO"));
				rv.setTitle(rset.getString("TITLE"));
				rv.setContent(rset.getString("CONTENT"));
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
		Review rv = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectImage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, refBno);

			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				img = new Image();
//				rv = new Review();
//				rv.setReviewNo(rset.getString("REVIEW_NO"));
				img.setImgNo(rset.getInt("IMAGE_NO"));
				img.setOriginName(rset.getString("ORIGIN_NAME"));
				img.setChangeName(rset.getString("CHANGE_NAME"));
				img.setFilePath(rset.getString("FILE_PATH"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return img;
		
	}
	
	public Review selectImgMemNo (Connection conn, String refBno) {
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
	
	public Review selectImgReview(Connection conn, String refBno) {
		Review rv = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectImgReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, refBno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				rv = new Review();
				rv.setReviewNo(rset.getString("REVIEW_NO"));
				rv.setPcode(rset.getString("PCODE"));
				rv.setMemNo(rset.getInt("MEM_NO"));
				rv.setTitle(rset.getString("TITLE"));
				rv.setContent(rset.getString("CONTENT"));
				rv.setCreateDate(rset.getDate("CREATE_DATE"));
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
	
	public Image selectImgImage(Connection conn, String refBno) {
		Image img = null;
		Review rv = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
				
		String sql = prop.getProperty("selectImgImage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				img = new Image();
				rv = new Review();
				img.setImgNo(rset.getInt("IMAGE_NO"));
				img.setRefBno(rset.getInt("REF_BNO"));
				img.setOriginName(rset.getString("ORIGIN_NAME"));
				img.setChangeName(rset.getString("CHANGE_NAME"));
				img.setFilePath(rset.getString("FILE_PATH"));
				img.setUploadDate(rset.getDate("UPLOAD_DATE"));
				rv.setMemNo(rset.getInt("MEM_NO"));
				rv.setCreateDate(rset.getDate("CREATE_DATE"));
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return img;

	}
	
	public int updateReview2(Connection conn, Review rv) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, rv.getTitle());
			pstmt.setString(2, rv.getContent());
			pstmt.setInt(3, rv.getpRating());
			pstmt.setInt(4, rv.getrRating());
			pstmt.setInt(5, rv.getPrRating());
			pstmt.setString(6, rv.getReviewNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;

	}
	
	public int updateImage(Connection conn, Image img) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateImage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, img.getOriginName());
			pstmt.setString(2, img.getChangeName());
			pstmt.setString(3, img.getFilePath());
			pstmt.setInt(4, img.getImgNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;

	}
	
	public int newInsertImage(Connection conn, Image img) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("newInsertImage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, img.getRefBno());
			pstmt.setString(2, img.getOriginName());
			pstmt.setString(3, img.getChangeName());
			pstmt.setString(4, img.getFilePath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;

	}
	
	public int deleteNewReview(Connection conn, Review rv) {
		// update니까 조회...는 안 하네
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteNewReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, rv.getReviewNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;

	}
	
	
	public ArrayList<Reply> selectReplyList(Connection conn, String refBno) {
		// select 조회문에 여러행 while문
		ArrayList<Reply> list = new ArrayList<Reply>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReplyList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, refBno);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Reply r = new Reply();
				Member m = new Member();
				r.setReplyNo(rset.getInt("REPLY_NO"));
				r.setMemNo(rset.getInt("MEM_NO"));
				r.setUserId(rset.getString("MEM_ID"));
				r.setReplyContent(rset.getString("REPLY_CONTENT"));
				r.setCreateDate(rset.getString("CREATE_DATE"));
				r.setRefBno(rset.getInt("REF_BNO"));

				list.add(r);
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("조회된 댓글 수 확인 : " + list.size());
		return list;

	}
	
	
	public int insertReply(Connection conn, Reply r) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertReply");

		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, r.getMemNo());
			pstmt.setString(2, r.getReplyContent());
			pstmt.setInt(3, r.getRefBno());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;

	}
	
	public Review selectReviewEnroll(Connection conn) {
		Review rv = new Review();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
				
		String sql = prop.getProperty("selectReviewEnroll");
		
		try {
			pstmt = conn.prepareStatement(sql); // 미완성
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				rv.setReviewNo(rset.getString("REVIEW_NO"));
				rv.setMemNo(rset.getInt("MEM_NO"));
				rv.setLikeReview(rset.getInt("LIKE_REVIEW"));
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return rv;
		
				
				
	}
	

}
