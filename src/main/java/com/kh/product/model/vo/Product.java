package com.kh.product.model.vo;

public class Product {
	
	private String pcode;
	private int brandId ;
	private int mcId;
	private int scId;
	private String pName;
	private String imagePath;
	private double rate;
	private int likeProduct;
	private String bName;
	
	public Product() {}
	


	public Product(String pcode, int brandId, int mcId, int scId, String pName, String imagePath, double rate,
			int likeProduct, String bName) {
		super();
		this.pcode = pcode;
		this.brandId = brandId;
		this.mcId = mcId;
		this.scId = scId;
		this.pName = pName;
		this.imagePath = imagePath;
		this.rate = rate;
		this.likeProduct = likeProduct;
		this.bName = bName;
	}









	public Product(String pcode, String pName, String imagePath, int likeProduct, double rate, String bName) {
		super();
		this.pcode = pcode;
		this.pName = pName;
		this.imagePath = imagePath;
		this.rate = rate;
		this.likeProduct = likeProduct;
		this.bName = bName;
	}



	public String getPcode() {
		return pcode;
	}



	public void setPcode(String pcode) {
		this.pcode = pcode;
	}



	public int getBrandId() {
		return brandId;
	}



	public void setBrandId(int brandId) {
		this.brandId = brandId;
	}



	public int getMcId() {
		return mcId;
	}



	public void setMcId(int mcId) {
		this.mcId = mcId;
	}



	public int getScId() {
		return scId;
	}



	public void setScId(int scId) {
		this.scId = scId;
	}



	public String getpName() {
		return pName;
	}



	public void setpName(String pName) {
		this.pName = pName;
	}



	public String getImagePath() {
		return imagePath;
	}



	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}



	public double getRate() {
		return rate;
	}



	public void setRate(double rate) {
		this.rate = rate;
	}



	public int getLikeProduct() {
		return likeProduct;
	}



	public void setLikeProduct(int likeProduct) {
		this.likeProduct = likeProduct;
	}



	public String getbName() {
		return bName;
	}



	public void setbName(String bName) {
		this.bName = bName;
	}



	@Override
	public String toString() {
		return "Product [pcode=" + pcode + ", brandId=" + brandId + ", mcId=" + mcId + ", scId=" + scId + ", pName="
				+ pName + ", imagePath=" + imagePath + ", rate=" + rate + ", likeProduct=" + likeProduct + ", bName="
				+ bName + "]";
	}


	
	
}
