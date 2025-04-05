package com.kh.product.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Properties;

import static com.kh.common.JDBCTemplate.*;
import com.kh.product.model.vo.Product;

public class ProductDao {

	private Properties prop = new Properties();

	public ProductDao() {
		String filePath = ProductDao.class.getResource("/db/sql/product-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Product> selectSkinList(Connection conn) {

		ArrayList<Product> list = new ArrayList<Product>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectSkinList");

		try {
			pstmt = conn.prepareStatement(sql);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Product(rset.getString("pcode"), rset.getString("pname"), rset.getString("IMAGE_PATH"),
						rset.getInt("like_product"), rset.getDouble("rate"), rset.getString("bname")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Product> selectHairList(Connection conn) {

		ArrayList<Product> list = new ArrayList<Product>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectHairList");

		try {
			pstmt = conn.prepareStatement(sql);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Product(rset.getString("pcode"), rset.getString("pname"), rset.getString("IMAGE_PATH"),
						rset.getInt("like_product"), rset.getDouble("rate"), rset.getString("bname")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Product> selectMakeUpList(Connection conn) {

		ArrayList<Product> list = new ArrayList<Product>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMakeUpList");

		try {
			pstmt = conn.prepareStatement(sql);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Product(rset.getString("pcode"), rset.getString("pname"), rset.getString("IMAGE_PATH"),
						rset.getInt("like_product"), rset.getDouble("rate"), rset.getString("bname")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Product> selectBrandList(Connection conn, String[] selectedBrands) {
	    ArrayList<Product> list = new ArrayList<Product>();
	    PreparedStatement pstmt = null;
	    ResultSet rset = null;

	    // 기본 SQL (SC_ID 조건 제거)
	    String sql = "SELECT "
	            + "P.PCODE, "
	            + "P.PNAME, "
	            + "P.RATE, "
	            + "P.LIKE_PRODUCT, "
	            + "P.IMAGE_PATH, "
	            + "B.BNAME "
	            + "FROM PRODUCT P "
	            + "JOIN BRAND B ON P.BRAND_ID = B.B_NO "
	            + "WHERE ";

	    // ✅ selectedBrands가 문자열이라면 배열로 변환
	    if (selectedBrands.length == 1 && selectedBrands[0].contains(",")) {
	        selectedBrands = selectedBrands[0].split("\\s*,\\s*");
	    }

	    // ✅ IN문과 LIKE 구분
	    if (selectedBrands.length > 1) {
	        sql += "B.BNAME IN (";
	        for (int i = 0; i < selectedBrands.length; i++) {
	            sql += "?";
	            if (i < selectedBrands.length - 1) {
	                sql += ",";
	            }
	        }
	        sql += ")";
	    } else {
	        sql += "B.BNAME LIKE ?";
	    }

	    try {
	        pstmt = conn.prepareStatement(sql);

	        // ✅ 파라미터 설정
	        if (selectedBrands.length > 1) {
	            for (int i = 0; i < selectedBrands.length; i++) {
	                pstmt.setString(i + 1, selectedBrands[i]); // IN 절
	            }
	        } else {
	            pstmt.setString(1, "%" + selectedBrands[0] + "%"); // LIKE 절
	        }

	        rset = pstmt.executeQuery();

	     // 결과를 list에 추가
	     	while (rset.next()) {
	     		list.add(new Product(rset.getString("PCODE"),
	                              	 rset.getString("PNAME"),
	                              	 rset.getString("IMAGE_PATH"),
	                              	 rset.getInt("LIKE_PRODUCT"),
	                              	 rset.getDouble("RATE"),
	                              	 rset.getString("BNAME")));
	     	}
	 	} catch (SQLException e) {
	 		e.printStackTrace();
	 	} finally {
	        close(rset);
	        close(pstmt);
	    }
	 
	    return list;
	}
	
	public int insertLike(Connection conn, String pcode) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertLike");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pcode);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}
	
	public Product selectLikeCount(Connection conn, String pcode) {
		
		Product likeCount = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("SelectLikeCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pcode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				likeCount = new Product(rset.getInt("LIKE_PRODUCT"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return likeCount;
		
	}
}

