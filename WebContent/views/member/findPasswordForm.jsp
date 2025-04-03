<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
  align-items: flex-start;
  padding-top: 100px;
  min-height: calc(100vh - 100px);
}

.container {
  width: 380px;
  padding: 30px 20px;
  text-align: center;
}

h2 {
  margin-bottom: 30px;
  font-size: 22px;
  font-weight: bold;
}

/* 공통 input 스타일 */
input[type="text"],
input[type="email"] {
  width: 100%;
  padding: 12px 16px;
  margin-bottom: 15px;
  border: 1px solid #ddd;
  border-radius: 25px;
  font-size: 14px;
  transition: border-color 0.3s;
}

input:focus {
  border-color: #ff7da9;
  outline: none;
}

/* 공통 버튼 스타일 */
button {
  width: 100%;
  padding: 13px;
  border: none;
  border-radius: 12px;
  background-color: #ff7da9;
  color: white;
  font-size: 15px;
  font-weight: 600;
  cursor: pointer;
  transition: background-color 0.3s;
}

button:hover {
  background-color: #ff6297;
}

.code-wrapper {
  display: flex;
  align-items: stretch; /* ✅ input, button 높이 강제 일치 */
  gap: 10px;
  margin-top: 30px;
}

.code-wrapper input {
  flex: 2;
  height: 42px;
  padding: 0 14px;
  font-size: 14px;
  border: 1px solid #ddd;
  border-radius: 20px;
  box-sizing: border-box;
}

/* 👇 여기서 핵심은 display: inline-block + line-height 설정 */
.code-wrapper button {
  flex: 1;
  height: 42px;
  line-height: 42px;
  padding: 0;
  font-size: 14px;
  font-weight: 600;
  border-radius: 20px;
  background-color: #ff7da9;
  color: white;
  border: none;
  cursor: pointer;
  text-align: center;
  box-sizing: border-box;
  transition: background-color 0.3s;
}

.code-wrapper button:hover {
  background-color: #ff6297;
}

.spinner {
  width: 16px;
  height: 16px;
  border: 3px solid #fff;
  border-top: 3px solid #ff6297;
  border-radius: 50%;
  display: inline-block;
  animation: spin 0.8s linear infinite;
  margin-left: 8px;
  vertical-align: middle;
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

.loader {
  width: 22px;
  height: 22px;
  border: 3px solid #ccc;
  border-top: 3px solid #ff7da9;
  border-radius: 50%;
  animation: spin 1s linear infinite;
  display: inline-block;
  vertical-align: middle;
}


	
  </style>
</head>
<body>

	<%@ include file="../common/header.jsp" %>
	
	<div class="wrapper">
	  <div class="container">
	    <h2>비밀번호 찾기</h2>
	    
	    <input type="text" name="userId" id="userId" placeholder="아이디를 입력하세요. ex) gildong123" required>
	    <input type="text" name="userName" id="userName" placeholder="이름을 입력하세요. ex) 홍길동" required>
	    <input type="email" id="email" placeholder="이메일을 입력하세요. ex) honggd@naver.com" required>
	    
	    <button id="sendCodeBtn">
		  <span class="btn-text">인증코드 보내기</span>
		  <span class="spinner" style="display:none;"></span>
		</button>

	    
	    <div id="codeSection" style="display: none; margin-top: 20px;">
		  <div class="code-wrapper">
		    <input type="text" id="authCodeInput" placeholder="인증코드 입력" required>
		    <button id="verifyCodeBtn">확인</button>
		  </div>
		  <p id="timer" style="color: #ff4d4d; font-weight: bold; font-size: 16px; margin-top: 10px;"></p>
		</div>
	    <div id="result"></div>
	  </div>
	</div>

	
	<script>
	let timerInterval; // 타이머를 저장할 변수

	function startTimer(duration) {
	    clearInterval(timerInterval); // 이전 타이머 제거
	    let timeLeft = duration;

	    $('#timer').text(formatTime(timeLeft));
	    $('#verifyCodeBtn').prop('disabled', false);
	    $('#authCodeInput').prop('disabled', false);

	    timerInterval = setInterval(() => {
	        timeLeft--;

	        if (timeLeft <= 0) {
	            clearInterval(timerInterval);
	            $('#timer').text('⛔ 인증시간이 만료되었습니다.');
	            $('#verifyCodeBtn').prop('disabled', true);
	            $('#authCodeInput').prop('disabled', true);
	        } else {
	            $('#timer').text(formatTime(timeLeft));
	        }
	    }, 1000);
	}

	function formatTime(seconds) {
	    const m = String(Math.floor(seconds / 60)).padStart(2, '0');
	    const s = String(seconds % 60).padStart(2, '0');
	    return "⏳ 남은 시간: " + m + ":" + s;
	    
	}

	function sendVerificationCode(email, name, userId) {
	    const $btn = $('#sendCodeBtn');
	    const $btnText = $btn.find('.btn-text');
	    const $spinner = $btn.find('.spinner');

	    $btn.prop('disabled', true);
	    $btnText.text('전송 중...');
	    $spinner.show();

	    $.ajax({
	        url: '${pageContext.request.contextPath}/sendEmailAjax.me',
	        method: 'POST',
	        data: {
	            email: email,
	            name: name,
	            userId: userId
	        },
	        success: function(response) {
	            if (response.success) {
	                $('#result').text('인증코드가 이메일로 전송되었습니다.');
	                $('#codeSection').show();
	                startTimer(180);
	            } else {
	                $('#result').text('이메일 전송에 실패했습니다.');
	            }
	        },
	        error: function () {
	            $('#result').text('서버 오류가 발생했습니다.');
	        },
	        complete: function () {
	            $btn.prop('disabled', false);
	            $btnText.text('인증코드 보내기');
	            $spinner.hide();
	        }
	    });
	}
	
	$('#sendCodeBtn').on('click', function () {
	    const name = $('#userName').val();
	    const userId = $('#userId').val();
	    const email = $('#email').val();

	    // 회원 유효성 검증
	    $.ajax({
	        url: '${pageContext.request.contextPath}/checkUserAjax.me',
	        method: 'POST',
	        data: {
	            name: name,
	            userId: userId,
	            email: email
	        },
	        success: function(response) {
	            if (response.exists) {
	                // ✅ 유효한 회원이면 인증코드 전송
	                sendVerificationCode(email, name, userId);
	            } else {
	                alert("일치하는 회원 정보가 없습니다.");
	                $('#userName, #userId, #email').val("");
	            }
	        },
	        error: function() {
	            alert("서버 오류가 발생했습니다.");
	        }
	    });
	});


       
        $('#verifyCodeBtn').on('click', function() {
            const inputCode = $('#authCodeInput').val();

            $.ajax({
                url: '${pageContext.request.contextPath}/verifyCodeAjax.me',
                method: 'POST',
                data: { code: inputCode },
                success: function(response) {
                    if (response.valid) {
                    	$('#result').html('<span class="loader"></span><br>인증 성공!\n비밀번호 재설정 페이지로 이동 중...');
                    	$('#verifyCodeBtn').prop('disabled', true).text("이동 중...");
                        setTimeout(() => {
                        	window.location.href = '${pageContext.request.contextPath}/resetPasswordForm.me';
                        }, 2000);
                    } else {
                        $('#result').text('인증코드가 올바르지 않습니다.');
                    }
                }
            });
        });
    </script>
	

</body>
</html>