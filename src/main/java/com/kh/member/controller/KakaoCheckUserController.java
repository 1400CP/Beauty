package com.kh.member.controller;

import java.io.BufferedReader;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;
import com.kh.profile.controller.model.service.ProfileService;
import com.kh.profile.controller.model.vo.Profile;

/**
 * Servlet implementation class KakaoCheckUserController
 */
@WebServlet("/kakaoCheckUser.me")
public class KakaoCheckUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KakaoCheckUserController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("application/json");

        // JSON 데이터 읽기
        BufferedReader reader = request.getReader();
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        reader.close();

        // JSON 파싱
        try {
            JSONParser parser = new JSONParser();
            JSONObject json = (JSONObject) parser.parse(sb.toString()); 

            String kakaoId = (String) json.get("kakaoId");
            HttpSession session = request.getSession();
            session.setAttribute("kakaoAccessToken", kakaoId);
            
            int result = new MemberService().kakaoCheckUser(kakaoId);
            
            boolean userExists = false;
            Member loginUser = null;
            if(result > 0) {
            	userExists = true;
            	loginUser = new MemberService().kakaoLoginMember(kakaoId);
            }
            
            // JSON 응답
            JSONObject jsonResponse = new JSONObject();
            jsonResponse.put("exists", userExists);
            
            request.getSession().setAttribute("loginUser", loginUser);
            if(userExists) {

            }
            response.getWriter().write(jsonResponse.toJSONString());

        } catch (ParseException e) {
            e.printStackTrace();
            response.getWriter().write("{\"success\": false, \"message\": \"JSON 파싱 실패\"}");
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
