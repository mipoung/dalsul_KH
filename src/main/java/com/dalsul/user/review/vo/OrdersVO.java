package com.dalsul.user.review.vo;

import lombok.Data;

@Data
public class OrdersVO {
	private int order_no =0;
	private int user_no =0;
	private int order_use_point=0;
	
	private String order_status="";
	private String order_date;
	

}
