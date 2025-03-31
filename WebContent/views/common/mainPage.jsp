<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

<!-- bestReview -->
#form_bestReview1 {
	width: 1000px;
	height: 350px;
	margin-top: 200px;
}

#table_bestReview {
	/* background-color: black; */
	width: 1000px;
	height: 350px;
	padding: 5px;
	margin: auto;
	box-sizing: border-box;
}

/* #table_bestReview td{
        border: 1px solid white;
        color:white;
    } */
.bestReviewImg1 {
	width: 50px;
	height: 50px;
}

.bestReviewImg2 {
	width: 150px;
	height: 150px;
}

.bestReviewImg3 {
	width: 1100px;
	height: 300px;
	margin: auto;
	margin-top: 40px;
}

.mainPage_img1{
	width: auto;
	min-width: 700px;
	height: auto;
	margin: auto;
}

.bestReviewBtn {
	margin: auto;
	margin-top: 20px;
	padding: 10px 20px;
	border: none;
	border-radius: 20px;
	color: white;
	font-size: 14px;
	font-weight: 700;
	background-color: palevioletred;
	
}

.bestReview_11 {
	width: 150px;
}

.bestReviewImg1, .bestReviewImg2, .bestReviewImg3 {
	cursor: pointer;
}

<!-- bestPost -->
#form_bestPost {
	width: 1100px;
	height: 330px;
}

#table_bestPost {
	/* background-color: black; */
	width: 1100px;
	height: 330px;
	margin: auto;
	margin-top: 50px;
	box-sizing: border-box;
}

#table_bestPost td {
	border: 1px solid white;
	color: black;
}

.bestpost1_bestPost, .bestpost2_bestPost, .bestpost3_bestPost {
	cursor: pointer;
}

.BestPost_btn{
	margin: auto;
	padding: 10px 20px;
	border: none;
	border-radius: 20px;
	background-color: palevioletred;
	color: white;
	font-size: 14px;
	font-weight: 700;
}

<!-- bestUser -->
/* 초기화 */
#bestUser_clear{
	margin: 0px;
	padding: 0px;
	box-sizing: border-box;
}

#BestUser_Title{
	font-size: 30px;
	font-weight: 900;
	min-width: 1100px;
	margin: auto;
	margin-top: 80px;
}

li {
	list-style-type: none;
}

/* 보여줄 구간의 높이와 넓이 설정 */
#slideShow {
	width: 990px;
	height: 330px;
	position: relative;
	margin: auto;
	overflow: hidden;
	/*리스트 형식으로 이미지를 일렬로 
		정렬할 것이기 때문에, 500px 밖으로 튀어 나간 이미지들은
		hidden으로 숨겨줘야됨*/
}

.slides {
	position: absolute;
	left: 0px;
	top: 0px;
	width: 2500px; /* 슬라이드할 사진과 마진 총 넓이 */
	transition: left 0.5s ease-out;
	/*ease-out: 처음에는 느렸다가 점점 빨라짐*/
}

/* 첫 번째 슬라이드 가운데에 정렬하기위해
	첫번째 슬라이드만 margin-left조정 */
.slides li:first-child {
	margin-left: 90px;
}

/* 슬라이드들 옆으로 정렬 */
.slides li:not(:last-child) {
	float: left;
	margin-right: 110px;
}

.slides li {
	float: left;
}

.controller span {
	position: absolute;
	background-color: transparent;
	color: black;
	text-align: center;
	border-radius: 50%;
	padding: 10px 20px;
	top: 50%;
	font-size: 1.3em;
	cursor: pointer;
}

/* 이전, 다음 화살표에 마우스 커서가 올라가 있을때 */
.controller span:hover {
	background-color: rgba(128, 128, 128, 0.11);
}

.prev {
	margin-top: -80px;
	left: 10px;
}

/* 이전 화살표에 마우스 커서가 올라가 있을때 
	이전 화살표가 살짝 왼쪽으로 이동하는 효과*/
