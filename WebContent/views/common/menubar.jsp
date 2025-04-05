<%@page import="com.kh.profile.controller.model.vo.Profile"%>
<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member)session.getAttribute("loginUser");
	Profile userProfile = (Profile)session.getAttribute("userProfile");
	String alertMsg = (String)session.getAttribute("alertMsg");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	@font-face {
    font-family: 'Binggrae-Two';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Binggrae-Bold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
body *{
    font-family: 'Binggrae-Two';
    color: rgb(70, 69, 69);
}
div, input {
	box-sizing: border-box;
}

.wrap {
	width: 1100px;
	height: 120px;
	margin: auto;
}

img {
	width: 100%;
}

#header {
	width: 100%;
	height: 100%;
}

/* #header, #header1, #header2, #header3{
            border: 1px solid red;
        } */
#header>div {
	height: 100%;
	float: left;
	box-sizing: border-box;
}

#header1 {
	height: 100%;
	width: 20%;
}

#header2 {
	height: 100%;
	width: 60%;
}

#header3 {
	width: 20%;
}

#header1 {
	width: 20%;
	display: flex;
	align-items: center; /* 세로 중앙 정렬 */
	justify-content: center; /* 가로 중앙 정렬 */
}

#header1 img {
	width: 200px;
}

#header_2 {
	position: relative;
}

#header2 {
	display: flex;
	justify-content: center;
	align-items: center;
}

#search_form {
	width: 80%;
	height: 35px;
	display: flex;
	align-items: center;
	border: 2px solid rgb(232, 97, 140);
	border-radius: 25px;
	overflow: hidden;
}

#search_text {
	flex: 1;
}

#search_text input {
	width: 100%;
	height: 100%;
	border: none;
	padding: 0 15px;
	outline: none;
}

#search_btn {
	width: 100px;
	height: 100%;
}

#search_btn input {
	width: 100%;
	height: 100%;
	background-color: rgb(232, 97, 140);
	border: none;
	color: white;
	font-weight: bold;
	cursor: pointer;
}

#header3 {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	text-align: center;
}

#header3_top {
	display: flex;
	align-items: center;
	gap: 10px; /* 아이콘 및 텍스트 간격 */
	color: gray;
	font-size: 14px;
}

#header3_top img {
	width: 20px; /* 아이콘 크기 */
	height: 20px;
}

#header3_top a {
	text-decoration: none;
	color: gray;
}

#header3_top span {
	color: lightgray;
}

#header3_bottom {
	display: flex;
	align-items: center;
	gap: 8px; /* 텍스트와 프로필 사진 간격 */
	margin-top: 5px;
}

#header3_bottom .username {
	color: rgb(232, 97, 140);
	font-weight: bold;
}

#header3_bottom img {
	width: 40px; /* 프로필 사진 크기 */
	height: 40px;
	border-radius: 50%; /* 동그랗게 만들기 */
	object-fit: cover;
}

* {
	box-sizing: border-box;
}

#header3_bottom span {
	white-space: nowrap; /* 개별 요소 줄 바꿈 방지 */
}

#bnavigator {
	position: relative;
	width: 100%;
	min-width: 1020px;
	height: 47px;
	background: #fff;
	border-top: 1px solid #ddd;
	border-bottom: 2px solid palevioletred;
	z-index: 10;
}

#navigator {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 1020px;
	margin: 0 auto;
	position: relative;
}

#category {
	display: flex;
	align-items: center;
	gap: 5px;
	width: 120px;
	height: 44px;
	padding-left: 10px;
	line-height: 44px;
	color: black;
	font-size: 15px;
	font-weight: 700;
	text-align: left;
	text-decoration: none;
	transition: background 0.3s ease, color 0.3s ease;
}

#category:hover {
	background: palevioletred;
	color: white;
}

.category-menu {
	position: absolute;
	top: 29px;
	left: 75px;
	width: 120px;
	background: white;
	border: 1px solid palevioletred;
	display: none;
	padding: 10px;
	z-index: 100;
}

.category-menu a {
	display: block;
	padding: 8px 12px;
	text-decoration: none;
	color: black;
	transition: background 0.3s ease, color 0.3s ease;
}

.category-menu a:hover {
	background: palevioletred;
	color: white;
}

#navi {
	margin-left: auto;
	display: flex;
	justify-content: flex-end;
	list-style: none;
	margin: 0;
	padding: 0;
}

#navi>li {
	width: 150px;
	text-align: center;
}

#navi a {
	text-decoration: none;
	color: black;
	font-size: 15px;
	font-weight: 900;
	display: block;
	width: 100%;
	height: 100%;
	line-height: 44px;
}

#navi a:hover {
	color: palevioletred;
}

.category-menu>li {
	list-style: none;
}

.content {
	width: 1020px;
	height: 100%;
	margin: 0 auto;
}

.main_banner {
	width: 100%;
	height: 450px;
	position: relative;
	float: left;
	display: block;
}

.banner_link {
	height: 450px;
}

.img_content {
	margin: 0 auto;
	box-sizing: border-box;
	position: absolute;
	width: 100%;
	height: 450px
}

.banner_link {
	text-decoration: none;
	height: 450px;
	width: 100%;
	color: #666;
	margin: 0;
	padding: 0;
	border: 0;
	display: block;
}
</style>

</head>
<body>

	<% if(alertMsg != null) { %>
	<script>
				alert("<%= alertMsg %>")			
			</script>
	<% session.removeAttribute("alertMsg"); %>
	<% } %>

	<div class="wrap">

		<div id="header">

			<div id="header1">
				<img src="<%= contextPath %>/resources/images/현존최강로고.jpg" alt="로고">
			</div>

			<div id="header2">
				<form action="" id="search_form">
					<div id="search_text">
						<input type="text" name="keyword" placeholder="검색 키워드를 입력하세요.">
					</div>
					<div id="search_btn">
						<input type="submit" value="Search">
					</div>
				</form>
			</div>

			<div id="header3">
				<% if(loginUser == null) { %>
				<!-- case1. 로그인 전-->
				<div id="header3_top">
					<a href="<%= contextPath %>/loginForm.me">로그인</a> <span>|</span> <a
						href="<%= contextPath %>/enrollForm.me">회원가입</a>
				</div>



				<% }else { %>
				<!-- case2. 로그인 후 -->
				<div id="header3_top">

					<a href=""><img src="<%= contextPath %>/resources/images/2.PNG"
						alt="메시지"></a> <a href=""><img
						src="<%= contextPath %>/resources/images/3.PNG" alt="알림"></a> <a
						href="<%= contextPath %>/logout.me">로그아웃</a> <span>|</span> <a
						href="<%= contextPath %>/myPage.me?userNo=<%= loginUser.getUserNo() %>">마이페이지</a>
				</div>
				<div id="header3_bottom">
					<span class="username"><b><%= loginUser.getUserName() %></b><b>님</b></span>
					<% if (loginUser.getFilePath() != null && !loginUser.getFilePath().isEmpty()) { %>
					<span>환영합니다!</span><img src="<%= loginUser.getFilePath() %>" alt="프로필 사진">
					<% } else {%>
					<span>환영합니다!</span><img src="<%= contextPath %>/resources/images/account_circle_500dp_000000.png" alt="프로필 사진">
					<% } %>
				</div>
				<% } %>
			</div>


		</div>

	</div>

	<%@ include file="../common/content.jsp"%>
</body>
</html>
