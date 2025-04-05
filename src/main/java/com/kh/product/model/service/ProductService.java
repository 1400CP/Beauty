package com.kh.product.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.product.model.dao.ProductDao;
import com.kh.product.model.vo.Product;

import static com.kh.common.JDBCTemplate.*;

public class ProductService {

	public ArrayList<Product> selectSkinList() {

		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().selectSkinList(conn);

		close(conn);
		return list;
	}

	public ArrayList<Product> selectHairList() {

		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().selectHairList(conn);

		close(conn);
		return list;
	}
	
	public ArrayList<Product> selectMakeUpList() {

		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().selectMakeUpList(conn);

		close(conn);
		return list;
	}
	
	public ArrayList<Product> selectBrandList(String[] selectedBrands) {
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().selectBrandList(conn, selectedBrands);
		
		close(conn);
		return list;
	}
	
	public int insertLike(String pcode) {
		Connection conn = getConnection();
		int result = new ProductDao().insertLike(conn, pcode);
		
		if(result > 0) {
			commit(conn);
			
		} else {
			rollback(conn);
		}
		return result;
	}
	
	public Product selectLikeCount(String pcode) {
		
		Connection conn = getConnection();
		Product likeCount = new ProductDao().selectLikeCount(conn, pcode);
		close(conn);
		return likeCount;
	}

}
