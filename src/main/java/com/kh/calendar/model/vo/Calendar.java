package com.kh.calendar.model.vo;

public class Calendar {
	
	private int scheduleNo;
	private int memberNo;
	private String title;
	private String startDay;
	private String endDay;
	
	public Calendar() {}

	public Calendar(int scheduleNo, int memberNo, String title, String startDay, String endDay) {
		super();
		this.scheduleNo = scheduleNo;
		this.memberNo = memberNo;
		this.title = title;
		this.startDay = startDay;
		this.endDay = endDay;
	}
	
	public Calendar(String title, String startDay, String endDay) {
		super();
		this.title = title;
		this.startDay = startDay;
		this.endDay = endDay;
	}

	public Calendar(int scheduleNo, String title, String startDay, String endDay) {
		super();
		this.scheduleNo = scheduleNo;
		this.title = title;
		this.startDay = startDay;
		this.endDay = endDay;
	}

	public int getScheduleNo() {
		return scheduleNo;
	}

	public void setScheduleNo(int scheduleNo) {
		this.scheduleNo = scheduleNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getStartDay() {
		return startDay;
	}

	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}

	public String getEndDay() {
		return endDay;
	}

	public void setEndDay(String endDay) {
		this.endDay = endDay;
	}

	@Override
	public String toString() {
		return "Calendar [scheduleNo=" + scheduleNo + ", memberNo=" + memberNo + ", title=" + title + ", startDay="
				+ startDay + ", endDay=" + endDay + "]";
	}

}