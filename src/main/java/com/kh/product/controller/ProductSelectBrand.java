package com.kh.product.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;
import com.kh.product.model.service.ProductService;
import com.kh.product.model.vo.Product;

/**
 * Servlet implementation class ProductSelectBrand
 */
@WebServlet("/selectbrand.pr")
public class ProductSelectBrand extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductSelectBrand() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String[] selectedBrands = request.getParameterValues("brands");

        if (selectedBrands != null && selectedBrands.length > 0) {
            // selectedBrands는 선택된 브랜드를 담고 있음
            ArrayList<Product> products = new ProductService().selectBrandList(selectedBrands); // 메서드 호출

            // 만약 products가 null이면 빈 ArrayList로 초기화
            if (products == null) {
                products = new ArrayList<>();  // 빈 ArrayList로 초기화
            }

            // 응답 헤더 설정
            response.setContentType("application/json; charset=UTF-8");

            // Gson을 사용하여 products 객체를 JSON 배열로 변환
            String jsonResponse = new Gson().toJson(products); // ArrayList를 JSON 배열로 변환

            // 응답에 JSON 데이터 전송
            response.getWriter().write(jsonResponse); // JSON 응답 전송

            // 스트림을 닫음
            response.getWriter().flush();
            response.getWriter().close();
        } else {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"error\":\"No brands selected\"}");
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
