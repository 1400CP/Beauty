<%@page import="com.kh.post.model.vo.Image2"%>
<%@page import="com.kh.post.model.vo.Post"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	Post po = (Post)request.getAttribute("po");
	Image2 img = (Image2)request.getAttribute("img");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js">
</script>
<style>
#Content1{
    height: auto;
    width: 100%;
    min-width: 1200px;
    margin: auto;
    margin-top: 50px;
}
#Content2{
    width: 1200px;
    height: 100px;
    overflow: hidden;
    margin: 0 auto;

}
#Content3{
    width: 1200px;
    overflow: hidden;
    margin: auto;
}
#Content3 table{
    height: auto;
    width: 350px;
    margin-bottom: 50px;
}
#Content3 div{
    float: left;
    text-align: center;
}
#Content4{
    width: 1200px;
		height: auto;
    min-height: 1200px;
    overflow: hidden;
    margin: auto;
    display: flex;

}
#Content5{
    width: 350px;
    border: 1px solid #ddd;
    margin-right: 50px;
    
}
#Content6{
    width: 800px;
}
#userImg{
    height: 70px;
    width: 70px
    
}
#userprofile{
    border-radius: 50%;  /* 원형 이미지 */
    object-fit: cover;
    height: 100%;
    width: 100%;
}

#Content2 div{
    float: left;
    margin: auto;
    
}
#userName *{
    margin: 0;
    margin-top: 20px;
}
table td{
    text-align: center;

}
a{
    text-decoration: none;
    color: black;
    text-decoration: none;
    font-size: 15px;
    font-weight: 600;
}
a:hover{
    color: #e8618c;
}

#userInfo tr{
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

#myPageTitle{
    margin-left: 20px;
}
#Title{
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
.underline{
    position: absolute;
    bottom: -2px;
    height: 3px;
    background-color: #e8618c;
    transition: all 0.3s ease-in-out;
    
}
.material-icons{
    display: inline;
    display: flex;
    align-items: center;
    font-weight: 600;
}
pre{
    text-decoration: underline;
    color: #e8618c;
    text-decoration-thickness: 3px;
    font-size: xx-small;
}


input[type="text"], input[type="password"] {
    width: 480px;
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

#insert-form :nth-child(4){
    margin-top: 20px;
}

#insert-form :nth-child(7){
    margin-top: 20px;
}

#Content5>*{
    margin: 7px;
}
#update{
    align-content: center;
}
#update2{
    width: 100%;
    height: 100%;
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
#openModal:hover{
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
table-layout: fixed; /* 테이블 셀 너비를 균등하게 */
}

button {
border-style: none;
}
#gender{
    width: 100%;
    height: 20px;
    margin-top: 10px;
    
}
#improvement input{
margin-left: 30px;
}
#update2 input[type="checkbox"]{
margin-left: 30px;
appearance: none;
width: 15px;
vertical-align: middle;
height: 12px;
border: 1px solid rgb(118, 118, 118);
border-radius: 50%; /* 원형 */
position: relative;
cursor: pointer;
}
#update2 input[type="radio"]{
margin: 10px;
}
.color-box {
display: flex;
}

.color-label {
display: flex;
align-items: center;
justify-content: center;
width: 121px; /* 버튼 크기 */
height: 45px;
border: 2px solid #ddd;
cursor: pointer;
font-size: 14px;
font-weight: bold;
color: #333;
background-color: #fff;
transition: all 0.3s;
}

/* 라디오 버튼 숨기기 */
.color-input {
display: none;
}

/* 선택된 상태 스타일 */
.color-input:checked + .color-label {
background-color: #e8618c;
border-color: #e8618c;
color: white;
}
/* 처음 버튼 (왼쪽만 둥글게) */
.color-label:first-of-type {
border-radius: 10px 0 0 10px;
}

/* 마지막 버튼 (오른쪽만 둥글게) */
.color-label:last-of-type {
border-radius: 0 10px 10px 0;
}
#userImg {
position: relative;
display: inline-block;
}


