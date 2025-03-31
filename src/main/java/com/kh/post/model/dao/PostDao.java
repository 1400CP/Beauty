package com.kh.post.model.dao;

import static com.kh.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.post.model.vo.Post;
import com.kh.common.model.vo.PageInfo;
import com.kh.common.model.vo.Reply;
import com.kh.member.model.vo.Member;
import com.kh.post.model.vo.Image2;
import com.kh.post.model.vo.SubCategory2;

public class PostDao {
	
	private Properties prop = new Properties();
	
	public PostDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(PostDao.class.getResource("/db/sql/post-mapper.xml").getPath()));
		} catch (IOException e) {

			e.printStackTrace();
		}
		
	}
	
	public int selectPostList(Connection conn) {
		// 갯수로 처리하는 거니까 int 인줄 알았는데, 조회라서 ResultSet이래
		int result = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPostList");
	
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
	
	public ArrayList<Post> selectPostArrayList(Connection conn, PageInfo pi){
		// select 조회해야 하니까 ResultSet, 다행렬 조회
		ArrayList<Post> list = new ArrayList<Post>(); // 초기화
		
		PreparedStatement pstmt = null; // 초기화
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPostArrayList"); 
		
		try {
			pstmt = conn.prepareStatement(sql); // 미완성
			
			/*
			 * currentPage : 1 => 시작값(RNUM) : 1 | 끝값(RNUM) : 5
			 * currentPage : 2 => 시작값 : 6 | 끝값 : 10
			 * currentPage : 3 => 시작값 : 11 | 끝값 : 15
			 * 
			 * 시작값 : (current - 1) * PostLimit + 1
			 * 끝값 : 시작값 + PostLimit - 1
			 */
			
			int startPost = (pi.getCurrentPage() - 1) * pi.getreviewLimit() + 1;
			int endPost = startPost + pi.getreviewLimit() - 1;
			
			pstmt.setInt(1, startPost);
			pstmt.setInt(2, endPost);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Post po = new Post();
				po.setPostNo(rset.getInt("POST_NO"));
				po.setMemNo(rset.getInt("MEM_NO"));
				po.setTitle(rset.getString("TITLE"));
				po.setContent(rset.getString("CONTENT"));
				po.setCreateDate(rset.getDate("CREATE_DATE"));
				po.setLikePost(rset.getInt("LIKE_POST"));
				
				list.add(po);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;

	}
	
	public ArrayList<Image2> selectImage2Arraylist(Connection conn, PageInfo pi){
		ArrayList<Image2> list2 = new ArrayList<Image2>(); // 초기화
		
		PreparedStatement pstmt = null; // 초기화
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectImage2Arraylist"); 
		
		int startPost = (pi.getCurrentPage() - 1) * pi.getreviewLimit() + 1;
		int endPost = startPost + pi.getreviewLimit() - 1;

		try {
			pstmt = conn.prepareStatement(sql); // 미완성
			
			pstmt.setInt(1, startPost);
			pstmt.setInt(2, endPost);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Image2 img = new Image2();
				img.setImgNo(rset.getInt("IMAGE_NO"));
				img.setRefBno(rset.getInt("REF_BNO"));
				img.setOriginName(rset.getString("ORIGIN_NAME"));
				img.setChangeName(rset.getString("CHANGE_NAME"));
				img.setFilePath(rset.getString("FILE_PATH"));
				img.setUploadDate(rset.getDate("UPLOAD_DATE"));
				img.setFileLevel(rset.getString("FILE_LEVEL"));
				
				list2.add(img);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list2;

	}
	
	
	public ArrayList<SubCategory2> selectSubCategory2List(Connection conn){
		// select에 여러 행 조회 => Resultset
		
		ArrayList<SubCategory2> list = new ArrayList<SubCategory2>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSubCategory2List");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				SubCategory2 sc = new SubCategory2();
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
	
	
	public int insertPost(Connection conn, Post po) {
		// insert => 삽입! DML => 트랜잭션이 필요함.
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertPost");
		
		try {
			pstmt = conn.prepareStatement(sql); // 미완성
			
			pstmt.setInt(1, po.getMemNo());
			pstmt.setString(2, po.getTitle());
			pstmt.setString(3, po.getContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;

	}
	
	public int insertImage2(Connection conn, Image2 img) {
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
	
	public Post selectPostTest(Connection conn, String refBno) {
		// select 조회 => 대량으로 될 수도 있지 않나? 하나만인가?
		Post rv = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPostTest");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, refBno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				rv = new Post();
				rv.setPostNo(rset.getInt("POST_NO"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return rv;

	}
	
	public Post selectPost(Connection conn, String refBno) {
		// select인데 게시글 하나 조회하는 거니까 Array는 아니지.
		Post po = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPost");
		// insert 때 다 적어야지! 필요한 것만 조회함.
		
		try {
			pstmt = conn.prepareStatement(sql); // 미완성
			
			pstmt.setString(1, refBno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) { // 이거 업뎃용 아니잖아.
				po = new Post();
				po.setPostNo(rset.getInt("POST_NO"));
				po.setMemNo(rset.getInt("MEM_NO"));
				po.setTitle(rset.getString("TITLE"));
				po.setContent(rset.getString("CONTENT"));
				po.setLikePost(rset.getInt("LIKE_POST"));
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return po;

	}
	
	public Image2 selectImage2(Connection conn, String refBno) {
		// select 조회인데, 게시글 하나임
		Image2 img = null;
		Post po = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectImage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, refBno);

			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				img = new Image2();
				po = new Post();
				po.setPostNo(rset.getInt("POST_NO"));
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
	
	public Post selectImgMemNo (Connection conn, String refBno) {
		// 조회 ResultSet 다만, 조회를 하나만 할 거여.
		Post rv = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectImgMemNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) { // 수정할 때 필요한 멤버 넘버, 생성날짜, 제목, 카테고리 = PCODE, 내용, 가격, 성분, 재구매, 따봉수
				rv = new Post();
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
	
	public Post selectImgPost(Connection conn, String refBno) {
		Post rv = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectImgPost");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, refBno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				rv = new Post();
				rv.setPostNo(rset.getInt("POST_NO"));
				rv.setMemNo(rset.getInt("MEM_NO"));
				rv.setTitle(rset.getString("TITLE"));
				rv.setContent(rset.getString("CONTENT"));
				rv.setCreateDate(rset.getDate("CREATE_DATE"));
				rv.setLikePost(rset.getInt("LIKE_Post"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return rv;

	}
	
	public Image2 selectImgImage2(Connection conn, String refBno) {
		Image2 img = null;
		Post rv = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
				
		String sql = prop.getProperty("selectImgImage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				img = new Image2();
				rv = new Post();
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
	
	public int updatePost(Connection conn, Post rv) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updatePost");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, rv.getTitle());
			pstmt.setString(2, rv.getContent());
			pstmt.setInt(3, rv.getPostNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;

	}
	
	public int updateImage2(Connection conn, Image2 img) {
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
	
	public int newInsertImage2(Connection conn, Image2 img) {
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
	
	public int deleteNewPost(Connection conn, Post po) {
		// update니까 조회...는 안 하네
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteNewPost");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, po.getPostNo());
			
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
	
	public Post selectPostEnroll(Connection conn) {
		Post po = new Post();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
				
		String sql = prop.getProperty("selectPostEnroll");
		
		try {
			pstmt = conn.prepareStatement(sql); // 미완성
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				po.setPostNo(rset.getInt("POST_NO"));
				po.setMemNo(rset.getInt("MEM_NO"));
				po.setLikePost(rset.getInt("LIKE_POST"));
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return po;

	}
	
	
	
}
