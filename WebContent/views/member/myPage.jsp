<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
</head>
<style>
#Content1 {
	height: auto;
	width: 100%;
	min-width: 1200px;
	margin: auto;
	margin-top: 50px;
}

#Content2 {
	width: 1200px;
	overflow: hidden;
	margin: 0 auto;
}

#Content3 {
	width: 1200px;
	overflow: hidden;
	margin: auto;
}

#Content3 table {
	height: auto;
	width: 350px;
	margin-bottom: 50px;
}

#Content3 div {
	float: left;
	text-align: center;
}

#Content4 {
	width: 1200px;
	overflow: hidden;
	margin: auto;
	display: flex;
}

#Content5 {
	width: 350px;
	border: 1px solid #ddd;
	margin-right: 50px;
}

#Content6 {
	width: 670px;
}

#userImg {
	height: 70px;
	width: 70px
}

#userprofile {
	border-radius: 100%;
	height: 100%;
	width: 100%;
}

#Content2 div {
	float: left;
	margin: auto;
	margin: 10px;
}

#userName * {
	margin: 0;
}

table td {
	text-align: center;
}

a {
	text-decoration: none;
	color: black;
	text-decoration: none;
	font-size: 15px;
	font-weight: 600;
}

a:hover {
	color: #e8618c;
}

#userInfo tr {
	float: left;
}

#userBoard {
	display: flex;
	text-align: left;
	gap: 33px;
	position: relative;
	border-bottom: 2px solid #ddd;
	padding-bottom: 5px;
	margin-left: 20px;
	margin-bottom: 30px;
}

#myPageTitle {
	margin-left: 20px;
}

#Title {
	color: #e8618c;
	font-size: x-large;
	margin: 0;
}

.tab {
	font-size: 16px;
	font-weight: bold;
	color: #5e5858;
	padding: 10px;
	cursor: pointer;
	position: relative;
	transition: color 0.3s ease-in-out;
}

.tab.active {
	color: #e8618c;
}

.underline {
	position: absolute;
	bottom: -2px;
	height: 3px;
	background-color: #e8618c;
	transition: all 0.3s ease-in-out;
}

.material-icons {
	display: inline;
	display: flex;
	align-items: center;
	font-weight: 600;
}

pre {
	text-decoration: underline;
	color: #e8618c;
	text-decoration-thickness: 3px;
	font-size: xx-small;
}

input[type="text"], input[type="password"] {
	width: 450px;
	padding: 12px;
	margin: 0;
	border: 1px solid #ddd;
	border-radius: 7px;
	font-size: 13px;
	box-sizing: border-box;
}

.check {
	background-color: #e8618c;
	color: white;
	width: 80px;
	height: 40px;
	border-radius: 7px;
	border: none;
	cursor: pointer; /* 🔥 마우스 커서를 손가락 모양으로 변경 */
	pointer-events: auto;
	font-size: 13px;
	font-weight: 600;
	transition: all 0.2s ease-in-out;
	box-shadow: 3px 3px 5px #e8618c(0, 0, 0, 0.2);
}

.check:hover {
	background-color: #d9507a;
	box-shadow: 3px 3px 5px #e8618c(0, 0, 0, 0.2);
}

/* 클릭 시 버튼이 살짝 눌리는 효과 */
.check:active {
	transform: scale(0.95);
	box-shadow: 1px 1px 3px #e8618c(0, 0, 0, 0.2);
}

.btn-insta-insert {
	background-color: #e8618c;
	color: white;
	width: 150px;
	height: 40px;
	margin-top: 20px;
	border-radius: 7px;
	border: none;
	cursor: pointer; /* 🔥 마우스 커서를 손가락 모양으로 변경 */
	pointer-events: auto;
	font-size: 13px;
	font-weight: 600;
	transition: all 0.2s ease-in-out;
	box-shadow: 3px 3px 5px #e8618c(0, 0, 0, 0.2);
}

/* 호버 시 */
.btn-insta-insert:hover {
	background-color: #d9507a;
	box-shadow: 3px 3px 5px #e8618c(0, 0, 0, 0.2);
}