.edit-icon {
position: absolute;
bottom: 5px; /* 이미지 아래쪽 여백 */
right: 5px;  /* 이미지 오른쪽 여백 */
background-color: white; /* 아이콘 배경 */
color: black;
border-radius: 50%;
padding: 5px;
box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
font-size: 18px;
cursor: pointer;
display: flex;
align-items: center;
justify-content: center;
width: 14px;
height: 14px;
}
.profile-modal {
display: none;
position: fixed;
z-index: 1000;
left: 50%;
top: 50%;
transform: translate(-50%, -50%);
width: 500px; /* 기본 크기 */
height: 500px;
min-width: 300px;  /* 최소 너비 */
min-height: 200px; /* 최소 높이 */
max-width: 600px;  /* 최대 너비 */
max-height: 500px; /* 최대 높이 */
background: white;
padding: 20px;
border-radius: 10px;
box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
overflow: hidden;
resize: both;  /* 크기 조절 가능하도록 설정 */
}

/* 내부 컨텐츠 */
.profile-modal-content {
text-align: center;
width: 100%;
height: 100%;
overflow: auto; /* 내용이 넘칠 경우 스크롤 가능 */
display: flex;
flex-direction: column;
align-items: center;
justify-content: center;
}

/* 버튼을 감싸는 부모 컨테이너 추가 */
.profile-button-container {
display: flex;
flex-direction: row;  /* 버튼을 가로로 정렬 */
justify-content: center; /* 중앙 정렬 */
align-items: center; /* 세로 중앙 정렬 */
gap: 15px; /* 버튼 간격 */
margin-top: 15px; /* 위쪽 여백 */
width: 100%; /* 부모 요소가 가득 차도록 설정 */
}

.profile-modal-content img {
width: 200px;
height: 200px;
margin-left: 125px;
border-radius: 50%;
margin-bottom: 20px; /* 간격 조정 */
}

.profile-button-container {
display: flex;

gap: 10px; /* 버튼 간격 조정 */
align-items: center;
}

.custom-file-upload, 
#saveProfile {
width: 120px; /* 버튼 크기 조정 */
text-align: center;
}

/* 닫기 버튼 */
.close-profile {
position: absolute;
top: 10px;
right: 15px;
font-size: 20px;
cursor: pointer;
}
input[type="file"] {
display: none;
}

.custom-file-upload {
display: inline-block;
padding: 10px 20px;
background-color: #f8d7da;
color: #e8618c;
border-radius: 5px;
cursor: pointer;
font-weight: bold;
border: 1px solid #e8618c;
}

.custom-file-upload:hover {
background-color: #e8618c;
color: white;
}

#saveProfile {
display: inline-block;
padding: 10px 20px;
background-color: #f8d7da;
color: #e8618c;
border-radius: 5px;
cursor: pointer;
font-weight: bold;
border: 1px solid #e8618c;
}

#saveProfile:hover {
background-color: #e8618c;
color: white;
}

<!-- reviewEnrollForm -->

	#review_detailouter{}
	
	#review_detailouter h2{
		color: palevioletred;
		font-size: 30px;
		font-weight: 900;
	}
	
	#review_detailouter th{
		color: palevioletred;
		font-size: 20px;
		font-weight: 700;
	}
	
	#reviewDetail_table1 {
		width: 700px;
		min-width: 500px;
		min-height: 500px;
		margin: 0% auto;
	}
	
	#reviewDetail_table1 input, #reviewDetail_table1 textarea {
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

	.reviewDetail_btn{
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
		margin-top: 20px;
	}
	
	.reviewPost_category2 span{
		margin-left: 5px;
		margin-right: 30px;
	}
	
	#image_container img{
		width: 100%;
		height: 100%;
		box-sizing: border-box;
		margin: auto;
	}
	
	#review_DetailLikebtn{
		background-color:none;
		border:none;
		border-radius:20px;
		font: 16px;
		font-weight:900;
	}

	.review_DetailImg{
		margin-top: 20px;
	}
	
	.review_DetailImg img{
		width: 100%;
		height: 100%;
		box-sizing: border-box;
		margin: auto;
	}
	
	#reply-area{
		width:100%;
		height:100%;
		margin:auto;
		margin-top:20px;
		margin-bottom:40px;
		box-sizing:border-box;
	}
	
	#reply-area>table {
		height:25%;
		padding:20px;
		box-sizing: border-box;
	}
	
	#reply-area>table>tbody>tr>td{
		width: 20%;
	}
	
	#reply-area>table textarea{
		resize: none;
		border-radius: 20px;
		padding: 10px;
		box-sizing: border-box;
	}

	.review_detail_title{
		width: 100%;
		height: 100%;
		border: 0.1px solid lightgrey;
		border-radius: 20px;
		box-sizing: border-box;
		padding: 20px;
		text-align: left;
	}
	
