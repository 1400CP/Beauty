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

</style>
</head>
<body>
<!-- best user -->
  <div id="slideShow">
    <ul class="slides">
			<li>
				<img src="<%= contextPath %>/images/bestuser1.png?text=2">
			</li>
			<li>
				<img src="<%= contextPath %>/images/bestuser2.png?text=3">
			</li>
			<li>
				<img src="<%= contextPath %>/images/bestuser3.png?text=4">
			</li>
			<li>
				<img src="<%= contextPath %>/images/bestuser4.png?text=5">
			</li>
			<li>
				<img src="<%= contextPath %>/images/bestuser4.png?text=5">
			</li>
			<li>
				<img src="<%= contextPath %>/images/bestuser4.png?text=5">
			</li>
			<li>
				<img src="<%= contextPath %>/images/bestuser4.png?text=5">
			</li>
			<li>
				<img src="<%= contextPath %>/images/bestuser4.png?text=5">
			</li>
			<li>
				<img src="<%= contextPath %>/images/bestuser4.png?text=5">
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

</body>
</html>