/* 클릭 시 */
.btn-insta-insert:active {
	transform: scale(0.95);
	box-shadow: 1px 1px 3px #e8618c(0, 0, 0, 0.2);
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

#insert-form :nth-child(4) {
	margin-top: 20px;
}

#insert-form :nth-child(7) {
	margin-top: 20px;
}

#Content5>* {
	margin: 7px;
}

#update {
	margin-top: 50px;
	align-content: center;
}

#openModal {
	display: inline-block;
	text-decoration: none;
	color: black;
	text-decoration: none;
	font-size: 15px;
	font-weight: 600;
	text-decoration: none;
	cursor: pointer;
}

#openModal:hover {
	color: #e8618c;
}

.modal {
	display: none;
	position: fixed;
	z-index: 1000;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
}

/* 모달 박스 */
.modal-content {
	background: white;
	padding: 90px; /* 좌우 여백을 충분히 줌 */
	box-sizing: border-box; /* padding 포함한 크기 유지 */
	height: 600px;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	border: 4px solid #5aa1f2; /* 파란색 테두리 추가 */
}

/* 입력 폼 스타일 */
.modal-content input[id="password"] {
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 16px;
}

.modal-content input[id="userPwd"] {
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 16px;
}

/* 버튼 스타일 */
.modal-content .delete-btn {
	background: #ff5f98;
	color: white;
	border: none;
	padding: 12px 20px;
	border-radius: 5px;
	font-weight: bold;
	cursor: pointer;
	display: block;
	margin: 20px auto 0;
	text-align: center;
	width: 200px;
}

.modal-content .delete-btn:hover {
	background: #e8618c;
}

/* 닫기 버튼 (X) */
.close-btn {
	position: absolute;
	top: 15px;
	right: 20px;
	font-size: 25px;
	font-weight: bold;
	cursor: pointer;
}

.close-btn:hover {
	color: red;
}

.password-container {
	display: flex;
	align-items: center; /* 세로 정렬 */
	gap: 10px; /* 라벨과 입력 필드 사이 간격 */
}

.userId-container {
	display: flex;
	align-items: center; /* 세로 정렬 */
	gap: 26px; /* 라벨과 입력 필드 사이 간격 */
}

.password-container label {
	white-space: nowrap; /* 라벨 줄바꿈 방지 */
}

.password-container input {
	flex: 1; /* 입력 필드가 남은 공간을 차지 */
	max-width: 500px; /* 원하는 너비 설정 */
}

.userId-container label {
	white-space: nowrap; /* 라벨 줄바꿈 방지 */
}

.userId-container input {
	flex: 1; /* 입력 필드가 남은 공간을 차지 */
	max-width: 500px; /* 원하는 너비 설정 */
}

table {
	width: 100%;
	table-layout: fixed; /* 테이블 셀 너비를 균등하게 */
}

