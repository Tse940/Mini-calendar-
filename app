const calendarDays = document.getElementById("calendarDays");
const monthYear = document.getElementById("monthYear");
const prevMonthBtn = document.getElementById("prevMonth");
const nextMonthBtn = document.getElementById("nextMonth");

let currentDate = new Date();

function renderCalendar(date) {
  const year = date.getFullYear();
  const month = date.getMonth();

  // Set month-year text
  const monthNames = ["January", "February", "March", "April", "May", "June",
                      "July", "August", "September", "October", "November", "December"];
  monthYear.textContent = `${monthNames[month]} ${year}`;

  // Get first day of the month
  const firstDay = new Date(year, month, 1).getDay();
  const daysInMonth = new Date(year, month + 1, 0).getDate();

  // Clear previous cells
  calendarDays.innerHTML = "";

  // Fill blank cells before the first day
  for (let i = 0; i < firstDay; i++) {
    calendarDays.innerHTML += "<div></div>";
  }

  // Fill days
  for (let d = 1; d <= daysInMonth; d++) {
    const dayDiv = document.createElement("div");
    dayDiv.textContent = d;

    const today = new Date();
    if (
      d === today.getDate() &&
      month === today.getMonth() &&
      year === today.getFullYear()
    ) {
      dayDiv.classList.add("today");
    }

    calendarDays.appendChild(dayDiv);
  }
}

prevMonthBtn.addEventListener("click", () => {
  currentDate.setMonth(currentDate.getMonth() - 1);
  renderCalendar(currentDate);
});

nextMonthBtn.addEventListener("click", () => {
  currentDate.setMonth(currentDate.getMonth() + 1);
  renderCalendar(currentDate);
});

renderCalendar(currentDate);
