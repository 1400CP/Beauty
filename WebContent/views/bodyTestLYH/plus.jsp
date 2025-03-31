<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member)session.getAttribute("loginUser");
	String alertMsg = (String)session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    body{
        width: 100%;
        min-width: 1100px;
        height: auto;
        margin: auto;
    }

    div,input{box-sizing: border-box;}
    .wrap{width: 1100px; height: 120px; margin: auto;}

    img{
        width: 100%;
    }

    #header{width: 100%; height: 100%;}

    /* #header, #header1, #header2, #header3{
        border: 1px solid red;
    } */

    #header>div{height: 100%; float: left; box-sizing: border-box;}

    #header1{height: 100%;width: 20%;}
    #header2{height: 100%;width: 60%;}
    #header3{width: 20%;}

    #header1 {
        width: 20%;
        display: flex;
        align-items: center; /* 세로 중앙 정렬 */
        justify-content: center; /* 가로 중앙 정렬 */
    }

    #header1 img {
        width: 200px;
    }

    #header_2{position: relative;}

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
    
    #bnavigator{
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
    
    #category{
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

    .category-menu{
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

    .category-menu a{
        display: block;
        padding: 8px 12px;
        text-decoration: none;
        color: black;
        transition: background 0.3s ease, color 0.3s ease;
    }

    .category-menu a:hover{
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
    
    #navi>li{
        width: 150px;
        text-align: center;
    }
    
    #navi a{
        text-decoration: none;
        color: black;
        font-size: 15px;
        font-weight: 900;
        display: block;
        width: 100%;
        height: 100%;
        line-height: 44px;
    }

    #navi a:hover{
        color: palevioletred;
    }

    .category-menu>li{
        list-style: none;
    }
    .content{
        width: 1020px;
        height: 100%;
        margin: 0 auto;
    }
    .main_banner{
        width: 100%;
        height: 450px;
        position: relative;
        float: left;
        display: block;
    }
    .banner_link{
        height: 450px;
    }
    .img_content{
        margin: 0 auto;
        box-sizing: border-box;
        position: absolute;
        width: 100%;
        height: 450px

        
    }
    .banner_link{
        text-decoration: none;
        width: 100%;
        height: 450px;
        color: #666;
        margin: 0;
        padding: 0;
        border: 0;
        display: block;
    }


<!-- bestReview -->
    #form_bestReview1{
        width: 1000px;
        height: 350px;
        margin-top: 200px;
    }

    #table_bestReview{
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

    .bestReviewImg1{
        width: 50px;
        height: 50px;
    }
    .bestReviewImg2{
        width: 150px;
        height: 150px;
    }
    .bestReviewImg3{
        width: 1100px;
        height: 300px;
        margin: auto;
        margin-top: 40px;
    }
    .bestReviewBtn{
        margin: auto;
        margin-top: 20px;

    }

    .bestReview_11{
        width: 150px;
    }

    .bestReviewImg1, .bestReviewImg2, .bestReviewImg3{
        cursor: pointer;
    }


<!-- best post -->
    #form_bestPost{
        width: 1100px;
        height: 330px;
    }

    #table_bestPost{
        /* background-color: black; */
        width: 1100px;
        height: 330px;
        margin: auto;
        margin-top: 50px;
        box-sizing: border-box;
    }

    #table_bestPost td{
        border: 1px solid white;
        color:black;
    }

    .bestpost1_bestPost, .bestpost2_bestPost, .bestpost3_bestPost{
        cursor: pointer;
    }