</style>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
<!-- 대기중 -->
	<%@ include file="../common/header.jsp"%> 
	<br>
	<% if(loginUser == null) { %>
		<div id="Content1">
			<div id="Content2">
				<div id="userImg">
					<img id="userprofile"
						src="<%= contextPath %>/resources/userImage/변우석.jpg" alt="유저이미지">
				</div>
				<div id="userName">
					<h2>비회원</h2>
					<span style="font-size: x-small;">비회원</span>
				</div>
			</div>
			<div id="Content3">
				<table>
					<tr>
						<td><a href="" style="font-weight: 800; font-size: larger;">게시글
								<br>0 <br></td>
						<td><a href="" style="font-weight: 800; font-size: larger;">리뷰
								<br>0<br>
						</a></td>
						<td><a href="" style="font-weight: 800; font-size: larger;">팔로우
								<br>0<br>
						</a></td>
						<td><a href="" style="font-weight: 800; font-size: larger;">팔로잉
								<br>0<br>
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
	<% }else { %>
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
						<td><a href="<%= contextPath %>/postMyList.po" style="font-weight: 800; font-size: larger;">게시글
								<br><%= loginUser.getPost() %></a> <br></td>
						<td><a href="<%= contextPath %>/review.my" style="font-weight: 800; font-size: larger;">리뷰
								<br><%= loginUser.getReview() %><br>
						</a></td>
						<td><a href="<%= contextPath %>/views/member/follow.jsp" style="font-weight: 800; font-size: larger;">팔로우
								<br><%= loginUser.getFollower() %><br>
						</a></td>
						<td><a href="<%= contextPath %>/views/member/follow.jsp" style="font-weight: 800; font-size: larger;">팔로잉
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
	<% } %>

<!-- PostEnrollForm -->
	<div id="review_detailouter" class="review_detailouter">
		<h2 align="center">포스트 상세보기</h2>
			<input type="hidden" name="MEM_NO" value="">
			<table id="reviewDetail_table1">
				<tr>
					<th width="75" height="50" align="left" class="review_Detailth">
						제목
					</th>
					<td>
						<div class="review_detail_title"><%= po.getTitle() %></div>
					</td>
					<th width="75" class="review_Detailth2">
					<!-- 카테고리 -->
					</th>
					<td width="100">
					<!--   -->
					</td>
				</tr>

				<tr>
					<th align="left" class="review_EnrollTh">
						내용
					</th>
					<!-- 높낮이를 고정시키기 위해서 style 부여 -->
					<td colspan="3" style="height: 200px;"><textarea
							id="reviewPost_textarea1" name="CONTENT" style="resize: none;" readonly><%= po.getContent() %></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="3" class="reviewPost_category2">
					</td>
					<td>
						<button type="button" id="review_DetailLikebtn" class="review_detail_like" name="LIKE_REVIEW" value="<%= po.getLikePost() %>"> 👍 : <%= po.getLikePost() %></button>
					</td>
				</tr>
				<tr>
					<th style="height: 50px;" align="left" class="review_EnrollTh">
						첨부 파일
					</th>
					<td colspan="3" class="review_DetailImg">
	                	<% if(img == null) { %>
	                	<!-- case1. 첨부파일이 없을 경우 -->
	                		<br>
	                        	<b>첨부파일이 없습니다</b>
		                    <br>
							
	                	<% }else { %>
						<!-- case2. 첨부파일이 있는 경우 -->
       						<br>
         					<img src="<%= contextPath %>/<%= img.getFilePath() + img.getChangeName() %>">
							<a download="<%= img.getOriginName() %>" href="<%= contextPath %>/<%= img.getFilePath() + img.getChangeName() %>"><%= img.getOriginName() %></a>
							<br>

	                	<% } %>
					</td>
				</tr>

			</table>
		
			<br>

			<div class="reviewEnrollForm_btn" align="center">
				<button type="button" onclick="location.href='<%= contextPath %>/post.list?'">
					목록
				</button>
				<% if(loginUser != null && loginUser.getUserNo() == po.getMemNo()) { %>
					<button type="button" onclick="location.href='<%= contextPath %>/postUpdate.po?bno=<%= po.getPostNo() %>'" class="reviewDetail_btn">
						수정
					</button>
					
					<button type="button" onclick=test() class="review_detail_delete">
						삭제
					</button>
				<% } %>
			</div>
			
			<script>
				$(function(){
				    $(".review_detail_delete").on("click", function(){
				        if(!confirm("삭제(확인) 또는 취소.")) {
				        	alert("삭제 안 함.");
				        }else {
				        	location.href="<%= contextPath %>/post.de?bno=<%= po.getPostNo() %>" 
				        }
			    	})
				})
			</script>
		
