package com.kh.calendar.model.vo;

import java.util.List;

public class RoutineRequest {
	
	private String title;
    private String startDate;
    private String endDate;
    private List<Integer> weekdays;
    private String memo;
    
    public RoutineRequest() {}

	public RoutineRequest(String title, String startDate, String endDate, List<Integer> weekdays, String memo) {
		super();
		this.title = title;
		this.startDate = startDate;
		this.endDate = endDate;
		this.weekdays = weekdays;
		this.memo = memo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public List<Integer> getWeekdays() {
		return weekdays;
	}

	public void setWeekdays(List<Integer> weekdays) {
		this.weekdays = weekdays;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	@Override
	public String toString() {
		return "RoutineRequest [title=" + title + ", startDate=" + startDate + ", endDate=" + endDate + ", weekdays="
				+ weekdays + ", memo=" + memo + "]";
	}
    

}
