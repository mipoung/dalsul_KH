package com.dalsul.common.vo;

import lombok.Data;

@Data
public class CommonVO {
	private String search = "";
	private String keyword = "";
	
	private int startCount=0;
	private int viewCount=3;
	
	private int pageNum = 0;
	private int amount = 0;
	
	private String start_date = "";
	private String end_date = "";
	
	public CommonVO() {
		this(1, 10);
	}
	public CommonVO(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
}