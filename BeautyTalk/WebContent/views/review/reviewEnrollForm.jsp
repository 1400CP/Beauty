<%@page import="com.kh.review.model.vo.Image"%>
<%@page import="com.kh.review.model.vo.Review"%>
<%@page import="com.kh.review.model.vo.SubCategory"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<SubCategory> list = (ArrayList<SubCategory>)request.getAttribute("list");
	Review rv = (Review)request.getAttribute("rv");
	Image img = (Image)request.getAttribute("img");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
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



table {
	width: 100%;
	table-layout: fixed; /* 테이블 셀 너비를 균등하게 */
}

button {
	border-style: none;
}

<!-- reviewEnrollForm -->
/* * {
        border: 1px solid gray;
    } */
.review_Enrollouter {
	width: 1300px;
	height: auto;
	margin: auto;
	margin-top: 440px;
}

.review_Enrollouter h2 {
	color: palevioletred;
	font-size: 30px;
	font-weight: 900;
}

.review_Enrollouter th {
	color: palevioletred;
	font-size: 20px;
	font-weight: 700;
}

#reviewPost_table1 {
	width: 700px;
	height: 500px;
	min-width: 500px;
	min-height: 500px;
	margin: 0% auto;
}

#reviewPost_table1 input, #reviewPost_table1 textarea {
	width: 100%;
	height: 100%;
	border: 0.1px solid lightgrey;
	border-radius: 20px;
	box-sizing: border-box;
	padding: 20px;
}

#reviewPost_textarea1 {
	font-size: medium;
	font-weight: bold;
}

.review_EnrollTh {
	z-index: 0;
	position: relative;
}

.review_EnrollTh::before {
	z-index: -0.1;
	content: attr(data-content);
	position: absolute;
	left: 0;
	/* 글자 바깥쪽으로 나갔으면 하는 테두리 크기의 두 배 */
	-webkit-text-stroke: 0.1px black;
}

.review_EnrollTh2 {
	padding: 20px;
}

#review_upload{
	display: none;
	cursor: pointer;
}

.reviewEnrollForm_btn button{
	margin-left: 20px;
	border-radius: 20px;
	padding: 10px 20px;
	background-color: palevioletred;
	color: white;
	font-size: 15px;
	font-weight: 900;
	cursor: pointer;
}

.reviewPost_category2{
	color: palevioletred;
	font-size: 16px;
	font-weight: 900;
}

.reviewPost_category2 select{
	margin-left: 5px;
	margin-right: 30px;
}

#image_container img{
	width: 100%;
	height: 100%;
	box-sizing: border-box;
	margin: auto;
}

</style>
</head>
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
				<div class="tab">
					<a href="<%= contextPath %>/review.li">Review</a>
				</div>
				<div class="tab">Beauty Profile</div>
				<div class="underline"></div>
			</div>

		</div>
		<div id="Content4">
			<div id="Content5">
				<div>
					<span class="material-icons" style="font-size: 30px;">person<a
						href="<%= contextPath %>/myPage.me" style="font-size: 25px;">마이페이지</a></span>
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

	<br>
	<br>

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

<!-- ReviewEnrollForm -->
	<div class="review_Enrollouter">
		<h2 align="center">리뷰 작성</h2>
		<form action="<%= contextPath %>/insert.re" id="reviewEnroll_Form1" method="post" enctype="multipart/form-data">
			<input type="hidden" name="MEM_NO" value="<%= loginUser.getUserNo() %>">
			<table id="reviewPost_table1" align="center">
				<tr>
					<th width="75" height="50" align="left" class="review_EnrollTh">
						제목
					</th>
					<td width="350">
						<input type="text" name="TITLE">
					</td>
					<th width="75" class="review_EnrollTh2">
						카테고리
					</th>
					<td width="100">
						<select class="reviewPost_category1" name="SC_ID">
<!-- Category 테이블로부터 조회해올 것 -->
                            <% for(SubCategory sc : list) { %>
                            	<option value="<%= sc.getScId() %>"><%= sc.getScName() %></option>
                            <% } %>
                    </td>
				</tr>

				<tr>
					<th align="left" class="review_EnrollTh">
						내용
					</th>
					<!-- 높낮이를 고정시키기 위해서 style 부여 -->
					<td colspan="3" style="height: 200px;"><textarea
							id="reviewPost_textarea1" name="CONTENT" style="resize: none;"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="reviewPost_category2">
						가격 : 
						<select name="PR_RATING">
							<% for(int i=5; i>=1; i--) { %>
								<option><%= i %></option>
							<% } %>
						</select>
						
						성분 : 
						<select name="P_RATING">
							<% for(int i=5; i>=1; i--) { %>
								<option><%= i %></option>
							<% } %>
						</select>
						
						재구매 : 
						<select name="R_RATING">
							<% for(int i=5; i>=1; i--) { %>
								<option><%= i %></option>
							<% } %>
						</select>
					</td>
				</tr>
				<tr>
					<th style="height: 50px;" align="left" class="review_EnrollTh">
						첨부파일
					</th>
					<td colspan="3" align="center">
						<label for="review_upload">
							<span class="material-icons">
								<svg xmlns="http://www.w3.org/2000/svg" height="48px" viewBox="0 0 24 24" width="48px" fill="#e8618c"><path d="M0 0h24v24H0z" fill="none"/><path d="M9 16h6v-6h4l-7-7-7 7h4zm-4 2h14v2H5z"/></svg>
							</span>
						</label>
						<input type="file" id="review_upload" name="upfile" onchange="setThumbnail(event);">
						<div id="image_container"></div>
					</td>
				</tr>
			</table>
			<input type="hidden" name="LIKE_REVIEW" value="0">
			
			<script>
				function setThumbnail(event){
					const reader = new FileReader();
					
					reader.onload = function(event){
						var img = document.createElement("img");
						img.setAttribute("src", event.target.result);
						img.setAttribute("class", "col-lg-6");
						document.querySelector("div#image_container").appendChild(img);
					};
					reader.readAsDataURL(event.target.files[0]);
				}
			</script>
			<br>

			<div class="reviewEnrollForm_btn" align="center">
				<button type="button" onclick="location.href='<%= contextPath %>/review.li?'">
					목록
				</button>
				<button type="submit">
					작성
				</button>
				<button type="reset">
					삭제
				</button>
			</div>
		</form>
	</div>

</body>
</html>