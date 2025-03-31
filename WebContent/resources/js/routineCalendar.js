let count = 0;
let selectedDateString = (function () {
  const today = new Date();
  const yyyy = today.getFullYear();
  const mm = String(today.getMonth() + 1).padStart(2, '0');
  const dd = String(today.getDate()).padStart(2, '0');
  return `${yyyy}-${mm}-${dd}`;
})();


function initRoutineCalendarPage() {
  renderMyCalendar();

  const addBtn = document.getElementById("addBtn");
  const inputTodo = document.getElementById("inputTodo");

  addBtn.addEventListener("click", function () {
    if (inputTodo.value === "") {
      alert("할 일을 작성해주세요.");
      inputTodo.focus();
      return;
    }

    const li = document.createElement("li");
    li.classList.add("liContainer");

    const checkBox = document.createElement("input");
    checkBox.classList.add("check1");
    checkBox.setAttribute("type", "checkbox");

    const span = document.createElement("span");
    span.classList.add("liSpan");
    span.innerText = inputTodo.value;

    const button = document.createElement("button");
    button.classList.add("liButton");
    button.innerText = "삭제";

    li.append(checkBox, span, button);
    document.querySelector(".todo-list").append(li);

    inputTodo.value = "";
    inputTodo.focus();

    count++;
    updateCount();

    // INSERT
    $.ajax({
      url: contextPath + "/insertTodo.ca",
      method: "POST",
      data: {
        checkTitle: span.innerText,
        checkDate: selectedDateString,
        checkYN: "N"
      },
      success: function () {
        $.ajax({
          url: contextPath + "/selectTodo.ca",
          method: "GET",
          data: { date: selectedDateString },
          success: function (data) {
            renderTodoList(data);
          }
        });
      },
      error: function () {
        alert("할 일 저장 실패");
      }
    });

    // 삭제 버튼
    button.addEventListener("click", function () {
      li.remove();
      if (!checkBox.checked) count--;
      updateCount();
    });

    // 체크박스 변경
    checkBox.addEventListener("click", function () {
      span.style.textDecoration = checkBox.checked ? "line-through" : "none";
      span.style.color = checkBox.checked ? "gray" : "black";
      count += checkBox.checked ? -1 : 1;
      updateCount();
    });
  });

  // 전체 삭제
  document.getElementById("allDelete").addEventListener("click", function () {
	  const todoList = document.getElementById("todo-listId");
	  const checkboxes = todoList.querySelectorAll("input[type='checkbox']");
	  const idsToDelete = [];
	
	  checkboxes.forEach(cb => {
	    const id = cb.getAttribute("data-id");
	    if (id) idsToDelete.push(id);
	  });
	
	  if (idsToDelete.length === 0) {
	    alert("삭제할 항목이 없습니다.");
	    return;
	  }
	
	  if (confirm("정말 전체 삭제하시겠습니까?")) {
	    $.ajax({
	      url: contextPath + "/deleteAllTodo.ca",
	      method: "POST",
	      traditional: true, // 배열 제대로 전송하려면 꼭 추가!
	      data: { todoIds: idsToDelete },
	      success: function () {
	        todoList.innerHTML = "";
	        count = 0;
	        updateCount();
	      },
	      error: function () {
	        alert("전체 삭제 실패");
	      }
	    });
	  }
	});



  // 필터 버튼
  document.getElementById("All").onclick = showAll;
  document.getElementById("Active").onclick = showActive;
  document.getElementById("Complete").onclick = showComplete;
};

