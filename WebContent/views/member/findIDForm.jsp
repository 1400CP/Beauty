<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    align-items: flex-start; /* 중앙 아닌 위쪽 정렬 */
    padding-top: 120px; /* 상단 여백만 부여 */
    min-height: calc(100vh - 100px); /* 최소 높이 지정 */
    }
  
    .container {
      width: 400px;
      padding: 40px 20px;
      text-align: center;
    }
  
    h2 {
      margin-bottom: 40px;
      font-size: 24px;
      font-weight: bold;
    }
  
    input[type="text"],
    input[type="email"] {
      width: 100%;
      padding: 16px;
      margin-bottom: 18px;
      border: 1px solid #ddd;
      border-radius: 25px;
      font-size: 15px;
      transition: border-color 0.3s;
    }
  
    input:focus {
      border-color: #ff7da9;
      outline: none;
    }
  
    button {
      width: 100%;
      padding: 16px;
      border: none;
      border-radius: 12px;
      background-color: #ff7da9; /* 부드러운 분홍 */
      color: white;
      font-size: 16px;
      font-weight: 600;
      cursor: pointer;
      transition: background-color 0.3s;
    }
  
    button:hover {
      background-color: #ff6297;
    }
  </style>
</head>
<body>

	<%@ include file="../common/header.jsp" %>
	
	<div class="wrapper">
	  <div class="container">
	    <form action="<%= contextPath %>/findID.me">
	      <h2>아이디 찾기</h2>
	      <input type="text" name="userName" placeholder="이름을 입력하세요. ex) 홍길동" required>
	      <input type="email" name="email" placeholder="이메일을 입력하세요. ex) honggd@naver.com" required>
	      <input type="text" name="phone" placeholder="전화번호를 입력하세요. ex) 01012345678" required>
	      <button type="submit">확인</button>
	    </form>
	  </div>
	</div>
	

</body>
</html>