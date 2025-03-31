<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
<!-- bestReview -->
		#form_bestReview1{
        width: 100%;
        height: 100%;
    }

    #table_bestReview{
        /* background-color: black; */
        width: 1000px;
        min-width: 700px;
        min-height: 300px;
        margin: auto;
        margin-top: 200px;
        box-sizing: border-box;
    }

    #table_bestReview span{
        border: 1px solid gray;
    }

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

		.div_bestReview{
			border: 1px solid black;
		}


</style>
</head>
<body>
<!-- bestReview -->
	<div>
		<form action="" id="form_bestReview1" method="">
				<table id="table_bestReview">
					<thead>
						<tr>
								<td colspan="15" align="center" style="height: 20px; color: black;"><h1>Best Review</h1></td>
						</tr>	        <tr>
												<td colspan="15" align="center" style="height: 20px; color: gray;"><h1></h1>유저들이 인정한 찐템 리뷰!!</td>
								</tr>
		<!-- 공백용 -->
								<tr style="height: 40px;">
										<td colspan="15"></td>
										
										
										
										
										
										
										
										
										
										
								
								</tr>
					</thead>
		<!-- 1번째 줄 -->
					<tbody>
								<tr>
									<tbody>
										<td onclick="location.href='http://www.daum.net'">
												<img src="<%= contextPath %>/resources/images/medicube.png" alt="" class="bestReviewImg1">
										</td>
										<td class="bestReview_11">
											<p>
												메디큐브<br>
												medicube
											</p>
										</td>
										<td colspan="2">
											<p>
												[1+1/흔적미백] <br>
												메디큐브 연어 PDRN 핑크앰블
											</p>
										</td>
										<td style="width: 40px;"></td>
									</span>
								
									<!--   -->
									<div>
										<td onclick="location.href='http://www.daum.net'">
												<img src="<%= contextPath %>/resources/images/medicube.png" alt="" class="bestReviewImg1">
										</td>
										<td class="bestReview_11">
											<p>
												메디큐브<br>
												medicube
											</p>
										</td>
										<td colspan="2">
											<p>
												[1+1/흔적미백] <br>
												메디큐브 연어 PDRN 핑크앰블
											</p>
										</td>
										<td style="width: 40px;"></td>
									</div>
									<div style="display: black">
										<td onclick="location.href='http://www.daum.net'">
												<img src="<%= contextPath %>/resources/images/medicube.png" alt="" class="bestReviewImg1">
										</td>
										<td class="bestReview_11">
											<p>
												메디큐브<br>
												medicube
											</p>
										</td>
										<td colspan="2">
											<p>
												[1+1/흔적미백] <br>
												메디큐브 연어 PDRN 핑크앰블
											</p>
										</td>
										<td style="width: 40px;"></td>
									</div>
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
												<img src="<%= contextPath %>/resources/images/bestreview1.png" alt="" class="bestReviewImg2">
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
												<img src="<%= contextPath %>/resources/images/bestreview1.png" alt="" class="bestReviewImg2">
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
												<img src="<%= contextPath %>/resources/images/bestreview1.png" alt="" class="bestReviewImg2">
										</td>
								</tr>

		<!-- 공백용 -->			
								<tr style="height: 40px;">
										<td colspan="15"></td>

				
										
										
										
										
										
										
										
										
										
								</tr>
		<!-- 3번째 줄 -->
								<tr>
										<td class="bestReviewImg1" onclick="location.href='http://www.daum.net'">
												<img src="<%= contextPath %>/resources/images/medicube.png" alt="" class="bestReviewImg1">
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
												<img src="<%= contextPath %>/resources/images/medicube.png" alt="" class="bestReviewImg1">
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
												<img src="<%= contextPath %>/resources/images/medicube.png" alt="" class="bestReviewImg1">
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
												<img src="<%= contextPath %>/resources/images/bestreview1.png" alt="" class="bestReviewImg2">
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
												<img src="<%= contextPath %>/resources/images/bestreview1.png" alt="" class="bestReviewImg2">
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
												<img src="<%= contextPath %>/resources/images/bestreview1.png" alt="" class="bestReviewImg2">
										</td>
								</tr>

								<!-- 공백용 -->			
								<tr style="height: 40px;">
										<td colspan="15" align="center">
												<a href="<%= contextPath %>/review.li">
													<button class="bestReviewBtn">더보기</button>
												</a>
										</td>


										
										
										
										
										
										
										
										
										
								</tr>
								
								<tr style="height: 40px;">
									<td colspan="15" align="center">
										<img src="<%= contextPath %>/resources/images/bestreview3.png" alt="" class="bestReviewImg3">
									</td>


									
									
									
									
									
									
									
									
									
							</tr>
					</tbody>
				</table>

		</form>
	</div>

</body>
</html>