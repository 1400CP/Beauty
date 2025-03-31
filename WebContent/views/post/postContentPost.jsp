<%@page import="com.kh.post.model.vo.Post"%>
<%@page import="com.kh.post.model.vo.Image2"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.common.model.vo.PageInfo"%>
<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.awt.font.ImageGraphicAttribute"%>

<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member)session.getAttribute("loginUser");
	String alertMsg = (String)session.getAttribute("alertMsg");

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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
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
#reviewForm_CP1 * {
	border: 5px solid black;
	margin: auto;
	margin-top: 10px;
}

#reviewTable_CP1 {
	margin: auto;
	margin-top: 10px;
}

.reviewMP_td1 {
	color: palevioletred;
	font-size: 25px;
	font-weight: 900;
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

.reviewContent_btn {
	border: none;
	border-radius: 20px;
	background-color: palevioletred;
	padding: 10px;
	cursor: pointer;
	color: white;
	font-size: 14px;
	font-weight: 700;
	width: 120px;
}

.reviewContent_btn2 {
	border: none;
	border-radius: 20px;
	background-color: palevioletred;
	padding: 10px;
	cursor: pointer;
	font-size: 14px;
	font-weight: 700;
	color: lightgray;
	width: 120px;
}

.review_img2 {
	width: 250px;
	height: 250px;
	box-sizing: border-box;
}

.reviewTr_img1, .reviewTr_img2, .reviewTr_img3 {
	cursor: pointer;
}

.review_CreateDate {
	font-size: 14px;
	font-weight: 700;
}

.review_title1, .review_title2 {
	font-size: 14px;
	font-weight: 700;
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
				<img src="resources/images/현존최강로고.jpg" alt="로고">
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
						href="enrollForm.me">회원가입</a>
				</div>



				<% }else { %>
				<!-- case2. 로그인 후 -->
				<div id="header3_top">

					<a href=""><img src="resources/images/2.PNG" alt="메시지"></a> <a
						href=""><img src="resources/images/3.PNG" alt="알림"></a> <a
						href="">로그아웃</a> <span>|</span> <a
						href="<%= contextPath %>/views/member/memberEnrollForm.jsp">마이페이지</a>
				</div>
				<div id="header3_bottom">
					<span class="username"><b><%= loginUser.getUserName() %></b><b>님</b>,</span>
					<span>환영합니다!</span> <a href=""><img src="" alt="프로필 사진"></a>
				</div>
				<% } %>
			</div>


		</div>

	</div>

	<div id="bnavigator">
		<div id="navigator">
			<a href="#" id="category">☰ 카테고리</a>
			<ul class="category-menu">
				<li><a href="skincare.html">스킨케어</a></li>
				<li><a href="makeup.html">메이크업</a></li>
				<li><a href="haircare.html">헤어케어</a></li>
			</ul>
			<ul id="navi">
				<li><a href="index.html">HOME</a></li>
				<li><a href="<%= contextPath %>/review.li?">Reviews</a></li>
				<li><a href="<%= contextPath %>/post.list">Posts</a></li>
				<li><a href="people.html">People</a></li>
				<li><a href="ranking.html">상품 랭킹</a></li>
			</ul>
		</div>
	</div>


	<script>
        document.addEventListener("DOMContentLoaded", function () {
        const categoryBtn = document.querySelector("#category");
        const categoryMenu = document.querySelector(".category-menu");
        
        categoryBtn.addEventListener("click", function (event) {
            event.preventDefault();
            categoryMenu.style.display = categoryMenu.style.display === "block" ? "none" : "block";
        });
        
        document.addEventListener("click", function (event) {
            if (!categoryBtn.contains(event.target) && !categoryMenu.contains(event.target)) {
            categoryMenu.style.display = "none";
            }
        });
        });
    </script>

<!-- 포스트 콘텐츠 -->
	<form action="" id="reviewForm_CP1" method="get">
		<table id="reviewTable_CP1">
			<tr>
				<td height="50"></td>
				<td colspan="11"class="reviewMP_td1">Post 게시글</td>

			</tr>
			<tr>
				<td colspan="12" style="color: lightgray;" height="0">
					————————————————————————————————————————————————————————————</td>
			</tr>

			<tr>
				<td colspan="11"></td>
				<td>
					<% if(loginUser != null) { %>
						<button type="button" class="reviewContent_btn" onclick="location.href='<%= contextPath %>/postList.wr'">
							+포스트 작성
						</button>
					<% }else { %>
						<button type="button" class="reviewContent_btn2" onclick="location.href='<%= contextPath %>/loginForm.me'">
							+ 포스트 작성
						</button>
					<% } %>
				</td>
			</tr>
			
			<script>
				$(function(){
				    $(".reviewContent_btn2").on("click", function(){
				    	alert("로그인을 해주세요.");
			    	})
				})
			</script>
			
			<!-- 게시글이 없는 경우 -->
			<% if(list.isEmpty()) { %>

			<tr>
				<td rowspan="6" colspan="6">
					<p>조회된 게시글이 없습니다.</p>
				</td>
			</tr>
			
			<!-- 게시글이 있는 경우  -->
			<% }else { %>
			
			<% for(Post po : list) { %>
			<tr class="reviewPostNo_img">
				<td class="reviewTr_img1" colspan="3" rowspan="5" align="center" style="width: 250px; height: 250px;" onclick="location.href='<%= contextPath %>/detail.po?bno='">
					<% for(Image2 img:list1) { %>
						<% if(po.getMemNo() == (img.getPostMem()) && po.getCreateDate() == img.getUploadDate()) { %>
						<img src="<%= contextPath %>/<%= img.getFilePath() + img.getChangeName() %>">
						<% } %>
					<% } %>
				</td>
				<td></td>
				
				<td class="reviewTr_img2" colspan="3" rowspan="5" align="center" style="width: 250px; height: 250px;" onclick="location.href='<%= contextPath %>/detail.po?bno='">
					<% for(Image2 img:list1) { %>
						<% if(po.getCreateDate() == img.getUploadDate()) { %>
						<img src="<%= contextPath %>/<%= img.getFilePath() + img.getChangeName() %>">
						<% } %>
					<% } %>
				</td>
				<td></td>
				
				<td class="reviewTr_img3" colspan="3" rowspan="5" align="center" style="width: 250px; height: 250px;" onclick="location/href='<%= contextPath %>/detail.po?bno='">
					<% for(Image2 img:list1) { %>
						<% if(po.getMemNo() == (img.getPostMem()) && po.getCreateDate() == img.getUploadDate()) { %>
						<img src="<%= contextPath %>/<%= img.getFilePath() + img.getChangeName() %>">
						<% } %>
					<% } %>
				</td>
				<td></td>
				
			</tr>

			
			<tr>
				<td></td>
				<td></td>
				<td></td>
			</tr>

			<tr>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			
 			<tr>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			
			<tr>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			
			<tr>
				<td colspan="3"><%= po.getCreateDate() %></td>
				<td></td>
				<td colspan="3"><%= po.getCreateDate() %></td>
				<td></td>
				<td colspan="3"><%= po.getCreateDate() %></td>
				<td></td>
			</tr>
			
			<tr class="review_image_tr">
				<td class="reviewTD_img1"><%= po.getPostNo() %></td>
				<td><%= po.getTitle() %></td>
				<td><%= po.getLikePost() %></td>
				<td></td>

				<td class="reviewTD_img2"><%= po.getPostNo() %></td>
				<td><%= po.getTitle() %></td>
				<td><%= po.getLikePost() %></td>
				<td></td>

				<td class="reviewTD_img3"><%= po.getPostNo() %></td>
				<td><%= po.getTitle() %></td>
				<td><%= po.getLikePost() %></td>
				<td></td>
			</tr>
			
			<tr>
				<td colspan="12" style="color: lightgray;">————————————————————————————————————————————————————————————</td>
			</tr>
			<% } %>
		<% } %>

		</table>
		<script>
			$(function(){
				$("#review_content_thumnail").on("click", function(){
					location.href='<%= contextPath %>/detail.im'
				})
			})
			
			$(function(){
			    $(".reviewTr_img1").on("click", function(){
					location.href = '<%= contextPath %>/detail.po?bno=' + $(".review_image_tr").children().eq(0).text();
		    	})
			})
		</script>

		<div class="paging-area" align="center">
			<% if(currentPage == 1) { %>
			<!-- 이전버튼 -->
				<button type="button" onclick="location.href='<%= contextPath %>/post.list?cpage=1'">
            		&lt;
           	 	</button>
            <% }else if(currentPage > 1){ %>
           	 	<button type="button" onclick="location.href='<%= contextPath %>/post.list?cpage=<%= currentPage - 1 %>'">
            		&lt;
           	 	</button>
            <% } %>
            
			<% for(int i=startPage; i<=endPage; i++) { %>
            	<% if(i == currentPage) { %>
            		<button type="button" disabled>
            			<%= i %>
           			</button>
           		<% }else { %>
         			 <button type="button" onclick="location.href='<%= contextPath %>/post.list?cpage=<%= i %>'">
           				<%= i %>
           			</button>
           		<% } %>
            <% } %>
            
            <% if(currentPage == maxPage) { %>
            <!-- 다음버튼 -->
            	<button type="button" onclick="location.href='<%= contextPath %>/post.list?cpage=<%= maxPage %>'">
            		&gt;
           	 	</button>
			<% }else if(currentPage > 0){ %>
				<button type="button" onclick="location.href='<%= contextPath %>/post.list?cpage=<%= currentPage + 1 %>'">
            		&gt;
           	 	</button> 
           	<% } %>
		</div>

	</form>

</body>
</html>