.prev:hover {
	margin-top: -80px;
	transform: translateX(-10px);
}

.next {
	margin-top: -80px;
	right: 10px;
}

/* 다음 화살표에 마우스 커서가 올라가 있을때 
	이전 화살표가 살짝 오른쪽으로 이동하는 효과*/
.next:hover {
	margin-top: -80px;
	transform: translateX(10px);
}

<!-- footer -->
#footer_footer {
}

#form_footer {
	background-color: black;
	width: 1100px;;
	height: 330px;
	margin: auto;
}

/* #table_footer td{
    border: 1px solid white;
} */

#table_footer {
	color: white;
	width: 1000px;
	height: 330px;
	box-sizing: border-box;
	padding: 10px;
	font-size: 14px;
	font-style: normal;
	font-weight: 600;
}

.logo1_footer {
	width: 100%;
}

.kakao_footer, .facebook_footer, .instar_footer, .youtube_footer {
	width: 50px;
}

</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp"%>

	<!-- bestReview -->
	<div align="center">
		<form action="" id="form_bestReview1" method="">
			<table id="table_bestReview">
				<tr>
					<td colspan="15" align="center" style="height: 20px; color: black;"><h1>Best
							Review</h1></td>
				</tr>
				<tr>
					<td colspan="15" align="center" style="height: 20px; color: gray;"><h1></h1>유저들이
						인정한 찐템 리뷰!!</td>
				</tr>
				<!-- 공백용 -->
				<tr style="height: 40px;">
					<td colspan="15"></td>











				</tr>
<!-- 1번째 줄 -->

				<tr>
					<td onclick="location.href='http://www.daum.net'"><img
						src="resources/images/medicube.png" alt="" class="bestReviewImg1">
					</td>
					<td class="bestReview_11">
						<div>
							<p>
								메디큐브<br> medicube
							</p>
						</div>
					</td>
					<td colspan="2">
						<div>
							[1+1/흔적미백] <br> 메디큐브 연어 PDRN 핑크앰블
						</div>
					</td>

					<td style="width: 40px;"></td>
					<td onclick="location.href='http://www.daum.net'"><img
						src="resources/images/medicube.png" alt="" class="bestReviewImg1">
					</td>
					<td class="bestReview_11">
						<div>
							메디큐브<br> medicube
						</div>
					</td>
					<td colspan="2">
						<div>
							[1+1/흔적미백] <br> 메디큐브 연어 PDRN 핑크앰블
						</div>
					</td>
					<td style="width: 40px;"></td>
					<td onclick="location.href='http://www.daum.net'"><img
						src="resources/images/medicube.png" alt="" class="bestReviewImg1">
					</td>
					<td class="bestReview_11">
						<div>
							메디큐브<br> medicube
						</div>
					</td>
					<td colspan="2">
						<div>
							[1+1/흔적미백] <br> 메디큐브 연어 PDRN 핑크앰블
						</div>
					</td>
				</tr>
<!-- 2번째 줄이 필요하네 -->
				<tr>
					<td colspan="3">
						<div style="color: gray;">
							1 믿고 쓰는 메디큐브 <br> 2 어쩌고 저쩌고 <br> 3 3등 리뷰입니다. <br>
						</div>
					</td>


					<td onclick="location.href='http://www.daum.net'"><img
						src="resources/images/bestreview1.png" alt=""
						class="bestReviewImg2"></td>
					<td style="width: 40px;"></td>
					<td colspan="3">
						<div style="color: gray;">
							1 믿고 쓰는 메디큐브 <br> 2 어쩌고 저쩌고 <br> 3 3등 리뷰입니다. <br>
						</div>
					</td>


					<td onclick="location.href='http://www.daum.net'"><img
						src="resources/images/bestreview1.png" alt=""
						class="bestReviewImg2"></td>
					<td style="width: 40px;"></td>
					<td colspan="3">
						<div style="color: gray;">
							1 믿고 쓰는 메디큐브 <br> 2 어쩌고 저쩌고 <br> 3 3등 리뷰입니다. <br>
						</div>
					</td>


					<td onclick="location.href='http://www.daum.net'"><img
						src="resources/images/bestreview1.png" alt=""
						class="bestReviewImg2"></td>
				</tr>

				<!-- 공백용 -->
				<tr style="height: 40px;">
					<td colspan="15"></td>











				</tr>

