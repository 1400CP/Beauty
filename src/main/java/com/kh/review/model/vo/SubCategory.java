package com.kh.review.model.vo;

public class SubCategory {
	
	private int scId;
	private String scName;

	public SubCategory () {}

	public SubCategory(int scId, String scName) {
		super();
		this.scId = scId;
		this.scName = scName;
	}

	public int getScId() {
		return scId;
	}

	public void setScId(int scId) {
		this.scId = scId;
	}

	public String getScName() {
		return scName;
	}

	public void setScName(String scName) {
		this.scName = scName;
	}

	@Override
	public String toString() {
		return "SubCategory [scId=" + scId + ", scName=" + scName + "]";
	};

}
