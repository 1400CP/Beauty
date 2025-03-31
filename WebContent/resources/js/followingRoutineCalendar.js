(() => {
  const contextPath = window.contextPath;
  const userId = window.userId;

  let selectedDateString = (() => {
    const today = new Date();
    const yyyy = today.getFullYear();
    const mm = String(today.getMonth() + 1).padStart(2, '0');
    const dd = String(today.getDate()).padStart(2, '0');
    return `${yyyy}-${mm}-${dd}`;
  })();

  window.renderMyCalendar = function () {
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

            fetchTodoList();
          }
        });
      });

      if (selectedDay != null) {
        const yyyy = currYear;
        const mm = String(currMonth + 1).padStart(2, '0');
        const dd = String(selectedDay).padStart(2, '0');
        selectedDateString = `${yyyy}-${mm}-${dd}`;
        fetchTodoList();
      }
    }

    prevNextIcon.forEach((icon) => {
      icon.addEventListener('click', () => {
        currMonth = icon.id === 'prev' ? currMonth - 1 : currMonth + 1;
        if (currMonth < 0) { currMonth = 11; currYear--; }
        else if (currMonth > 11) { currMonth = 0; currYear++; }
        selectedDay = 1;
        renderCalendar();
      });
    });

    renderCalendar();
  };

  function fetchTodoList() {
    $.ajax({
      url: contextPath + "/selectFollowingTodo.ca",
      method: "GET",
      data: {
        date: selectedDateString,
        userId: userId
      },
      success: function (data) {
        renderTodoList(data);
      },
      error: function () {
        alert("할 일 불러오기 실패");
      }
    });
  }

  function renderTodoList(data) {
    const todoList = document.getElementById("todo-listId");
    todoList.innerHTML = "";

    data.forEach(todo => {
      const li = document.createElement("li");
      li.classList.add("liContainer");

      const checkBox = document.createElement("input");
      checkBox.setAttribute("type", "checkbox");
      checkBox.setAttribute("disabled", true);
      checkBox.checked = (todo.checkYN === "Y");
      checkBox.style.marginRight = "10px";

      const span = document.createElement("span");
      span.classList.add("liSpan");
      span.textContent = todo.checkTitle;

      if (todo.checkYN === "Y") {
        span.style.textDecoration = "line-through";
        span.style.color = "gray";
      }

      li.append(checkBox, span);
      todoList.appendChild(li);
    });
  }

  // 자동 실행 (직접 렌더 호출 안 하는 경우 대비)
  document.addEventListener("DOMContentLoaded", () => {
    if (document.querySelector(".routine-calendar")) {
      renderMyCalendar();
    }
  });
})();
