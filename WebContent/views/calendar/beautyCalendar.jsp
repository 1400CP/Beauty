<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.10/index.global.min.js"></script>
<title>Insert title here</title>
<style>
  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
    }

    #calendar {
      width: 100%;
      height: 100%;
      margin: 0 auto;
      background-color: #fdf6f9; /* 연한 핑크 배경 */
      border-radius: 15px;
      padding: 20px;
    }

    .fc-toolbar {
      background-color: #fce4ec; /* 연한 핑크 */
      border-radius: 10px;
      padding: 10px;
      color: #d81b60; /* 진한 핑크 */
      font-weight: bold;
    }

    .fc-col-header-cell {
      background-color: #fdeef2; /* 연한 핑크 */
      color: #d81b60; /* 진한 핑크 */
      font-weight: bold;
      padding: 10px;
      text-align: center;
      border-radius: 5px;
    }

    .fc-day-today {
      background-color: rgba(255, 223, 228, 0.3) !important; /* 연한 살구색 */
    }

    .fc-daygrid-day {
      background-color: white;
    }

    .fc-event {
      background-color: #f48fb1 !important;
      color: white !important;
      border-radius: 6px;
      padding: 3px 8px;  /* 패딩 줄여서 더 얇아지도록 */
      font-size: 12px;  /* 글씨 크기도 조금 축소 */
      font-weight: bold;
      text-align: center;
      border: none;
      height: 18px !important; /* 높이 줄이기 */
      line-height: 18px !important; /* 텍스트 정렬 */
      display: flex;
      align-items: center; /* 수직 중앙 정렬 */
      justify-content: center; /* 수평 중앙 정렬 */
    }

    .fc-event:hover {
      transform: scale(1.03);
      transition: all 0.1s ease-in-out;
    }

    .fc-popover {
      background-color: white;
      border-radius: 10px;
      box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
    }

    .fc-button {
      background-color: #f8bbd0 !important;
      color: #d81b60 !important;
      border-radius: 30px !important;
      border: none !important;  /* 외곽선 제거 */
      padding: 5px 12px !important;  /* 크기 줄이기 */
      font-size: 12px !important;
      font-weight: bold;
    }

    .fc-button:hover {
      background-color: #d81b60 !important;
      color: white !important;
    }

    input[type="checkbox"] {
      accent-color: #d81b60; /* 진한 핑크 체크 */
    }

    .fc-timegrid-event .fc-event-time {
      font-size: 10px !important;
      font-weight: bold;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .fc-event-title {
      width: 100%;
      height: 100%;
      display: flex;
      align-items: center;
      justify-content: center;
      text-align: center;
    }

    .fc-timegrid-slot {
      height: auto !important;
      min-height: 30px !important; /* 기본 높이 설정 */
    }

    .fc-timegrid-event-harness {
      display: flex;
      align-items: center;
      justify-content: center;
      height: auto !important;
      min-height: 30px !important;
    }

    /* 날짜를 드래그할 때 (월간 뷰) */
    .fc-highlight {
      background-color: rgba(255, 105, 180, 0.2) !important; /* 연한 핑크 */
      border-radius: 5px;
    }

    /* 날짜를 클릭했을 때 (월간 뷰) */
    .fc-daygrid-day.fc-day-selected {
        background-color: rgba(255, 182, 193, 0.4) !important; /* 살구색 */
        border-radius: 5px;
    }

    /* 주간/일간 뷰에서 시간 슬롯을 드래그할 때 */
    .fc-timegrid-slot.fc-highlight {
        background-color: rgba(255, 105, 180, 0.3) !important; /* 연한 핑크 */
        border-radius: 5px;
    }

    /* 선택된 이벤트 스타일 */
    .fc-daygrid-event.fc-event-selected {
        background-color: #ff69b4 !important; /* 진한 핑크 */
        border-radius: 6px;
        color: white !important;
        font-weight: bold;
    }

    /* 드래그 중인 이벤트 스타일 */
    .fc-event-dragging {
        opacity: 0.7;
        background-color: #ff1493 !important; /* 네온 핑크 */
    }

    /* 월간 뷰에서 짧은 이벤트 스타일 유지 */
    .fc-daygrid-event {
      height: auto !important; /* 자동 높이 조정 */
      min-height: 18px !important; /* 최소 높이 설정 */
      line-height: normal !important;
      display: flex;
      align-items: center;
      justify-content: center;
      white-space: nowrap !important; /* 텍스트가 한 줄에 나오도록 */
      overflow: hidden !important;
      text-overflow: ellipsis; /* 글자가 길면 '...' 표시 */
      margin-bottom: 2px !important; /* 이벤트 간 간격 추가 */
    }

    /* 주간/일간 뷰에서 이벤트 길이 정상적으로 표시 */
    .fc-timegrid-event {
        height: auto !important; /* 드래그한 만큼 길게 표시 */
        min-height: 20px !important; /* 최소 높이 */
        display: block !important; /* Flexbox 해제하여 높이 정상 적용 */
        line-height: normal !important; /* 텍스트 정렬 정상화 */
        white-space: normal !important; /* 줄 바꿈 허용 */
        padding: 5px !important;
    }

    /* all-day 이벤트 스타일 (월간 뷰와 동일) */
    .fc-daygrid-block-event {
        display: flex;
        align-items: center;
        justify-content: center;
        height: 20px !important;
    }

    /* 이벤트 내부 텍스트 중앙 정렬 */
    .fc-event-title {
        width: 100%;
        text-align: center;
        word-wrap: break-word;
    }
</style>
</head>
<body>

	<div id="calendar"></div>
	
	<script>
    function initializeCalendar() {
        var calendarEl = document.getElementById('calendar');

        if (!calendarEl) {
            return;
        }

        var calendar = new FullCalendar.Calendar(calendarEl, {
            locale: 'ko',
            headerToolbar: {
                left: 'prev,next today',
                center: 'title',
                right: 'dayGridMonth,dayGridWeek,dayGridDay'
            },
            initialDate: '2025-03-11',
            navLinks: true,
            selectable: true,
            selectMirror: true,
            select: function(arg) {
                var title = prompt('추가할 일정 제목:');
                if (title) {
                    calendar.addEvent({
                        title: title,
                        start: arg.start,
                        end: arg.end,
                        allDay: arg.allDay
                    });
                }
                calendar.unselect();
            },
            eventClick: function(arg) {
                if (confirm('해당 일정을 삭제하시겠습니까?')) {
                    arg.event.remove();
                }
            },
            editable: true,
            dayMaxEvents: true,
            dayCellContent: function(info) {
            	return info.date.getDate();
            },
            events: [
                { title: 'All Day Event', start: '2025-03-01' },
                { title: 'Long Event', start: '2025-03-07', end: '2025-03-10' },
                { groupId: 999, title: 'Repeating Event', start: '2025-03-09T16:00:00' },
                { groupId: 999, title: 'Repeating Event', start: '2025-03-16T16:00:00' },
                { title: 'Conference', start: '2025-03-11', end: '2025-03-13' },
                { title: 'Meeting', start: '2025-03-12T10:30:00', end: '2025-03-12T12:30:00' },
                { title: 'Lunch', start: '2025-03-12T12:00:00' },
                { title: 'Meeting', start: '2025-03-12T14:30:00' },
                { title: 'Happy Hour', start: '2025-03-12T17:30:00' },
                { title: 'Dinner', start: '2025-03-12T20:00:00' },
                { title: 'Birthday Party', start: '2025-03-13T07:00:00' },
                { title: 'Click for Google', url: 'http://google.com/', start: '2025-03-28' }
            ]
        });

        calendar.render();
    }

    // 페이지가 직접 로드될 경우 실행
    document.addEventListener('DOMContentLoaded', initializeCalendar);
</script>
	
	
</body>
</html>