<!-- 공백용 -->
				<tr style="height: 40px;">
					<td colspan="15" align="center">
						<button onclick="location.href='https://www.naver.com'"
							class="bestReviewBtn">
								더보기
						</button>
					</td>











				</tr>

			</table>
			
			<div class="mainPage_img1">
				<img src="resources/images/bestreview3.png" alt=""
						class="bestReviewImg3">
			</div>

		</form>
	</div>

	<!-- bestPost -->
	<div>
		<form id="form_bestPost">
			<table id="table_bestPost">
				<tr>
					<td colspan="7" Style="color: black;" align="center"><h1>Best
							Post</h1></td>






				</tr>
				<tr>
					<td colspan="7" Style="color: gray;" align="center">뷰티 고수들의 찐
						노하우 공개!</td>






				</tr>
				<tr>
					<td style="width: 80px;"></td>
					<td class="bestpost1_bestPost"
						onclick="location.href='http://yahoo.co.jp'"
						style="width: 300px; height: 200px;"><img
						src="resources/images/bestpost1.png"></td>
					<td style="width: 20px;"></td>
					<td class="bestpost2_bestPost"
						onclick="location.href='http://www.naver.com'"
						style="width: 300px; height: 200px;"><img
						src="resources/images/bestpost2.png"></td>
					<td style="width: 20px;"></td>
					<td class="bestpost3_bestPost"
						onclick="location.href='http://www.daum.net'"
						style="width: 300px; height: 200px;"><img
						src="resources/images/bestpost3.png"></td>
					<td style="width: 80px;"></td>
				</tr>
				<tr>
					<td></td>
					<td style="padding: 10px;">Minsco 민스코</td>
					<td></td>
					<td style="padding: 10px;">안다 ANDA</td>
					<td></td>
					<td style="padding: 10px;">Jessica Vu</td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td style="padding: 10px;">8천원대❓두겹광택❓ NEW 롬앤 더 쥬시 래스팅 틴트 23컬러
						리뷰 (리뉴얼 포인트, 신컬러 5가지)</td>
					<td></td>
					<td style="padding: 10px;">인스타 셀럽st 쿨톤 핑크 메이크업🎀🖤 | 데일리 쿨톤템
						한가득 추천🛒</td>
					<td></td>
					<td style="padding: 10px;">Chic Soft Glam Makeup 🦢 #grwm</td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td style="padding: 10px;">날짜, 좋아요 수</td>
					<td></td>
					<td style="padding: 10px;">날짜, 좋아요 수</td>
					<td></td>
					<td style="padding: 10px;">날짜, 좋아요 수</td>
					<td></td>
				</tr>
				<tr>
					<td colspan="7" align="center" style="height: 100px;">
						<button type="button" class="BestPost_btn"
							onclick="location.href='http://www.naver.com/'">
							 더보기
						</button>
					</td>






				</tr>

			</table>

		</form>
	</div>

