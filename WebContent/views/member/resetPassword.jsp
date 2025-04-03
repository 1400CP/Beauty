<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<style>
  body {
    font-family: 'Pretendard', sans-serif;
    background-color: #fff;
    text-align: center;
  }

  .container {
    width: 360px;
    margin: auto;
  }

  h2 {
    margin-bottom: 30px;
  }

  input[type="password"] {
    width: 100%;
    padding: 14px;
    margin-bottom: 15px;
    border-radius: 25px;
    border: 1px solid #ddd;
    font-size: 14px;
  }

  button {
    width: 100%;
    padding: 14px;
    background-color: #ff7da9;
    color: white;
    font-size: 16px;
    font-weight: bold;
    border: none;
    border-radius: 25px;
    cursor: pointer;
  }

  button:hover {
    background-color: #ff6297;
  }

  #msg {
    margin-top: 15px;
    color: red;
    font-size: 13px;
  }
</style>
</head>
<body>

<%@ include file="../common/header.jsp" %>

<br><br><br><br><br>

  <div class="container">
    <h2>비밀번호 재설정</h2>
    <form id="resetForm" action="${pageContext.request.contextPath}/resetPassword.me" method="post">
	  <input type="password" id="newPassword" name="newPassword" placeholder="새 비밀번호" required>
	  <input type="password" id="confirmPassword" name="confirmPassword" placeholder="비밀번호 확인" required>
	  <div id="pwCheckMsg" style="font-size:13px; margin-bottom: 10px;"></div>
	  <button type="submit">비밀번호 변경</button>
	</form>
    <div id="msg">${msg != null ? msg : ""}</div>
  </div>
  
  <script>
	  $('#confirmPassword').on('input', function () {
	    const pw = $('#newPassword').val();
	    const confirm = $(this).val();
	    const $msg = $('#pwCheckMsg');
	
	    if (confirm.length === 0) {
	      $msg.text('').css('color', '');
	      return;
	    }
	
	    if (pw === confirm) {
	      $msg.text('✅ 비밀번호가 일치합니다.').css('color', 'green');
	    } else {
	      $msg.text('❌ 비밀번호가 일치하지 않습니다.').css('color', 'red');
	    }
	  });
	  
	  $('#resetForm').on('submit', function (e) {
		  const pw = $('#newPassword').val();
		  const confirm = $('#confirmPassword').val();

		  if (pw !== confirm) {
		    e.preventDefault();
		    alert("비밀번호가 일치하지 않습니다!");
		    $('#confirmPassword').val('');
		  }
		});

	</script>
  
</body>
</html>
