<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="bnavigator">
		<div id="navigator">
			<a href="#" id="category">☰ 카테고리</a>
			<ul class="category-menu">
				<li><a href="/beautyTalk/skinlist.pr">스킨케어</a></li>
				<li><a href="/beautyTalk/makeuplist.pr">메이크업</a></li>
				<li><a href="/beautyTalk/hairlist.pr">헤어케어</a></li>
			</ul>
			<ul id="navi">
				<li><a href="">HOME</a></li>
				<li><a href="./review.li?">리뷰</a></li>
				<li><a href="./post.list">게시글</a></li>
				<li><a href="${pageContext.request.contextPath}/selectPeople.pe">People</a></li>
				<li><a href="ranking.html">상품 랭킹</a></li>
			</ul>
		</div>
	</div>
	<div class="content">
		<div class="main_banner">
			<a href="" class="banner_link"> <img class="img_content"
				src="resources/images/mainbaner.png" alt="">
			</a>
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
</body>
</html>