button {
	border-style: none;
}
</style>
<body>
	<%@ include file="../common/header.jsp"%>
	<br>

	<div id="Content1">
		<div id="Content2">
			<div id="userImg">
				<img id="userprofile"
					src="<%= contextPath %>/resources/userImage/변우석.jpg" alt="유저이미지">
			</div>
			<div id="userName">
				<h2><%= loginUser.getUserName() %></h2>
				<span style="font-size: x-small;"><%= loginUser.getUserId() %></span>
			</div>
		</div>
		<div id="Content3">
			<table>
				<tr>
					<td><a href="" style="font-weight: 800; font-size: larger;">게시글
							<br><%= loginUser.getPost() %></a> <br></td>
					<td><a href="" style="font-weight: 800; font-size: larger;">리뷰
							<br><%= loginUser.getReview() %><br>
					</a></td>
					<td><a href="" style="font-weight: 800; font-size: larger;">팔로우
							<br><%= loginUser.getFollower() %><br>
					</a></td>
					<td><a href="" style="font-weight: 800; font-size: larger;">팔로잉
							<br><%= loginUser.getFollowing() %><br>
					</a></td>
				</tr>
			</table>
			<div id="userBoard">
				<div class="tab">post</div>
				<div class="tab">Review</div>
				<div class="tab">Beauty Profile</div>
				<div class="underline"></div>
			</div>

		</div>
		<div id="Content4">
			<div id="Content5">
				<div>
					<span class="material-icons" style="font-size: 30px;">person<a
						href="<%= contextPath %>/myPage.me" " style="font-size: 25px;">마이페이지</a></span>
				</div>

				<div></div>
				<div>
					<h2>내정보</h2>
				</div>
				<div>
					<a href="">회원정보 수정</a>
				</div>
				<div>
					<a href="#" id="openModal">회원탈퇴</a>
				</div>
				<div>
					<a href="">왓츠인 마이백</a>
				</div>
				<div>
					<a href="<%= contextPath %>/calendarMainpage.ca">뷰티캘린더</a>
				</div>
				<div>
					<a href="">알림내역</a>
				</div>
				<div>
					<a href=" "></a>
				</div>
				<br>
				<div>
					<h2>문의 / 공지사항</h2>
				</div>
				<div>
					<a href="">문의 내역</a>
				</div>
				<div>
					<a href="">1:1 문의하기</a>
				</div>
				<div>
					<a href="">공지사항</a>
				</div>
				<br>
				<div>
					<h2>댓글</h2>
				</div>
				<div>
					<a href="">댓글 내역</a>
				</div>
				<br>
				<div>
					<h2>신고내역</h2>
				</div>
				<div>
					<a href="">신고내역</a>
				</div>
			</div>
			<div id="Content6">
				<div id="myPageTitle">
					<h2 id="Title">회원정보</h2>
				</div>
				<div id="line">
					<pre align="left">                                                                                                                                     </pre>
				</div>
				<div id="update">
					<form action="<%= contextPath %>/update.me" id="insert-form"
						method="post">
						<input type="hidden" name=userNo id="userNo" maxlength="16"
							value="<%= loginUser.getUserNo() %>">
						<table>
							<tr>
								<td style="text-align: left;" width="110">아이디</td>
								<td width="450"><input type="text" name="userId"
									id="userId" minlength="6" maxlength="15"
									placeholder="아이디를 입력하세요. (6자 이상 15자 이내)" required
									value="<%= loginUser.getUserId() %>"></td>
								<td><button class="check" type="button" onclick="idCheck()">중복확인</button></td>
							</tr>
							<tr>
								<td style="text-align: left;">비밀번호</td>
								<td><input type="text" name="userPwd" id="userPwd"
									maxlength="16" placeholder="이름을 입력하세요." required
									value="<%= loginUser.getUserPwd() %>"></td>
								<td></td>
							</tr>
							<tr>
								<td style="text-align: left;">이름</td>
								<td><input type="text" name="userName" id="userName"
									minlength="8" maxlength="20" placeholder="이메일을 입력하세요." required
									value="<%= loginUser.getUserName() %>"></td>
								<td></td>
							</tr>
							<tr>
								<td style="text-align: left;">이메일</td>
								<td><input type="text" name="email" id="email"
									minlength="6" maxlength="15"
									placeholder="아이디를 입력하세요. (6자 이상 15자 이내)" required
									value="<%= loginUser.getEmail() %>"></td>
								<td></td>
							</tr>
							<tr>
								<td style="text-align: left;">닉네임</td>
								<td><input type="text" name="nickName" id="nickName"
									minlength="2" maxlength="10" placeholder="닉네임을 입력하세요" required
									value="<%= loginUser.getNickName() %>"></td>
								<td></td>
							</tr>
							<tr>
								<td style="text-align: left;">휴대전화번호</td>
								<td><input type="text" name="phone" id="phone"
									minlength="8" maxlength="11"
									placeholder="휴대전화번호 ex) 01011112222" required
									value="<%= loginUser.getPhone() %>"></td>
								<td></td>
							</tr>
							<tr>
								<td colspan="3"><button type="submit"
										class="btn-insta-insert"
										style="font-size: large; font-weight: 600; margin-left: 11px;">회원정보수정</button></td>
							</tr>
						</table>
					</form>
				</div>
			</div>

		</div>
	</div>

	<div id="deleteModal" class="modal">
		<div class="modal-content">
			<form action="<%= contextPath %>/delete.me" method="get">
				<!-- 닫기 버튼 (X) -->
				<span class="close-btn">&times;</span>

				<h2 style="color: #e8618c;">회원 탈퇴</h2>
				<div id="line">
					<pre align="left">                                                                                                                       </pre>
				</div>
				<br>
				<h3 style="text-decoration: underline;">회원 탈퇴 유의 사항</h3>
				<p style="display: inline;">사용하고 계신 현재 아이디는 탈퇴할 경우
				<p style="display: inline; color: red; font-size: 25px;">복구가
					불가능합니다.</p>
				</p>
				<br>
				<br>
				<!-- 비밀번호 입력 -->
				<div class="userId-container">
					<label for="password">아이디 입력</label> <input name="userId"
						type="text" id="password" placeholder="아이디 입력">
				</div>
				<div class="password-container">
					<label for="password">비밀번호 입력</label> <input name="userPwd"
						type="password" id="userPwd" placeholder="비밀번호 입력">
				</div>

				<!-- 회원 탈퇴 버튼 -->
				<button class="delete-btn" type="submit">회원탈퇴</button>
			</form>
		</div>
	</div>
	<!--
        <input type="password" name="userPwd" id="userPwd" minlength="8" maxlength="16" placeholder="비밀번호를 입력하세요. (8~16자, 영문+숫자+특수문자)" required>
                        
                
        <input type="text" name="userName" id="userName" maxlength="16" placeholder="이름을 입력하세요." required value="">


        <input type="text" name="email" id="email" minlength="8" maxlength="20" placeholder="이메일을 입력하세요." required value="">


        <input type="text" name="nickName" id="nickName" minlength="2" maxlength="10" placeholder="닉네임을 입력하세요" required>


        <input type="text" name="birthDate" id="birthDate" minlength="8" maxlength="8" placeholder="생년월일 ex) 19990812" required value="">



        <input type="text" name="phone" id="phone" minlength="8" maxlength="11" placeholder="휴대전화번호 ex) 01011112222" required value="">
        -->
	<script>
            document.addEventListener("DOMContentLoaded", function () {
                const tabs = document.querySelectorAll(".tab");
                const underline = document.querySelector(".underline");
    
                function moveUnderline(element) {
                    underline.style.width = element.offsetWidth + "px";
                    underline.style.left = element.offsetLeft + "px";
                }
    
                tabs.forEach(tab => {
                    tab.addEventListener("click", function () {
                        tabs.forEach(t => t.classList.remove("active"));
                        this.classList.add("active");
    
                        moveUnderline(this);
    
                    });
                });
    
                // 페이지 로드 시 첫 번째 탭에 언더라인 설정
                moveUnderline(tabs[0]);
                tabs[0].classList.add("active");
            });
        </script>
	<script>
            $(document).ready(function () {
            // 모달 열기
            $("#openModal").click(function (e) {
                e.preventDefault();
                $("#deleteModal").fadeIn();
                });

            // 모달 닫기 (X 버튼 클릭 시)
            $(".close-btn").click(function () {
                $("#deleteModal").fadeOut();
                });

            // 모달 바깥 영역 클릭 시 닫기
            $(window).click(function (e) {
                if ($(e.target).is("#deleteModal")) {
                    $("#deleteModal").fadeOut();
                    }
                });
            });
        </script>
	<script>
            function idCheck() {
                const $idInput = $("#userId");


                    $.ajax({
                        url:"idCheck.me",
                        data:{checkId:$idInput.val()},
                        success: function (result) {
                            console.log(result);

                            if(result == 'NNNNN'){
                                alert("중복된 아이디입니다")
                                $idInput.focus();
                            } else{
                                if(confirm("사용가능한 아이디입니다. 사용하시겠습니까?")){
                                    $idInput.attr("readonly", true);
                                    $("#userId :submit").removeAttr("disabled");
                            } else {
                                    $idInput.focus();
                            }
                        }
                    
                    	
                        
                    
                        },
                    error: function () {
                    alert("서버 요청에 실패했습니다. 다시 시도해주세요.");
                    },
                    complete:function(){},
                });
            }
        </script>
</body>
</html>