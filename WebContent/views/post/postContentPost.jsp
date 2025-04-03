<%@page import="com.kh.post.model.vo.Post"%>
<%@page import="com.kh.post.model.vo.Image2"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.common.model.vo.PageInfo"%>
<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.awt.font.ImageGraphicAttribute"%>

<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Post> list = (ArrayList<Post>)request.getAttribute("list");
	ArrayList<Image2> list1 = (ArrayList<Image2>)request.getAttribute("list1");

	int reviewLimit = pi.getreviewLimit();
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	int listCount = pi.getListCount();
	int pageLimit = pi.getPageLimit();
%>
<!DOCTYPE html>
<html lang="en">
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

<!-- postContentPost -->
#reviewForm_CP1 {
	margin: auto;
}

/* #reviewTable_CP1 *{
	border: 5px solid black;
} */

.reviewTable_CP1 td{
	border: 0.5px solid lightgrey; opacity: 0.5;
}

.reviewMP_td1 {
	margin: auto;
	margin-top: 50px;
	margin-right: 400px;
	color: palevioletred;
	font-size: 25px;
	font-weight: 900;
}

.crossLine{
	text-align: center;
	color: lightgray;
}

.reviewContent_div_btn{
	margin-top: 10px;
	margin-bottom: 10px;
	margin-left: 550px;
}

.review_rating {
	color: palevioletred;
	font-size: 15px;
	font-weight: 900;
	z-index: 0;
	position: relative;
}

.review_rating::before {
	z-index: -1;
	content: attr(data-content);
	position: absolute;
	left: 0;
	/* 글자 바깥쪽으로 나갔으면 하는 테두리 크기의 두 배 */
	-webkit-text-stroke: 0.2px black;
}

.reviewContent_btn{
	border: none;
	border-radius: 20px;
	background-color: palevioletred;
	padding: 10px;
	cursor : pointer;
	color: white;
	font-size: 14px;
	font-weight: 700;
	width: 120px;
}

.reviewContent_btn2{
	border: none;
	border-radius: 20px;
	background-color: palevioletred;
	padding: 10px;
	cursor : pointer;
	font-size: 14px;
	font-weight: 700;
	color:lightgray;
	width: 120px;
}

.review_CreateDate, .review_title1, .review_title2{
	font: normal;
	font-size: 18px;
	font-weight: 700;
}

.reviewTr_img1 td, .reviewTr_img2 td, .reviewTr_img3 td{
	height: 30px;
}

.reviewTr_img3 textarea{
	font: message-box;
	font-size: 22px;
	font-weight: bold;
	padding : 20px;
}

.paging-area{
	margin-top: 20px;
}

.reviewTr_img1, .reviewTr_img2{
	cursor:pointer;
}

.reviewTr_img1 img{
	width: 280px;
	height: 250px;
	box-sizing: border-box;
	cursor:pointer;
}

</style>
</head>
<body>

<!-- 포스트 콘텐츠 -->
<%@ include file="../common/headerNav.jsp" %>

<form action="" id="reviewForm_CP1" method="get" align="center">			
		<div class="reviewMP_td1">post 게시글</div>
			<div class="crossLine">──────────────────────────────────────────────────────────────────────</div>
				<div class="reviewContent_div_btn">
					<% if(loginUser != null) { %>
					<button type="button" class="reviewContent_btn" onclick="location.href='<%= contextPath %>/postList.wr'">
						+ 포스트 작성
					</button>
					<% }else { %>
						<button type="button" class="reviewContent_btn2" onclick="location.href='<%= contextPath %>/loginForm.me'">
							+ 포스트 작성
						</button>
					<% } %>
				</div>
				
				<table id="reviewTable_CP1" align="center">
				<!-- 게시글이 없는 경우 -->
				<% if(list.isEmpty()) { %>
				
					<tr>
						<td colspan="6" rowspan="4">
							<p>조회된 게시글이 없습니다.</p>
						</td>
					</tr>

			<!-- 게시글이 있는 경우 -->
				<% }else { %>
					<% for(Post po : list) { %>
					<tr class="reviewTr_img1">
						
						<td class="review_CreateDate" colspan="3" align="left" style="margin-left: 10px;"><%= po.getCreateDate() %></td>
						<td><input type="hidden" name="POST_NO" value="<%= po.getPostNo() %>"></td>
					</tr>
					
					<tr class="reviewTr_img2">
						
						<td class="review_title1" align="left" style="margin-left: 10px;"><%= po.getPostNo() %></td>
						<td class="review_title2" colspan="2" align="left" style="margin-left: 10px;"><%= po.getTitle() %></td>
						<td></td>
					</tr>

					<tr class="reviewTr_img3">

						<td colspan="4"><textarea cols="60" rows="10" style="resize: none; border-color: white;" disabled><%= po.getContent() %></textarea></td>
					</tr>
					
					<tr>
					
						<td colspan="4" style="height: 50px"></td>
					<tr>
					<% } %>
				<% } %>
				
				</table>

		
			<script>
				$(function(){
					$(".reviewContent_btn2").on("click", function(){
						alert("로그인을 해주세요.");
					})
				})
				
				$(function(){
					$(".reviewTr_img1").on("click", function(){
						location.href = '<%= contextPath %>/detail.po?bno=' + $(this).children().eq(1).children().val();
					})
				})
			
				$(function(){
					$(".reviewTr_img2").on("click", function(){
						location.href = '<%= contextPath %>/detail.po?bno=' + $(this).children().eq(0).text();
					})
				})
			</script>

			<div class="paging-area" align="center">
				<% if(currentPage != 1) { %>
				<!-- 이전버튼 -->
					<button type="button" onclick="location.href='<%= contextPath %>/post.list?cpage=<%= currentPage -1 %>'">
						&lt;
					</button>
				<% } %>
							
				<% for(int i=startPage; i<=endPage; i++) { %>
					<% if(i != currentPage) { %>
						<button type="button" onclick="location.href='<%= contextPath %>/post.list?cpage=<%= i %>'">
							<%= i %>
						</button>
					<% }else { %>
						<button type="button" disabled>
							<%= i %>
						</button>
					<% } %>
				<% } %>
							
				<% if(list.isEmpty()) { %>
					<button type="button" disabled>
						&gt;
					</button>
				<!-- 다음버튼 -->
				<% }else if(currentPage != maxPage) { %>
					<button type="button" onclick="location.href='<%= contextPath %>/post.list?cpage=<%= currentPage +1 %>'">
						&gt;
					</button>
				<% } %>
			</div>
</form>
</body>
</html>