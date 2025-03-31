package com.kh.post.model.vo;

public class SubCategory2 {
	
	private int scId;
	private String scName;

	public SubCategory2 () {}

	public SubCategory2(int scId, String scName) {
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
		return "SubCategory2 [scId=" + scId + ", scName=" + scName + "]";
	};

}
