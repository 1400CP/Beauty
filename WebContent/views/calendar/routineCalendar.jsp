<%@ page isELIgnored="true" %>
<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String contextPath = request.getContextPath();
    Member loginUser = (Member)session.getAttribute("loginUser");
    if (loginUser == null) {
      response.sendRedirect(contextPath + "/loginForm.me");
      return;
    }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons&display=block">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap');
body { font-family: 'Poppins', sans-serif; margin: 0; padding: 20px; color: #333; }
.container { display: flex; max-width: 1200px; margin: 0 auto; gap: 30px; align-items: flex-start;}

.form-container { flex: 1; background-color: #fff; border-radius: 15px; padding: 30px 40px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); color: #333; width: 50%; box-sizing: border-box;}
.form-container * {
  box-sizing: border-box;
}
.form-container h2 { font-size: 22px; margin-bottom: 20px; color: #d6336c; }
.form-container label { margin: 15px 0 5px; font-weight: bold; color: #d6336c; display: block; }
.form-container input, .form-container select, .form-container textarea {
  width: 100%; padding: 10px; border: 1px solid #f8d7da; border-radius: 10px; background-color: #fff0f5;
}
.form-container button {
  background-color: #f78fb3; color: white; padding: 12px 20px; border: none;
  border-radius: 10px; box-sizing: border-box; font-size: 16px; cursor: pointer; margin-top: 20px; width: 100%;
}
.form-container button:hover { background-color: #f1aeb5; }
.weekdays { display: flex; gap: 5px; margin-top: 10px; }
.week-btn { flex: 1; padding: 10px; background-color: #fff0f5; border: 1px solid #f8d7da;
  border-radius: 50px; text-align: center; cursor: pointer; color: #d6336c; font-weight: 500; }
.week-btn.active { background-color: #f78fb3; color: white; }
.date-group { display: flex; align-items: center; gap: 8px; }
.date-group input[type="date"] { width: 140px; background-color: #fff0f5; border-radius: 10px; border: 1px solid #f8d7da; padding: 8px; color: #333; }

/* 캘린더 */
.routine-calendar .wrapper { width: 100%; background-color: #fff; border-radius: 10px; padding: 20px; }
.routine-calendar .nav { display: flex; align-items: center; justify-content: space-between; margin-bottom: 20px; }
.routine-calendar .current-date { font-size: 20px; font-weight: 600; }
.routine-calendar .nav button { border: none; background: none; cursor: pointer; }
.routine-calendar .nav .material-icons { font-size: 32px; color: #d6336c; }
.routine-calendar .calendar ul { display: flex; list-style: none; flex-wrap: wrap; text-align: center; padding: 0; }
.routine-calendar .calendar .weeks li { font-weight: 500; width: calc(100% / 7); padding: 5px 0; }
.routine-calendar .calendar .days li { width: calc(100% / 7); position: relative; z-index: 1; margin-top: 20px; cursor: pointer; }
.routine-calendar .days li.inactive { color: #aaa; }
.routine-calendar .days li.active { color: #fff; }
.routine-calendar .calendar .days li::before {
  position: absolute; content: ''; height: 36px; width: 36px; top: 50%; left: 50%;
  transform: translate(-50%, -50%); border-radius: 50%; z-index: -1;
}
.routine-calendar .days li:hover::before { background: #f2f2f2; }
.routine-calendar .days li.active::before { background: #ffb6cf; }
.left-section {
  width: 50%;
  display: flex;
  flex-direction: column;
  gap: 20px;
  background-color: #ffe6f0;  /* 연핑크 배경 */
  padding: 20px;
  border-radius: 15px;
  height: 900px;
}

#routine {
  background-color: #fff;
  border-radius: 15px;
  padding: 20px;
  box-shadow: 0 0 10px rgba(0,0,0,0.1);
  /* flex-grow 제거! */
}

.checklist {
  background-color: #fff;
  border-radius: 15px;
  padding: 20px;
  box-shadow: 0 0 10px rgba(0,0,0,0.1);
  flex-grow: 1;  /* 체크리스트만 남은 공간 채워 */
  overflow: auto;
}

 .todo-container {
   background-color: #fff;
   border-radius: 15px;
   padding: 20px;
   max-width: 400px;
   margin: 0 auto;
 }


 .form1 {
   display: flex;
   margin-bottom: 15px;
 }

 #inputTodo {
   flex-grow: 1;
   padding: 10px;
   font-size: 14px;
   border-radius: 50px;
   border: none;
   background-color: #fff0f8;
 }

 #addBtn {
   padding: 5px 8px;
   font-size: 14px;
   border-radius: 50px;
   border: none;
   background-color: #ff81b5;
   color: #fff;
   cursor: pointer;
   margin-left: 10px;
   transition: background-color 0.3s;
 }

 #addBtn:hover {
   background-color: #ff4d88;
 }

 .todo-list {
   list-style: none;
   padding: 0;
   margin: 0;
 }

 .liContainer {
   display: flex;
   align-items: center;
   padding: 8px 10px;
   margin-bottom: 10px;
   background-color: #ffffff;
   border: none;
   border-bottom: 1px solid #e0e0e0;
 }

 .liSpan {
   flex-grow: 1;
   font-size: 14px;
   color: #555;
 }

 .liButton {
   padding: 6px 10px;
   font-size: 12px;
   border-radius: 8px;
   border: none;
   background-color: #ff81b5;
   color: #fff;
   cursor: pointer;
 }

 .liButton:hover {
   background-color: #ff4d88;
 }

 #footer {
   display: flex;
   justify-content: space-between;
   align-items: center;
   margin-top: 15px;
   flex-wrap: wrap;
 }

 #footer > span {
   font-size: 12px;
   color: #333;
   margin: 5px;
 }

 #footer > button {
   padding: 8px 12px;
   font-size: 12px;
   border-radius: 10px;
   border: none;
   background-color: #ff81b5;
   color: #fff;
   cursor: pointer;
 }

 #footer > button:hover {
   background-color: #ff4d88;
 }

 #All, #Active, #Complete {
   background-color: #fff0f8;
   padding: 5px 10px;
   border-radius: 8px;
   cursor: pointer;
   transition: background-color 0.3s;
 }

 #All:hover, #Active:hover, #Complete:hover {
   background-color: #ffb6c1;
 }


</style>
</head>

<body>

<div class="container">
  <!-- 캘린더 영역 -->
    <div class="left-section">
    <!-- 캘린더 -->
    <div id="routine">
      <div class="routine-calendar">
        <div class="wrapper">
          <div class="nav">
            <button id="prev"><span class="material-icons">chevron_left</span></button>
            <p class="current-date"></p>
            <button id="next"><span class="material-icons">chevron_right</span></button>
          </div>
          <div class="calendar">
            <ul class="weeks">
              <li>일</li><li>월</li><li>화</li><li>수</li><li>목</li><li>금</li><li>토</li>
            </ul>
            <ul class="days"></ul>
          </div>
        </div>
      </div>
    </div>

    <!-- 체크리스트 (새로 추가한 영역) -->
    <div class="checklist">
      <div class="todo-container">
	    <section class="form1">
	      <input type="text" placeholder="할 일을 입력하세요." id="inputTodo">
	      <button type="button" id = "addBtn">
	        <span class="material-icons">add</span>
	      </button>
	    </section>
	
	    <ul class="todo-list" id ="todo-listId" >
	    </ul>
	
	    <div id = "footer">
	      <span id = "countSpan">남은 할일: </span>
	      <span id = "countSpanInput"></span>
	      <span id = "All">전체보기</span>
	      <span id = "Active">미완료</span>
	      <span id = "Complete">완료</span>
	      <button type="button" id="allDelete" >전체 삭제</button>
	  </div>
  </div>
      
    </div>
  </div>

  <!-- 루틴 입력 폼 -->
  <div class="form-container">
    <form action="" method="post">
      <h2><span style="color:black;"><%= loginUser.getUserName() %></span>님의 뷰티 루틴</h2>
      <label>항목명</label>
      <input type="text" id="check_title" name="check_title" placeholder="항목명을 입력해 주세요." required>
  	  <br><br>
      <label>기간</label>
      <div class="date-group">
        <input type="date" id="repeat_startdate" name="repeat_startdate" required> ~ <input type="date" id="repeat_enddate" name="repeat_enddate">
      </div>
  	  <br>
      <label>요일</label>
      <div class="weekdays">
        <div class="week-btn">월</div>
        <div class="week-btn">화</div>
        <div class="week-btn">수</div>
        <div class="week-btn">목</div>
        <div class="week-btn">금</div>
        <div class="week-btn">토</div>
        <div class="week-btn">일</div>
      </div>
  	  <br>
      <label>메모</label>
      <textarea id="event-memo" rows="3" placeholder="메모를 입력하세요 (선택사항)" style="resize: none;"></textarea>
  	  <br><br>
      <button id="add-event-btn">설정</button>
    </form>
  </div>
</div>



</body>
</html>