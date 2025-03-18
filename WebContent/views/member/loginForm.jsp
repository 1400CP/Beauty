<%@page import="java.util.UUID"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
.outer {
	width: 100%;
	height: 100%;
	margin: auto;
	background-color: #fff;
	border-radius: 10px;
	text-align: center;
	display: block;
}

h2 {
	margin: auto;
}

input[type="text"], input[type="password"] {
	width: 100%;
	padding: 12px;
	margin: 8px 0;
	border: 1px solid #ddd;
	border-radius: 30px;
	font-size: 13px;
	box-sizing: border-box;
}

.btn {
	width: 100%;
	padding: 12px;
	margin: 8px 0;
	border: none;
	border-radius: 30px;
	font-size: 16px;
	cursor: pointer;
	display: flex;
	align-items: center;
	justify-content: center;
}

#naver_id_login a {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 100%; /* 원하는 가로 크기 */
	height: 50px; /* 고정된 세로 크기 */
	margin: 8px 0;
	margin-top: 35px; /* 위아래 여백 */
	border: none; /* 테두리 없음 */
	border-radius: 30px; /* 둥근 모서리 */
	font-size: 16px; /* 글자 크기 */
	cursor: pointer; /* 마우스 포인터 변경 */
	background-color: #1ec800; /* 버튼 배경색 */
	color: white; /* 글자 색상 */
	text-decoration: none; /* 링크 스타일 제거 */
}

.btn-login {
	background-color: #000;
	color: white;
}

.btn-kakao {
	background-color: #FEE500;
	color: black;
}

.btn-insta {
	background-color: #03c75a;
	color: white;
}

.btn img {
	width: 18px;
	height: 18px;
	margin-right: 10px;
}

.error-message {
	color: red;
	font-size: 12px;
	display: none;
}

#login-etc a {
	text-decoration: none;
	color: black;
}

