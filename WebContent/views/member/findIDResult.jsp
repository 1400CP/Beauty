<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Member m = (Member)request.getAttribute("findIDResult");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
    * {
      box-sizing: border-box;
      font-family: 'Pretendard', sans-serif;
    }

    body {
      margin: 0;
      padding: 0;
      background-color: #fff;
    }

    .wrapper {
      display: flex;
      justify-content: center;
      padding-top: 100px;
    }

    .container {
      width: 600px;
      text-align: center;
    }

    h2 {
      font-size: 32px;
      font-weight: bold;
      margin-bottom: 10px;
    }

    h4 {
      font-size: 16px;
      color: #666;
      margin-bottom: 40px;
    }

    .find-id-result {
      background-color: #f5f5f5;
      padding: 30px 20px;
      border-top: 1px solid #ccc;
      margin-bottom: 30px;
    }

    .find-id-result strong {
      font-size: 18px;
      color: #333;
    }

    .find-id-result .highlight {
      color: #ff7da9;
      font-weight: bold;
    }

    .desc {
      margin-top: 10px;
      font-size: 14px;
      color: #777;
    }

    .btn-go {
      background-color: #333;
      color: #fff;
      border: none;
      padding: 12px 24px;
      border-radius: 6px;
      font-size: 15px;
      cursor: pointer;
    }

    .btn-go:hover {
      background-color: #555;
    }
  </style>

</head>
<body>

<%@ include file="../common/header.jsp" %>

  <div class="wrapper">
    <div class="container">
      <h2>아이디 확인</h2>
      <h4>입력하신 정보와 일치하는 아이디는 다음과 같습니다.</h4>

      <div class="find-id-result">
        <strong><span><%= m.getUserName() %></span>님의 아이디는 <span class="highlight"><%= m.getUserId() %></span> 입니다.</strong>
        <div class="desc">
          '바로가기' 버튼을 누르면 로그인 페이지로 이동합니다.
        </div>
      </div>

      <button class="btn-go" onclick="location.href='<%= contextPath %>/loginForm.me'">바로가기</button>
    </div>
  </div>


</body>
</html>