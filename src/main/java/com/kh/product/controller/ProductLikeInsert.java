package com.kh.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import com.kh.product.model.service.ProductService;
import com.kh.product.model.vo.Product;

/**
 * Servlet implementation class ProductLikeInsert
 */
@WebServlet("/likeProduct.pr")
public class ProductLikeInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductLikeInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 클라이언트에서 전달된 pcode (상품 코드)
        String pcode = request.getParameter("pcode");

        // 좋아요 상태를 변경하는 서비스 호출
        int result = new ProductService().insertLike(pcode); // likeProduct 테이블에 좋아요 추가

        // 응답 타입을 JSON으로 설정
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");  // 문자 인코딩 설정

        // 좋아요 상태가 변경되었으면 좋아요 수 조회
        if (result > 0) {
            Product likeCountProduct = new ProductService().selectLikeCount(pcode);  // 해당 상품의 좋아요 수 가져오기
            response.getWriter().print("{\"likeCount\":" + likeCountProduct.getLikeProduct() + "}");  // JSON 형식으로 응답
        } else {
            response.getWriter().print("{\"likeCount\": -1}");  // 실패시 likeCount는 -1로 설정
        }

        // 응답 스트림을 닫아줍니다.
        response.getWriter().close();
    }
	    
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
