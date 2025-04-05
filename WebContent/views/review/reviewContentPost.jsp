<%@page import="com.kh.review.model.vo.Image"%>
<%@page import="com.kh.review.model.vo.Review"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.common.model.vo.PageInfo"%>
<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.awt.font.ImageGraphicAttribute"%>

<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list");
	
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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
body {
	padding:30px;
}

<!-- reviewContentPost -->
#reviewForm_CP1 {
	margin: auto;
}

/* #reviewTable_CP1 *{
	border: 5px solid black;
} */

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

.paging-area{
	margin-top: 20px;
}

.reviewTr_img1{
	cursor:pointer;
}

.reviewTr_img1 td{
	font: normal;
	font-size: 18px;
	font-weight: 700;
}

.reviewTr_img3 textarea{
	font: message-box;
	font-size: 22px;
	font-weight: bold;
	padding : 20px;
}

.reviewTd_img1{
	cursor: pointer;
	width: 280px;
	height: 250px;
	box-sizing: border-box;
}

.reviewTr_img1 img{
	width: 100%;
	height: 100%;
	box-sizing: border-box;
	cursor:pointer;
}

</style>
</head>
<body>
	
	<%@ include file="../common/headerNav.jsp" %>
<!-- 리뷰 콘텐츠 -->
<form action="" id="reviewForm_CP1" method="get" align="center">			
		<div class="reviewMP_td1">Review 리뷰</div>
			<div class="crossLine">──────────────────────────────────────────────────────────────────────</div>
				<div class="reviewContent_div_btn">
					<% if(loginUser != null) { %>
					<button type="button" class="reviewContent_btn" onclick="location.href='<%= contextPath %>/review.wr'">
						+ 리뷰 작성
					</button>
					<% }else { %>
						<button type="button" class="reviewContent_btn2" onclick="location.href='<%= contextPath %>/loginForm.me'">
							+ 리뷰 작성
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
					<% for(Review rv : list) { %>
					<tr class="reviewTr_img1">
						<td class="reviewTd_img1" rowspan="4">
							<input type="hidden" name="REVIEW_NO" value="<%= rv.getReviewNo() %>">
							<% if(rv.getImagePath() != null) { %>
							<img src="<%= contextPath %>/<%= rv.getImagePath() %>" alt="리뷰이미지">
							<% }else { %>
							<img src="<%= contextPath %>/resources/images/LOGO.jpg %>" alt="기본이미지">
							<% } %>
						</td>
						<td class="review_CreateDate" colspan="3" align="left" style="margin-left: 10px;"><%= rv.getCreateDate() %></td>

						<td></td>
					</tr>
					<tr class="reviewTr_img2">

						<td class="review_title1" align="left" style="margin-left: 10px;"><%= rv.getReviewNo() %></td>
						<td class="review_title2" colspan="2"><%= rv.getTitle() %></td>

						<td></td>
					</tr>

					<tr class="reviewTr_img3">

						<td colspan="4"><textarea cols="60" rows="10" style="resize: none; border-color: white;" disabled><%= rv.getContent() %></textarea></td>

					</tr>
					<tr>

						<td class="review_rating" style="width: 100px;"
						data-content="">가격 : <%= rv.getPrRating() %></td>
						<td class="review_rating" style="width: 100px;"
						data-content="">성분 : <%= rv.getpRating() %></td>
						<td class="review_rating" style="width: 100px;"
						data-content="">재구매 : <%= rv.getrRating() %></td>
						<td></td>
					</tr>
					<tr>
						<td colspan="4" style="height: 20px"></tr>
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
			</script>
			
			<script>
				$(function(){
					$(".reviewTr_img1").on("click", function(){
						location.href = '<%= contextPath %>/detail.re?bno=' + $(this).children().children().eq(0).val();
					})
				})
			
				$(function(){
					$(".reviewTr_img2").on("click", function(){
						location.href = '<%= contextPath %>/detail.re?bno=' + $(this).children().eq(0).text();
					})
				})
			</script>

			<div class="paging-area" align="center">
				<% if(currentPage != 1) { %>
				<!-- 이전버튼 -->
					<button type="button" onclick="location.href='<%= contextPath %>/review.li?cpage=<%= currentPage -1 %>'">
						&lt;
					</button>
				<% } %>
							
				<% for(int i=startPage; i<=endPage; i++) { %>
					<% if(i != currentPage) { %>
						<button type="button" onclick="location.href='<%= contextPath %>/review.li?cpage=<%= i %>'">
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
					<button type="button" onclick="location.href='<%= contextPath %>/review.li?cpage=<%= currentPage +1 %>'">
						&gt;
					</button>
				<% } %>
</form>
</body>
</html>