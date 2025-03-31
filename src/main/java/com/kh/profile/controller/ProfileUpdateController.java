package com.kh.profile.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;
import com.kh.profile.controller.model.service.ProfileService;
import com.kh.profile.controller.model.vo.Profile;

/**
 * Servlet implementation class ProfileUpdateController
 */
@WebServlet("/update.bp")
public class ProfileUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String skinType = request.getParameter("skinType");
		String bodyType = request.getParameter("bodyType");
		String hairType = request.getParameter("hairType");
		String scalpType = request.getParameter("scalpType");
		String[] skinImprovement = request.getParameterValues("skinImprovement"); // 다중 선택 값
		String[] scalpImprovement = request.getParameterValues("scalpImprovement");
		String[] brand = request.getParameterValues("brand");
		String release = request.getParameter("release");
		String gender = request.getParameter("gender");
		String color = request.getParameter("skinColor");

		// 2. 배열 변환 확인용 출력
		
		
		
		String skinList = "";
		if(skinImprovement != null) { // 취미를 선택 했다면
			skinList = String.join(",", skinImprovement); // join 은 구분자로 배열을 나누어 하나의 문자열로 바꿔 리턴해준다.
		}
		
		String scalpList = "";
		if(scalpImprovement != null) { // 취미를 선택 했다면
			scalpList = String.join(",", scalpImprovement); // join 은 구분자로 배열을 나누어 하나의 문자열로 바꿔 리턴해준다.
		}
		
		String brandList = "";
		if(brand != null) { // 취미를 선택 했다면
			brandList = String.join(",", brand); // join 은 구분자로 배열을 나누어 하나의 문자열로 바꿔 리턴해준다.
		}
		
		
		Profile p = new Profile(userNo, skinType, bodyType, hairType, scalpType , skinList, scalpList, brandList, release, gender, color);
		
		System.out.println("userNo: " + userNo);
		System.out.println("skinType: " + skinType);
		System.out.println("bodyType: " + bodyType);
		System.out.println("hairType: " + hairType);
		System.out.println("scalpType: " + scalpType);
		System.out.println("skinList: " + skinList);
		System.out.println("scalpList: " + scalpList);
		System.out.println("brandList: " + brandList);
		System.out.println("release: " + release);
		System.out.println("gender: " + gender);
		System.out.println("color: " + color);
		
		int result = new ProfileService().updateProfile(p);
		
		if(result > 0) {
			HttpSession session = request.getSession();
			Member updateMem = new MemberService().selectMember(userNo);
			Member loginUser = (Member) session.getAttribute("loginUser");
			 if (updateMem != null) {
			        // **기존 세션 정보 유지하면서 필요한 정보만 업데이트**
			        loginUser.setSkinType(updateMem.getSkinType());
			        loginUser.setBodyType(updateMem.getBodyType());
			        loginUser.setScalpType(updateMem.getScalpType());
			        loginUser.setHairType(updateMem.getHairType());
			        loginUser.setSimList(updateMem.getSimList());
			        loginUser.setHimList(updateMem.getHimList());
			        loginUser.setBrandList(updateMem.getBrandList());
			        loginUser.setMarketingAgree(updateMem.getMarketingAgree());
			        loginUser.setColor(updateMem.getColor());
			session.setAttribute("alertMsg", "성공적으로 뷰티 프로필 수정완료.");
			session.setAttribute("loginUser", loginUser);
			response.sendRedirect(request.getContextPath() + "/myPage.me");
		} else {
			request.setAttribute("alertMsg", "뷰티 프로필 저장실패.");
			response.sendRedirect(request.getContextPath());
		}
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
