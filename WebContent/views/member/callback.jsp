<%@ page import="java.io.*, java.net.*, javax.servlet.http.*, java.net.URLEncoder, org.json.simple.JSONObject, org.json.simple.parser.JSONParser" %>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<%
	String contextPath = request.getContextPath();
    String code = request.getParameter("code");
    String state = (String)session.getAttribute("state");
    String sessionState = (String) session.getAttribute("state");
    String error = request.getParameter("error");
    String error_description = request.getParameter("error_description");


    if (error != null) {
        response.sendRedirect("/beautyTalk/views/member/errorPage.jsp?msg=" + URLEncoder.encode("네이버 로그인 실패: " + error_description, "UTF-8"));
        return;
    } else if (code == null || state == null) {
        response.sendRedirect("/beautyTalk/views/member/errorPage.jsp?msg=" + URLEncoder.encode("code 또는 state 값이 없습니다.", "UTF-8"));
        return;
    } else if (!state.equals(sessionState)) {
        response.sendRedirect("/beautyTalk/views/member/errorPage.jsp?msg=" + URLEncoder.encode("CSRF 공격 의심 - state 값 불일치!", "UTF-8"));
        return;
    }

    // ✅ 네이버 API 요청 정보 설정
    String clientId = "6VzT269VW306H2aC74fu";  
    String clientSecret = "sBziVAj0Of";  
    String redirectURI = URLEncoder.encode("http://192.168.20.44:8123/beautyTalk/views/member/callback.jsp", "UTF-8");

    // ✅ 1. Access Token 요청
    String tokenUrl = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code"
                    + "&client_id=" + clientId
                    + "&client_secret=" + clientSecret
                    + "&code=" + code
                    + "&state=" + state;

    URL url = new URL(tokenUrl);
    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
    conn.setRequestMethod("GET");

    BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
    StringBuilder tokenResponse = new StringBuilder();
    String inputLine;
    while ((inputLine = br.readLine()) != null) {
        tokenResponse.append(inputLine);
    }
    br.close();

    // ✅ 2. Access Token 추출
    JSONParser parser = new JSONParser();
    JSONObject jsonObject = (JSONObject) parser.parse(tokenResponse.toString());
    String accessToken = (String) jsonObject.get("access_token");


    if (accessToken == null) {
        response.sendRedirect("/beautyTalk/views/member/errorPage.jsp?msg=" + URLEncoder.encode("Access Token을 가져오지 못했습니다.", "UTF-8"));
        return;
    }

    // ✅ 네이버 API에서 사용자 정보 가져오기
    String apiURL = "https://openapi.naver.com/v1/nid/me";
    URL userInfoUrl = new URL(apiURL);
    HttpURLConnection userInfoConn = (HttpURLConnection) userInfoUrl.openConnection();
    userInfoConn.setRequestMethod("POST");
    userInfoConn.setRequestProperty("Authorization", "Bearer " + accessToken);

    BufferedReader userInfoBr = new BufferedReader(new InputStreamReader(userInfoConn.getInputStream()));
    StringBuilder userInfoResponse = new StringBuilder();
    while ((inputLine = userInfoBr.readLine()) != null) {
        userInfoResponse.append(inputLine);
    }
    userInfoBr.close();

    // ✅ 사용자 정보 JSON 파싱
    JSONObject userInfoJson = (JSONObject) parser.parse(userInfoResponse.toString());
    JSONObject responseObj = (JSONObject) userInfoJson.get("response");
    

    // ✅ 네이버에서 받은 데이터 출력 (디버깅용)

    // ✅ 필요한 정보만 세션에 저장
    String birthday = (String) responseObj.get("birthday");

    // ✅ "-"(하이픈) 제거 (예: "0812")
    birthday = (birthday != null) ? birthday.replace("-", "") : "";
    
    String mobile = (String) responseObj.get("mobile");

    // ✅ "-"(하이픈) 제거 (예: "01099596587")
    mobile = (mobile != null) ? mobile.replace("-", "") : "";
    
    String naverId = (String) responseObj.get("id");




    // ✅ 변환된 생일 값을 세션에 저장
    session.setAttribute("birthday", birthday);
    session.setAttribute("naverId", naverId);
    session.setAttribute("name", (String) responseObj.get("name"));
    session.setAttribute("email", (String) responseObj.get("email"));
    session.setAttribute("gender", (String) responseObj.get("gender"));
    session.setAttribute("birthyear", (String) responseObj.get("birthyear"));
    session.setAttribute("mobile", mobile);


    // ✅ 로그인 페이지로 이동
    response.sendRedirect(request.getContextPath() + "/NaverCheckUser.me");
    session.removeAttribute("state");
%>
