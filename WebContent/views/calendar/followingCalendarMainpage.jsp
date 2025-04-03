<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member)session.getAttribute("loginUser");
	String alertMsg = (String)session.getAttribute("alertMsg");
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
	// 팔로우한 사람의 회원번호, 아이디, 이름
	Member userName = (Member)request.getAttribute("userName");

	// 선택한 사람의 회원 이름
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.10/index.global.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<title>Insert title here</title>
<style>

	div{
      box-sizing: border-box;
      /* border: 1px solid lightblue; */
    }

    .wrap{
      width: 100%; /* 뷰포트 기준 화면 전체 너비 100% 다 사용 */
      max-width: 1300px; /* 단, 최대 너비는 1300px 넘지 않도록 */
      height: 1000px;
      margin: auto;

      /* header, navigator, content, footer를 세로 배치! */

      display: flex;
      /* header, navigator, content, footer 자동으로 width가 부모의 100% 차지하게 됨 */
    }

    .left{
      width: 20%;
      display: flex;
      flex-direction: column;
    }

    .L1, .L3{
      height: 35%;
    }

    .L2{
      height: 30%;
      display: flex;
      flex-direction: column;
      justify-content: flex-end;
      align-items: center;
    }

    .right{
      width: 80%;
      display: flex;
      flex-direction: column;
    }

    .R1{height: 10%;}

    .R2{height: 90%;}

    .logo-container {
      width: 230px;
      height: 50px;
      margin-top: 30px;
      margin-bottom: 20px;
      background-size: contain;
      background-position: center;
      background-repeat: no-repeat;
    }

    .logo-container img{
      width: 100%;
      height: 100%;
    }

    .sidebar-menu {
      display: flex;
      flex-direction: column;
      gap: 10px;
      margin-left: 15px;
    }

    .menu-item {
      display: flex;
      align-items: center;
      gap: 10px;
      padding: 10px 15px;
      font-size: 16px;
      color: #666;
      cursor: pointer;
      border-radius: 50px;
      width: 200px;
      transition: background 0.2s, color 0.2s;
    }

    .menu-item i {
      font-size: 18px;
    }

    .menu-item.active {
      background-color: #fdeef2;
      color: #d81b60;
      font-weight: bold;
    }

    .R1 {
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 15px 20px;
    }

    .R1-content {
      display: flex;
      justify-content: space-between;
      width: 100%;
      height: 100%;
      align-items: center;
    }

    .title {
      font-size: 25px;
      color: #333;
    }

    .highlight {
      color: #d81b60;
      font-weight: bold;
    }

    .icons {
      display: flex;
      align-items: center;
      gap: 20px;
    }

    .icons i {
      font-size: 18px;
      color: #666;
      cursor: pointer;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .icons i img {
      width: 25px;  /* 종 아이콘 크기 줄이기 */
      height: 25px;
      object-fit: contain;  /* 비율 유지 */
    }

    .profile-img {
      width: 50px;
      height: 50px;
      border-radius: 50%;
      overflow: hidden; /* 이미지가 동그란 영역을 넘지 않도록 */
      display: flex;
      align-items: center;
      justify-content: center;
      cursor: pointer;
      margin-left: 15px;
    }

    .profile-img img {
      width: 100%;
      height: 100%;
      object-fit: cover; /* 이미지가 div를 꽉 채우면서 비율 유지 */
    }

    .L3 {
      display: flex;
      align-items: flex-start; /* 내용을 상단 정렬 */
      justify-content: center;
    }

    .L3-content {
      background-color: #fdeef2; /* 연한 핑크 */
      border-radius: 15px;
      padding: 12px;
      text-align: center;
      width: 100%; /* 너비 조정 */
      height: 100%;
      max-width: 215px; /* 너무 커지지 않도록 제한 */
      margin: 0 auto; /* 정렬 중앙 */
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: space-between; /* 내부 요소를 위/아래로 정렬 */
    }

    .L3-content h3 {
      font-size: 16px;
      font-weight: bold;
      color: #d81b60;
      margin-bottom: 10px;
      margin-top: 0px;
    }

    .following-list {
      display: flex;
      flex-direction: column;
      gap: 8px;
      width: 100%;
      height: 280px; 
      overflow-y: auto;
      overflow-x: hidden;
    }

    .following-item {
      display: flex;
      align-items: center;
      gap: 12px;
      padding: 8px;
      background: white;
      border-radius: 10px;
      text-decoration: none;
      transition: background 0.2s;
      width: 90%;
      height: 70px;
      justify-content: flex-start; /* 왼쪽 정렬 */
    }

    .following-item:hover {
      background: #f8d7da;
    }
    
    .following-list::-webkit-scrollbar {
	  width: 4px;  /* 얇게 */
	}
	
	.following-list::-webkit-scrollbar-thumb {
	  background-color: #d81b60; /* 진한 핑크 */
	  border-radius: 4px;
	}
	
	.following-list::-webkit-scrollbar-track {
	  background-color: #fdeef2; /* 연한 핑크 */
	}

    .profile-img {
      width: 38px;
      height: 38px;
      border-radius: 50%;
      overflow: hidden;
      display: flex;
      align-items: center;
      justify-content: center;
      flex-shrink: 0; /* 이미지 크기 유지 */
    }

    .profile-img img {
      width: 100%;
      height: 100%;
      object-fit: cover;
    }

    .profile-img.default {
      background-color: #ddd;
    }

    .profile-info {
      display: flex;
      flex-direction: column;
      align-items: flex-start;
      justify-content: center;
      width: 100px;
      height: 50px;
    }

    .profile-info .following-name {
      font-size: 14px;
      font-weight: bold;
      color: #333;
    }

    .profile-info .following-id {
      font-size: 12px;
      color: #666;
      margin-top: -5px; /* 이름과 간격 좁힘 */
    }

    .move-my-calendar-btn {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      width: 200px;
      padding: 12px 18px;
      background-color: #d81b60; /* 진한 핑크 */
      color: white;
      border: none;
      border-radius: 30px;
      text-align: center;
      font-size: 15px;
      font-weight: bold;
      cursor: pointer;
      transition: background 0.3s, transform 0.2s;
      margin-bottom: 20px;  /* 여백 추가로 너무 붙는 거 해결 */
    }

    .move-my-calendar-btn:hover {
      background-color: #b3164f; /* 조금 더 진한 핑크 */
      transform: translateY(-2px);
    }

    .move-my-calendar-btn i {
      margin-right: 8px;  /* 아이콘과 글자 간격 */
      font-size: 16px;
    }

</style>
</head>
<body>

	<div class="wrap">
	    <div class="left">
	      <div class="L1">
	        <div class="logo-container">
            <a href="<%= contextPath %>"><img src="<%= contextPath %>/resources/images/현존최강로고.jpg" alt="메인로고"></a>
	        </div>
	        <br><br>
	          <nav class="sidebar-menu">
	            <div class="menu-item active" data-page="views/calendar/followingBeautyCalendar.jsp" id="default-menu">
	              <i class="fas fa-calendar-alt"><!--로고1--></i> 뷰티 캘린더
	            </div>
	            <div class="menu-item" data-page="views/calendar/followingRoutineCalendar.jsp">
	              <i class="fas fa-check-circle"><!--로고2--></i> 루틴 설정
	            </div>
	          </nav>
	      </div>
	      <div class="L2">
          <button class="move-my-calendar-btn" onclick="location.href='<%= contextPath %>/calendarMainpage.ca'">
            <i class="fas fa-arrow-left"></i> 내 캘린더로 이동
          </button>
        </div>
	      <div class="L3">
	        <div class="L3-content">
	          <h3>내 팔로잉</h3>
	          <div class="following-list">
	            
	            <% if(list.isEmpty()) { %>
                <!-- case1. 팔로우한 사람이 없을 경우 -->
                 팔로우한 사용자가 없습니다.
	            <% }else { %>
	                 <!-- case2. 팔로우한 사람이 있을 경우 -->
	                 <% for(Member m : list) { %>
	                 <a href="<%= contextPath %>/followingCalendarMainpage.ca?userId=<%= m.getUserId() %>" class="following-item">
		              <div class="profile-img">
		                <% if(m.getFilePath() == null) { %>
		              		<img src="<%= contextPath %>/resources/images/account_circle_500dp_000000.png" alt="프로필 이미지">
		              	<% }else { %>
		                	<img src="<%= contextPath + "/" + m.getFilePath() %>" alt="프로필 이미지">
		              	<% } %>
		              </div>
		              <div class="profile-info">
		                <p class="following-name"><%= m.getUserName() %></p>
		                <p class="following-id">@<%= m.getUserId() %></p>
		              </div>
		            </a>
	               <% } %>
	            <% } %>
	            
	          </div>
	        </div>        
	      </div>
	    </div>
	    <div class="right">
	      <div class="R1">
	        <div class="R1-content">
	          <div class="title">
	            <strong><%= userName.getUserName() %></strong>님의 <span class="highlight">뷰티 캘린더 🎀</span>
	          </div>
	          <div class="icons">
	            <i class="fa-solid fa-magnifying-glass">
	            </i>
	            <i class="fa-regular fa-bell">
	            </i>
	            <div class="profile-img">
	              <img src="" alt="">
	            </div>
	            <i class="fa-solid fa-chevron-down"><!--로고3--></i>
	          </div>
	        </div>
	      </div>
	      <div class="R2" id="content-area"></div>
	    </div>
  	</div>

  <script>
  var userId = "<%= request.getParameter("userId") %>";
  
  $(document).ready(function () {
      // 페이지 로드 시 기본값으로 뷰티 캘린더 로드
      loadPage("views/calendar/followingBeautyCalendar.jsp");

      // 기본적으로 뷰티 캘린더 메뉴에 active 유지
      $(".menu-item").removeClass("active");
      $("#default-menu").addClass("active");

      // 메뉴 클릭 이벤트
      $(".menu-item").click(function () {
        // 모든 메뉴에서 active 제거
        $(".menu-item").removeClass("active");

        // 현재 클릭한 메뉴에 active 추가
        $(this).addClass("active");

        // data-page 속성에서 페이지 가져오기
        var page = $(this).data("page");

        // AJAX로 R2 부분만 변경
        loadPage(page);
      });

      // AJAX 함수
      function loadPage(page) {
    	  if (page.includes("followingRoutineCalendar.jsp") || page.includes("followingBeautyCalendar.jsp")) {
    		    page += "?userId=" + userId;
    		  }
    	  
    	  $.ajax({
    		  url: page,
    		  type: "GET",
    		  success: function (data) {
    		    $("#content-area").html(data);

    		    if (page.includes("followingBeautyCalendar.jsp")) {
    		    	// beautyCalendar.jsp 내부의 <script> 태그 실행 보장
	                $("#content-area script").each(function() {
	                    var scriptTag = document.createElement("script");
	                    scriptTag.text = this.text;
	                    document.body.appendChild(scriptTag);
	                });

	                // initializeCalendar()가 실행되는지 다시 확인
	                setTimeout(function() {
	                    if (typeof initializeCalendar === 'function') {
	                        initializeCalendar();
	                    }
	                }, 100);
    		    }

    		    if (page.includes("followingRoutineCalendar.jsp")) {
    		      $("#content-area script").each(function() {
    		        var scriptTag = document.createElement("script");
    		        scriptTag.text = this.text;
    		        document.body.appendChild(scriptTag);
    		      });

    		      setTimeout(function() {
    		        if (typeof renderMyCalendar === 'function') {
    		          renderMyCalendar(); // ✅ 루틴 캘린더 실행
    		        }
    		      }, 100);
    		    }
    		  },
    		  error: function (xhr, status, error) {
    		    alert("페이지를 불러오는 데 실패했습니다: " + error);
    		  }
    		});
    	}


    });
  </script>

  <script>
    function setActive(selected) {
      document.querySelectorAll('.menu-item').forEach(item => {
        item.classList.remove('active');
      });
      selected.classList.add('active');
    }
  </script>

</body>
</html>