.inner {
	height: 2000px;
	width: 500px;
	margin: auto;
	margin-top: 50px;
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
</head>
<body>
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
	<%@ include file="../common/header.jsp"%>

	<br>
	<br>
	<br>
	<br>
	<br>


	<div class="outer">
		<div class="inner">
			<h2>로그인</h2>

			<form action="<%= contextPath %>/login.me" id="login-form"
				method="post">
				<input type="text" name="userId" id="userId" minlength="6"
					maxlength="15" placeholder="아이디를 입력하세요. (6자 이상 15자 이내)" required>
				<div class="error-message" id="userIdError">아이디는 최소 6자 이상 입력해야
					합니다.</div>

				<input type="password" name="userPwd" id="userPwd" minlength="8"
					maxlength="16" placeholder="비밀번호를 입력하세요. (8~16자, 영문+숫자+특수문자)"
					required>
				<div class="error-message" id="userPwdError">비밀번호는 최소 8자 이상
					입력해야 합니다.</div>

				<div style="text-align: left; margin-top: 10px;">
					<input type="checkbox" name="rememId" id="rememId"> <label
						for="rememId">아이디 저장</label>
				</div>

				<button type="submit" class="btn btn-login">로그인</button>
			</form>

			<br>
			<button type="button" class="btn btn-kakao" onclick="kakaoLogin()">
				<img src="/beautyTalk/resources/images/kakao.png" alt="Kakao">
				카카오톡 로그인
			</button>


			<div id="naver_id_login"></div>



			<button id="naverLoginBtn"
				style="width: 100%; height: 45px; background-color: #03C75A; color: white; font-size: 18px; font-weight: bold; border: none; border-radius: 30px; display: flex; align-items: center; justify-content: center; gap: 12px; cursor: pointer; box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);">
				<img src="/beautyTalk/resources/images/naver.jpg" alt="네이버 로고"
					width="24" height="24"> 네이버 로그인
			</button>



			<br>

			<div id="login-etc">
				<a href="">아이디 찾기</a> <span>|</span> <a href="">비밀번호 찾기</a> <span>|</span>
				<a href="">회원가입</a>
			</div>
		</div>
	</div>

	<script>
        $(document).ready(function() {
            // 저장된 아이디가 있으면 자동 입력
            let savedUserId = localStorage.getItem("savedUserId");
            if (savedUserId) {
                $("#userId").val(savedUserId);
                $("#rememId").prop("checked", true);
            }

            // 로그인 폼 제출 이벤트
            $("#login-form").submit(function(event) {
                let userId = $("#userId").val();
                let userPwd = $("#userPwd").val();
                let isValid = true;

                // 아이디 최소 길이 확인
                if (userId.length < 6) {
                    $("#userIdError").show();
                    isValid = false;
                } else {
                    $("#userIdError").hide();
                }

                // 비밀번호 최소 길이 확인
                if (userPwd.length < 8) {
                    $("#userPwdError").show();
                    isValid = false;
                } else {
                    $("#userPwdError").hide();
                }

                // 최소 길이를 충족하지 않으면 제출 방지
                if (!isValid) {
                    event.preventDefault();
                } else {
                    // 아이디 저장 여부 확인
                    if ($("#rememId").is(":checked")) {
                        localStorage.setItem("savedUserId", userId); // 아이디 저장
                    } else {
                        localStorage.removeItem("savedUserId"); // 저장된 아이디 삭제
                    }
                }
            });
        });
    </script>

	<script>
	    // 카카오 SDK 초기화
	    Kakao.init('59fed56fbad84e6ce2251947508fca03'); // ★ 여기에 본인의 카카오 앱 키 입력 ★
	    
	    function kakaoLogin() {
	        Kakao.Auth.login({
	            success: function(authObj) {
	                console.log("로그인 성공:", authObj);
	
	                // 로그인 성공 시 사용자 정보 가져오기
	                Kakao.API.request({
	                    url: '/v2/user/me',
	                    success: function(res) {
	                        console.log("사용자 정보:", res);
	                        
	                        const kakaoEmail = res.kakao_account.email; // 카카오 email
	                        const kakaoNickname = res.kakao_account.profile.nickname; // 카카오 닉네임
	                        
	                        $.ajax({
	                            type: "POST",
	                            url: "<%= contextPath %>/kakaoCheckUser.me", // 백엔드 API
	                            data: JSON.stringify({ email: kakaoEmail }),
	                            contentType: "application/json",
	                            success: function(response) {
	                                if (response.exists) {
	                                    // 기존 사용자 → 메인 페이지로 이동
	                                    alert("카카오 로그인 성공!\n" + res.kakao_account.profile.nickname + "님 환영합니다~");
	                                    window.location.href = "<%= contextPath %>";
	                                } else {
	                                    // 신규 사용자 → 회원가입(추가 정보 입력) 페이지로 이동
	                                    alert("회원가입 페이지로 이동합니다.")
	                                    window.location.href = "<%= contextPath %>/enrollForm.me?email=" + encodeURIComponent(kakaoEmail) + "&nickname=" + encodeURIComponent(kakaoNickname);
	                                }
	                            },
	                            error: function(error) {
	                                console.error("사용자 정보 가져오기 실패:", error);
	                            }
	                        });
	                    },
	                    fail: function(error) {
	                        console.error("사용자 정보 가져오기 실패:", error);
	                    }
	                });
	            },
	            fail: function(err) {
	                console.error("로그인 실패:", err);
	                alert("카카오 로그인에 실패하였습니다.");
	            }
	        });
	    }
	</script>


	<script type="text/javascript">
    var naverLogin = new naver_id_login("<%= clientId %>", "<%= redirectURI %>");
    var state = "<%= state %>";

    // ✅ 네이버 로그인 초기화 (필수)
    naverLogin.setState(state);
    naverLogin.init_naver_id_login();

    // ✅ 네이버에서 자동 생성하는 버튼 숨기기
    document.getElementById("naver_id_login").style.display = "none";

    // ✅ JSP에서 JavaScript로 안전하게 URL 전달
    var loginURL = "<%= naverLoginURL.replace("&", "&amp;") %>";  // '&' 문제 해결

    // ✅ 콘솔에서 URL 확인 (디버깅용)
    console.log("🔵 네이버 로그인 URL: ", loginURL);

    // ✅ 사용자가 버튼 클릭 시 로그인 실행 (자동 실행 제거)
    document.getElementById("naverLoginBtn").addEventListener("click", function() {
        location.href = loginURL;
    });
</script>



</body>
</html>