<!-- bestUser -->
	<div id="bestUser_clear">
			<div id="BestUser_Title" align="center">
				Today's Best User
			</div>
			<div id="slideShow">
				<ul class="slides">
					<li><img src="resources/images/bestuser1.png?text=2"></li>
					<li><img src="resources/images/bestuser2.png?text=3"></li>
					<li><img src="resources/images/bestuser3.png?text=4"></li>
					<li><img src="resources/images/bestuser4.png?text=5"></li>
					<li><img src="resources/images/bestuser4.png?text=5"></li>
					<li><img src="resources/images/bestuser4.png?text=5"></li>
					<li><img src="resources/images/bestuser4.png?text=5"></li>
					<li><img src="resources/images/bestuser4.png?text=5"></li>
					<li><img src="resources/images/bestuser4.png?text=5"></li>
				</ul>
				<p class="controller">

					<!-- &lang: 왼쪽 방향 화살표
					&rang: 오른쪽 방향 화살표 -->
					<span class="prev">&lang;</span> <span class="next">&rang;</span>
				</p>
			</div>

			<script>
				const slides = document.querySelector('.slides'); //전체 슬라이드 컨테이너
				const slideImg = document.querySelectorAll('.slides li'); //모든 슬라이드들
				const slideCount = slideImg.length; // 슬라이드 개수
				let currentIdx = 0; //현재 슬라이드 index
				
				const prev = document.querySelector('.prev'); //이전 버튼
				const next = document.querySelector('.next'); //다음 버튼
				const slideWidth = 400; //한개의 슬라이드 넓이
				const slideMargin = 100; //슬라이드간의 margin 값
				
				//전체 슬라이드 컨테이너 넓이 설정
				slides.style.width = (slideWidth + slideMargin) * slideCount + 'px';
				
				function moveSlide(num) {
					slides.style.left = -num * 290 + 'px';
					currentIdx = num;
				}
				
				prev.addEventListener('click', function() {
					/*첫 번째 슬라이드로 표시 됐을때는 
					이전 버튼 눌러도 아무런 반응 없게 하기 위해 
					currentIdx !==0일때만 moveSlide 함수 불러옴 */
					if (currentIdx !== 0) {
						moveSlide(currentIdx - 1);
					}
				});

				next.addEventListener('click', function() {
					/* 마지막 슬라이드로 표시 됐을때는 
					다음 버튼 눌러도 아무런 반응 없게 하기 위해
					currentIdx !==slideCount - 1 일때만 
					moveSlide 함수 불러옴 */
					if (currentIdx !== 7) {
						moveSlide(currentIdx + 1);
					}else{
						return moveSlide(0);
					}
					
				});
			</script>
		</div>
<!-- footer -->
<footer id="footer_footer">
	<form action="" id="form_footer" method="">
		<table id="table_footer" style="text-align: left;">
			<tr>
				<td rowspan="4" style="width: 30%;" class="logo1_footer">
					<img src="<%= contextPath %>/resources/images/LOGO.jpg" alt="">
				</td>

				<td style="width: 15%; height: 30%; padding: 5px;">뷰티톡 소개</td>
				<td style="width: 15%; padding: 5px;">이용 약관</td>
				<td style="width: 15%; padding: 5px;">개인정보처리방침</td>
				<td style="width: 15%; padding: 5px;">고객 지원</td>
				<td style="width: 50px;"></td>
				<td style="width: 50px;"></td>
				<td style="width: 50px;"></td>
				<td style="width: 50px;"></td>
			</tr>
			<tr>
				<td colspan="2" style="height: 25%; padding: 5px;">email:
					beautytalk@abcd.com
				</td>

				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>

				<td style="height: 25%; padding: 5px;">tel: 02-123-4567</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td colspan="3">© 2025 Brand, Inc. • Privacy • Terms • Sitemap</td>


				<td class="kakao_footer">
					<img src="<%= contextPath %>/resources/images/kakao.png" alt="">
				</td>
				<td class="facebook_footer">
					<img src="<%= contextPath %>/resources/images/Facebook_logo.png" alt="">
				</td>
				<td class="instar_footer">
					<img src="<%= contextPath %>/resources/images/Instagram.png" alt="">
				</td>
				<td class="youtube_footer">
					<img src="<%= contextPath %>/resources/images/Youtube_logo.png" alt="">
				</td>
			</tr>
		</table>
	</form>
</footer>

</body>
</html>