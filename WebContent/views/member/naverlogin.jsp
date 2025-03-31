<%@page import="java.util.UUID"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>네이버 로그인</title>
  </head>
  <body>
    <h1>네이버 로그인</h1>
<%
String clientId = "6VzT269VW306H2aC74fu";
String redirectURI = "http://localhost:8123/beautyTalk/views/member/callback.jsp";
String encodedRedirectURI = URLEncoder.encode(redirectURI, "UTF-8");

// ✅ state 값을 세션에 저장
String state = UUID.randomUUID().toString();
session.setAttribute("state", state);

// ✅ 네이버 로그인 요청 URL 생성
String naverLoginURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code"
               + "&client_id=" + clientId
               + "&redirect_uri=" + encodedRedirectURI
               + "&state=" + state
               + "&scope=name,email,nickname,profile_image,gender,birthday,age,birthyear,mobile"; 
%>

  </body>
</html>
