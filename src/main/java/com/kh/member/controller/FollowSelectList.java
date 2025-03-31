package com.kh.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class FollowSelectList
 */
@WebServlet("/followselectlist.me")
public class FollowSelectList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FollowSelectList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("application/json; charset=UTF-8");
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		System.out.println(userNo);
		ArrayList<Member> followList = new MemberService().selectListFollow(userNo);
		ArrayList<Member> followerList = new MemberService().selectListFollower(userNo);
		response.setContentType("application/json; charset=utf-8");
		response.setContentType("application/json; charset=utf-8");
		Gson gson = new Gson();

		// JsonObject 생성 후 리스트 추가
		JsonObject jsonResponse = new JsonObject();
		jsonResponse.add("followList", gson.toJsonTree(followList));
		jsonResponse.add("followerList", gson.toJsonTree(followerList));

		// JSON 데이터를 response로 출력
		response.getWriter().write(gson.toJson(jsonResponse));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