<!-- best user -->
/* 초기화 */
	*{
		margin: 0px;
		padding: 0px;
		box-sizing: border-box;
	}

	li{
		list-style-type: none;
	}

	/* 보여줄 구간의 높이와 넓이 설정 */
	#slideShow{
		width: 990px;
		height: 330px;
		position: relative;
		margin: 80px auto;
		overflow: hidden;
		/*리스트 형식으로 이미지를 일렬로 
		정렬할 것이기 때문에, 500px 밖으로 튀어 나간 이미지들은
		hidden으로 숨겨줘야됨*/
	}

	.slides{
		position: absolute;
		left: 0px;
		top: 0px;
		width: 2500px; /* 슬라이드할 사진과 마진 총 넓이 */
		transition: left 0.5s ease-out; 
		/*ease-out: 처음에는 느렸다가 점점 빨라짐*/
	}

	/* 첫 번째 슬라이드 가운데에 정렬하기위해
	첫번째 슬라이드만 margin-left조정 */
	.slides li:first-child{
		margin-left: 90px;
	}

	/* 슬라이드들 옆으로 정렬 */
	.slides li:not(:last-child){
		float: left;
		margin-right: 110px;
	}

	.slides li{
		float: left;
	}

	.controller span{
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
	.controller span:hover{
		background-color: rgba(128, 128, 128, 0.11);
	}

	.prev{
		margin-top: -80px;
		left: 10px;
	}

	/* 이전 화살표에 마우스 커서가 올라가 있을때 
	이전 화살표가 살짝 왼쪽으로 이동하는 효과*/
	.prev:hover{
		margin-top: -80px;
		transform: translateX(-10px);
	}

	.next{
		margin-top: -80px;
		right: 10px;
	}

	/* 다음 화살표에 마우스 커서가 올라가 있을때 
	이전 화살표가 살짝 오른쪽으로 이동하는 효과*/
	.next:hover{
		margin-top: -80px;
		transform: translateX(10px);
	}

<!-- footer -->
    #footer_footer{}

	#form_footer{
        background-color: black;
        width: 1100px;
        height: 280px;
        margin: auto;
        margin-top: 200px;
	}

    /* #table_footer td{
        border: 1px solid white;
    } */
	
    #table_footer{
        color: white;
        width: 1000px;
       	height: 280px;
        box-sizing: border-box;
        padding: 10px;
        font-size: 14px;
        font-style: normal;
        font-weight: 600;
    }

    .logo1_footer{background-image: url("resoureces/images/LOGO.jpg"");}
    .kakao_footer{background-image: url("resoureces/images/kakao_logo.png");}
    .facebook_footer{background-image: url("resoureces/images/Facebook_logo.png");}
    .instar_footer{background-image: url("resoureces/images/Instar_logo.png");}
    .youtube_footer{background-image: url("resoureces/images/Youtube_logo.png");}

    .logo1_footer{
        width: 100%;
        background-position: center;
        background-repeat: no-repeat;
        background-size: contain;
    }
    .kakao_footer, .facebook_footer, .instar_footer, .youtube_footer{
        width: 50px;
        background-position: center;
        background-repeat: no-repeat;
        background-size: contain;
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
                    <a href="<%= contextPath %>/loginForm.me">로그인</a>
                    <span>|</span>
                    <a href="enrollForm.me">회원가입</a>
          </div> 
        


                <% }else { %>
                <!-- case2. 로그인 후 -->
                <div id="header3_top">

                    <a href=""><img src="resources/images/2.PNG" alt="메시지"></a>
                    <a href=""><img src="resources/images/3.PNG" alt="알림"></a>
                    <a href="">로그아웃</a>
                    <span>|</span>
                    <a href="<%= contextPath %>/views/member/memberEnrollForm.jsp">마이페이지</a>
                </div>
                <div id="header3_bottom">
                    <span class="username"><b><%= loginUser.getUserName() %></b><b>님</b>,</span>
                    <span>환영합니다!</span>
                    <a href=""><img src="" alt="프로필 사진"></a>
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
                <li><a href="reviews.html">Reviews</a></li>
                <li><a href="posts.html">Posts</a></li>
                <li><a href="people.html">People</a></li>
                <li><a href="ranking.html">상품 랭킹</a></li>
            </ul>
        </div>
    </div>
        <div class="content">
            <div class="main_banner">
                <a href="" class="banner_link">
                    <img class="img_content" src="resources/images/mainbaner.png" alt="">
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

<!-- bestReview -->
<div align="center">
	<form action="" id="form_bestReview1" method="">
			<table id="table_bestReview">
					<tr>
							<td colspan="15" align="center" style="height: 20px; color: black;"><h1>Best Review</h1></td>
					</tr>	        <tr>
											<td colspan="15" align="center" style="height: 20px; color: gray;"><h1></h1>유저들이 인정한 찐템 리뷰!!</td>
							</tr>
	<!-- 공백용 -->
							<tr style="height: 40px;">
									<td colspan="15"></td>
									
									
									
									
									
									
									
									
									
									
							
							</tr>
	<!-- 1번째 줄 -->

							<tr>
									<td onclick="location.href='http://www.daum.net'">
											<img src="resources/images/medicube.png" alt="" class="bestReviewImg1">
									</td>
									<td class="bestReview_11">
											<div>
													<p>
															메디큐브<br>
															medicube
													</p>
											</div>
									</td>
									<td colspan="2">
											<div>
													[1+1/흔적미백] <br>
													메디큐브 연어 PDRN 핑크앰블
											</div>
									</td>

									<td style="width: 40px;"></td>
									<td onclick="location.href='http://www.daum.net'">
											<img src="resources/images/medicube.png" alt="" class="bestReviewImg1">
									</td>
									<td class="bestReview_11">
											<div>
													메디큐브<br>
													medicube
											</div>
									</td>
									<td colspan="2">
											<div>
													[1+1/흔적미백] <br>
													메디큐브 연어 PDRN 핑크앰블
											</div>
									</td>
									<td style="width: 40px;"></td>
									<td onclick="location.href='http://www.daum.net'">
											<img src="resources/images/medicube.png" alt="" class="bestReviewImg1">
									</td>
									<td class="bestReview_11">
											<div>
													메디큐브<br>
													medicube
											</div>
									</td>
									<td colspan="2">
											<div>
													[1+1/흔적미백] <br>
													메디큐브 연어 PDRN 핑크앰블
											</div>
									</td>
							</tr>
	<!-- 2번째 줄이 필요하네 -->
							<tr>
									<td colspan="3">
											<div style="color: gray;">
													1 믿고 쓰는 메디큐브 <br>
													2 어쩌고 저쩌고 <br>
													3 3등 리뷰입니다. <br>
											</div>
									</td>
									
									
									<td onclick="location.href='http://www.daum.net'">
											<img src="resources/images/bestreview1.png" alt="" class="bestReviewImg2">
									</td>
									<td style="width: 40px;"></td>
									<td colspan="3">
											<div style="color: gray;">
													1 믿고 쓰는 메디큐브 <br>
													2 어쩌고 저쩌고 <br>
													3 3등 리뷰입니다. <br>
											</div>
									</td>
									
									
									<td onclick="location.href='http://www.daum.net'">
											<img src="resources/images/bestreview1.png" alt="" class="bestReviewImg2">
									</td>
									<td style="width: 40px;"></td>
									<td colspan="3">
											<div style="color: gray;">
													1 믿고 쓰는 메디큐브 <br>
													2 어쩌고 저쩌고 <br>
													3 3등 리뷰입니다. <br>
											</div>
									</td>
									
									
									<td onclick="location.href='http://www.daum.net'">
											<img src="resources/images/bestreview1.png" alt="" class="bestReviewImg2">
									</td>
							</tr>

	<!-- 공백용 -->			
							<tr style="height: 40px;">
									<td colspan="15"></td>

			
									
									
									
									
									
									
									
									
									
							</tr>
	<!-- 3번째 줄 -->
							<tr>
									<td class="bestReviewImg1" onclick="location.href='http://www.daum.net'">
											<img src="resources/images/medicube.png" alt="" class="bestReviewImg1">
									</td>
									<td class="bestReview_11">
											<div>
													메디큐브<br>
													medicube
											</div>
									</td>
									<td colspan="2">
											<div>
													[1+1/흔적미백] <br>
													메디큐브 연어 PDRN 핑크앰블
											</div>
									</td>

									<td style="width: 40px;"></td>
									<td class="bestReviewImg1" onclick="location.href='http://www.daum.net'">
											<img src="resources/images/medicube.png" alt="" class="bestReviewImg1">
									</td>
									<td class="bestReview_11">
											<div>
													메디큐브<br>
													medicube
											</div>
									</td>
									<td colspan="2">
											<div>
													[1+1/흔적미백] <br>
													메디큐브 연어 PDRN 핑크앰블
											</div>
									</td>
									<td style="width: 40px;"></td>
									<td class="bestReviewImg1" onclick="location.href='http://www.daum.net'">
											<img src="resources/images/medicube.png" alt="" class="bestReviewImg1">
									</td>
									<td class="bestReview_11">
											<div>
													메디큐브<br>
													medicube
											</div>
									</td>
									<td colspan="2">
											<div>
													[1+1/흔적미백] <br>
													메디큐브 연어 PDRN 핑크앰블
											</div>
									</td>
							</tr>
	<!-- 4번째 줄이 필요하네 -->
							<tr>
									<td colspan="3">
											<div style="color: gray;">
													1 믿고 쓰는 메디큐브 <br>
													2 어쩌고 저쩌고 <br>
													3 3등 리뷰입니다. <br>
											</div>
									</td>
									
									
									<td onclick="location.href='http://www.daum.net'">
											<img src="resources/images/bestreview1.png" alt="" class="bestReviewImg2">
									</td>
									<td style="width: 40px;"></td>
									<td colspan="3">
											<div style="color: gray;">
													1 믿고 쓰는 메디큐브 <br>
													2 어쩌고 저쩌고 <br>
													3 3등 리뷰입니다. <br>
											</div>
									</td>
									
									
									<td onclick="location.href='http://www.daum.net'">
											<img src="resources/images/bestreview1.png" alt="" class="bestReviewImg2">
									</td>
									<td style="width: 40px;"></td>
									<td colspan="3">
											<div style="color: gray;">
													1 믿고 쓰는 메디큐브 <br>
													2 어쩌고 저쩌고 <br>
													3 3등 리뷰입니다. <br>
											</div>
									</td>
									
									
									<td onclick="location.href='http://www.daum.net'">
											<img src="resources/images/bestreview1.png" alt="" class="bestReviewImg2">
									</td>
							</tr>

							<!-- 공백용 -->			
							<tr style="height: 40px;">
									<td colspan="15" align="center">
											<button style="color: blueviolet;" onclick="location.href='https://www.naver.com'" class="bestReviewBtn">더보기</button>
									</td>


									
									
									
									
									
									
									
									
									
							</tr>
							<tr style="height: 40px;">
								<td colspan="15" align="center">
									<img src="resources/images/bestreview3.png" alt="" class="bestReviewImg3">
								</td>


								
								
								
								
								
								
								
								
								
						</tr>

			</table>

	</form>
	</div>

<!-- best post -->
    <div>
    <form id="form_bestPost">
        <table id="table_bestPost">
            <tr>
                <td colspan="7" Style="color: black;" align="center"><h1>Best Post</h1></td>






            </tr>
            <tr>
                <td colspan="7" Style="color: gray;" align="center">뷰티 고수들의 찐 노하우 공개!</td>






            </tr>
            <tr>
                <td style="width: 80px;"></td>
                <td class="bestpost1_bestPost" onclick="location.href='http://yahoo.co.jp'" style="width: 300px; height: 200px;">
                    <img src="resources/images/bestpost1.png">
                </td>
                <td style="width: 20px;"></td>
                <td class="bestpost2_bestPost" onclick="location.href='http://www.naver.com'" style="width: 300px; height: 200px;">
                    <img src="resources/images/bestpost2.png">
                </td>
                <td style="width: 20px;"></td>
                <td class="bestpost3_bestPost" onclick="location.href='http://www.daum.net'" style="width: 300px; height: 200px;">
                    <img src="resources/images/bestpost3.png">
                </td>
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
                <td style="padding: 10px;">8천원대❓두겹광택❓ NEW 롬앤 더 쥬시 래스팅 틴트 23컬러 리뷰 (리뉴얼 포인트, 신컬러 5가지)</td>
                <td></td>
                <td style="padding: 10px;">인스타 셀럽st 쿨톤 핑크 메이크업🎀🖤 | 데일리 쿨톤템 한가득 추천🛒</td>
                <td></td>
                <td style="padding: 10px;">Chic Soft Glam Makeup 🦢 #grwm</td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td style="padding: 10px;">
                    날짜, 좋아요 수
                </td>
                <td></td>
                <td style="padding: 10px;">
                    날짜, 좋아요 수
                </td>
                <td></td>
                <td style="padding: 10px;">
                    날짜, 좋아요 수
                </td>
                <td></td>
            </tr>
            <tr>
                <td colspan="7" align="center">
                    <button type="button" onclick="location.href='http://www.naver.com/'">더보기</button>
                </td>






            </tr>

        </table>

    </form>
    </div>

<!-- best user -->
<div id="slideShow">
    <ul class="slides">
			<li>
				<img src="resources/images/bestuser1.png?text=2">
			</li>
			<li>
				<img src="resources/images/bestuser2.png?text=3">
			</li>
			<li>
				<img src="resources/images/bestuser3.png?text=4">
			</li>
			<li>
				<img src="resources/images/bestuser4.png?text=5">
			</li>
			<li>
				<img src="resources/images/bestuser4.png?text=5">
			</li>
			<li>
				<img src="resources/images/bestuser4.png?text=5">
			</li>
			<li>
				<img src="resources/images/bestuser4.png?text=5">
			</li>
			<li>
				<img src="resources/images/bestuser4.png?text=5">
			</li>
			<li>
				<img src="resources/images/bestuser4.png?text=5">
			</li>
		</ul>
		<p class="controller">
	
			<!-- &lang: 왼쪽 방향 화살표
			&rang: 오른쪽 방향 화살표 -->
			<span class="prev">&lang;</span>  
			<span class="next">&rang;</span>
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

<!-- footer -->
    <footer id="footer_footer">
        <form action="" id="form_footer" method="">
            <table id="table_footer" style="text-align: left;">
                <tr>
                    <td rowspan="4" style="width: 30%;" class="logo1_footer"></td>
                    
                    <td style="width: 15%; height: 30%; padding: 5px; ">뷰티톡 소개</td>
                    <td style="width: 15%; padding: 5px;">이용 약관</td>
                    <td style="width: 15%; padding: 5px;">개인정보처리방침</td>
                    <td style="width: 15%; padding: 5px;">고객 지원</td>
                    <td style="width: 50px;"></td>
                    <td style="width: 50px;"></td>
                    <td style="width: 50px;"></td>
                    <td style="width: 50px;"></td>
                </tr>
                <tr>
                    <td colspan="2" style="height: 25%; padding: 5px; ">email: beautytalk@abcd.com</td>

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


                    <td class="kakao_footer"></td>
                    <td class="facebook_footer"></td>
                    <td class="instar_footer"></td>
                    <td class="youtube_footer"></td>
                </tr>
            </table>
        </form>
    </footer>
	
</body>
</html>