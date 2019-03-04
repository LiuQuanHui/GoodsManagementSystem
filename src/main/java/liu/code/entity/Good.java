package liu.code.entity;

import java.util.Map;

public class Good {
	private Integer gId;//货物ID
	private String goodName;//货物名称
	private String goodType;//货物类别
	private String goodProduct;//货物产地
	private double goodPrice;//货物单价
	private int    goodNum;//货物库存
	private double goodNumPrice;//货物总价
	public Integer getgId() {
		return gId;
	}
	public void setgId(Integer gId) {
		this.gId = gId;
	}
	public String getGoodName() {
		return goodName;
	}
	public void setGoodName(String goodName) {
		this.goodName = goodName;
	}
	public String getGoodType() {
		return goodType;
	}
	public void setGoodType(String goodType) {
		this.goodType = goodType;
	}
	public String getGoodProduct() {
		return goodProduct;
	}
	public void setGoodProduct(String goodProduct) {
		this.goodProduct = goodProduct;
	}
	public double getGoodPrice() {
		return goodPrice;
	}
	public void setGoodPrice(double goodPrice) {
		this.goodPrice = goodPrice;
	}
	public int getGoodNum() {
		return goodNum;
	}
	public void setGoodNum(int goodNum) {
		this.goodNum = goodNum;
	}
	public double getGoodNumPrice() {
		return goodNumPrice;
	}
	public void setGoodNumPrice(double goodNumPrice) {
		this.goodNumPrice = goodNumPrice;
	}
	public Good() {
		super();
	}
	
	public Good(Integer gId, String goodName, String goodType, String goodProduct, double goodPrice, int goodNum,
			double goodNumPrice) {
		super();
		this.gId = gId;
		this.goodName = goodName;
		this.goodType = goodType;
		this.goodProduct = goodProduct;
		this.goodPrice = goodPrice;
		this.goodNum = goodNum;
		this.goodNumPrice = goodNumPrice;
	}
	public Good(String goodName, String goodType, String goodProduct, double goodPrice, int goodNum,
			double goodNumPrice) {
		super();
		this.goodName = goodName;
		this.goodType = goodType;
		this.goodProduct = goodProduct;
		this.goodPrice = goodPrice;
		this.goodNum = goodNum;
		this.goodNumPrice = goodNumPrice;
	}
	public Good(Map<String, Object> map) {
		this.goodName = (String)map.get("goodName");
		this.goodType = (String)map.get("goodType");
		this.goodProduct = (String)map.get("goodProduct");
		this.goodPrice = (Double)map.get("goodPrice");
		this.goodNum = (Integer)map.get("goodNum");
		this.goodNumPrice = (Double)map.get("goodNumPrice");
		this.gId = (Integer)map.get("gId");
	}
	
	
}