function renderMyCalendar() {
  const today = new Date();
  const todayDate = today.getDate();
  const todayMonth = today.getMonth();
  const todayYear = today.getFullYear();

  let currMonth = todayMonth;
  let currYear = todayYear;
  let selectedDay = todayDate;

  const calendarEl = document.querySelector('.routine-calendar');
  const currentDate = calendarEl.querySelector('.current-date');
  const daysTag = calendarEl.querySelector('.days');
  const prevNextIcon = calendarEl.querySelectorAll('.nav button');

  function renderCalendar() {
    const lastDate = new Date(currYear, currMonth + 1, 0).getDate();
    const firstDay = new Date(currYear, currMonth, 1).getDay();
    const lastDay = new Date(currYear, currMonth, lastDate).getDay();
    const prevLast = new Date(currYear, currMonth, 0).getDate();

    currentDate.innerHTML = `${currYear}년 ${currMonth + 1}월`;

    let liTag = '';
    for (let i = firstDay; i > 0; i--) {
      liTag += `<li class="inactive">${prevLast - i + 1}</li>`;
    }
    for (let i = 1; i <= lastDate; i++) {
      let isActive = (i === selectedDay) ? "active" : "";
      liTag += `<li class="${isActive}" data-day="${i}">${i}</li>`;
    }
    for (let i = lastDay; i < 6; i++) {
      liTag += `<li class="inactive">${i - lastDay + 1}</li>`;
    }

    daysTag.innerHTML = liTag;

    calendarEl.querySelectorAll(".days li").forEach(day => {
      day.addEventListener("click", function () {
        if (!this.classList.contains("inactive")) {
          calendarEl.querySelectorAll(".days li.active").forEach(d => d.classList.remove("active"));
          this.classList.add("active");
          selectedDay = parseInt(this.getAttribute("data-day"));

          const yyyy = currYear;
          const mm = String(currMonth + 1).padStart(2, '0');
          const dd = String(selectedDay).padStart(2, '0');
          selectedDateString = `${yyyy}-${mm}-${dd}`;

          $.ajax({
            url: contextPath + "/selectTodo.ca",
            method: "GET",
            data: { date: selectedDateString },
            success: function (data) {
              renderTodoList(data);
            },
            error: function () {
              alert("할 일 불러오기 실패");
            }
          });
        }
      });
    });

    // 페이지 들어오자마자 로드
    if (selectedDay != null) {
      const yyyy = currYear;
      const mm = String(currMonth + 1).padStart(2, '0');
      const dd = String(selectedDay).padStart(2, '0');
      selectedDateString = `${yyyy}-${mm}-${dd}`;
      $.ajax({
        url: contextPath + "/selectTodo.ca",
        method: "GET",
        data: { date: selectedDateString },
        success: function (data) {
          renderTodoList(data);
        },
        error: function () {
          alert("할 일 불러오기 실패");
        }
      });
    }

    // 요일 버튼 클릭
    $(".week-btn").off("click").on("click", function () {
      $(this).toggleClass("active");
      const text = $(this).text();
      const idMap = {
        "월": "mon_re", "화": "tue_re", "수": "wed_re",
        "목": "thu_re", "금": "fri_re", "토": "sat_re", "일": "sun_re"
      };
      const inputId = idMap[text];
      $("#" + inputId).val($(this).hasClass("active") ? "Y" : "N");
    });
  }

  prevNextIcon.forEach((icon) => {
    icon.addEventListener('click', () => {
      currMonth = icon.id === 'prev' ? currMonth - 1 : currMonth + 1;
      if (currMonth < 0) { currMonth = 11; currYear--; }
      else if (currMonth > 11) { currMonth = 0; currYear++; }
      selectedDay = (currMonth === todayMonth && currYear === todayYear) ? todayDate : null;
      renderCalendar();
    });
  });

  renderCalendar();
}

function updateCount() {
  const countSpanInput = document.getElementById("countSpanInput");
  countSpanInput.innerText = count > 0 ? count + " 개" : "";
}

function renderTodoList(data) {
  const todoList = document.getElementById("todo-listId");
  todoList.innerHTML = "";
  let tempCount = 0;

  data.forEach(todo => {
    const li = document.createElement("li");
    li.classList.add("liContainer");

    const checkBox = document.createElement("input");
    checkBox.classList.add("check1");
    checkBox.setAttribute("type", "checkbox");
    checkBox.setAttribute("data-id", todo.checkNo);

    const span = document.createElement("span");
    span.classList.add("liSpan");
    span.textContent = todo.checkTitle;

    const button = document.createElement("button");
    button.classList.add("liButton");
    button.textContent = "삭제";

    if (todo.checkYN === "Y") {
      checkBox.checked = true;
      span.style.textDecoration = "line-through";
      span.style.color = "gray";
    } else {
      tempCount++;
    }

    li.append(checkBox, span, button);
    todoList.appendChild(li);

    checkBox.addEventListener("click", function () {
      span.style.textDecoration = this.checked ? "line-through" : "none";
      span.style.color = this.checked ? "gray" : "black";
      count += this.checked ? -1 : 1;
      updateCount();

      $.ajax({
        url: contextPath + "/updateTodo.ca",
        method: "POST",
        data: {
          todoId: this.getAttribute("data-id"),
          checkYN: this.checked ? "Y" : "N"
        }
      });
    });

    button.addEventListener("click", function () {
	  const todoId = checkBox.getAttribute("data-id");
	
	  if (confirm("정말 삭제하시겠습니까?")) {
	    $.ajax({
	      url: contextPath + "/deleteTodo.ca",
	      method: "POST",
	      data: { todoId: todoId },
	      success: function () {
	        li.remove();
	        if (!checkBox.checked) count--;
	        updateCount();
	      },
	      error: function () {
	        alert("삭제 실패");
	      }
	    });
	  }
	});
  });

  count = tempCount;
  updateCount();
}

function showAll() {
  document.querySelectorAll("#todo-listId > li").forEach(li => {
    li.style.display = "flex";
  });
}
function showActive() {
  document.querySelectorAll("#todo-listId > li").forEach(li => {
    li.style.display = li.querySelector("input").checked ? "none" : "flex";
  });
}
function showComplete() {
  document.querySelectorAll("#todo-listId > li").forEach(li => {
    li.style.display = li.querySelector("input").checked ? "flex" : "none";
  });
}