<!-- 나머지 댓글 작성용 -->

		<br><br>

		<div id="reply-area">
			<table align="center" style="color: black;">
                <thead>
                    <tr>
                        <th style="text-align: right; padding: 0px 120px;">댓글</th>
                        <% if(loginUser != null) { // 로그인이 되어 있을 경우 %>
                        <td>
                            <textarea id="replyContent" rows="5" cols="50" required></textarea>
                        </td>
                        <td>
                            <button type="button" onclick="insertReply()" class="reviewDetail_btn">댓글 등록</button>
                        </td>
                        <% }else { %>
                        <td>
                            <textarea rows="5" cols="50" readonly>로그인 후 이용 가능한 서비스입니다.</textarea>
                        </td>
                        <td>
                            <button class="reviewDetail_btn" disabled>댓글 등록</button>
                        </td>
                        <% } %>
                    </tr>
                    
                </thead>
                
                <tbody>
                   
                </tbody>

            </table>		
		</div>
		
           	<script>
              	$(function(){
              		// 댓글조회
  					selectReplyList();
              		
              		// setInterval(주기적으로 실행할함수이름, ms시간); 
              		setInterval(selectReplyList, 30000);
              	})

            	// ajax으로 댓글 작성용 함수
            	function insertReply(){
            		$.ajax({
            			url:"rinsert.po",
            			data:{ // 모르겠으면 쿼리를 먼저 짜보라!
            				bno:<%= po.getPostNo() %>,
            				content:$("#replyContent").val(),
            				userNo:<%= po.getMemNo() %>
            			},
            			type:"post",
            			success:function(result){
            				if(result > 0){ // 댓글 작성 성공 == 갱신된 댓글 리스트 조회 + 댓글칸 초기화
            					selectReplyList();
            					$("#replyContent").val(""); // textarea 초기화
            				}
            			},
            			error:function(){
            				console.log("ajax 댓글 실패")
            			},
            		})
            	}
              	
            	// ajax으로 해당 게시글에 딸린 댓글 목록 조회용 함수
            	function selectReplyList(){
            		$.ajax({
            			url:"rlist.po",
            			data:{
            				bno: <%= po.getPostNo() %>
            			},
            			success:function(list){
            				console.log(list);
            				
        					let value = "";
        					for(let i=0; i<list.length; i++){
        						value += "<tr>"
        									+"<td>" + list[i].userId + "</td>"
        									+"<td>" + list[i].replyContent + "</td>"
        									+"<td>" + list[i].createDate + "</td>"
        								+"</tr>"
        					}
        					$("#reply-area>table>tbody").html(value);
            				
            			},
            			error:function(){
            				console.log("ajax 댓글 실패")
            			},
            		})
            		
            	}

            </script>
			
		</div>
	</div>
</div>
</body>
</html>