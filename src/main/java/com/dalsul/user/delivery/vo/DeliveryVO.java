package com.dalsul.user.delivery.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DeliveryVO {

	private int delevery_no;
	private int order_no;
	private int user_no;
	private String delevery_status;
	private String delevery_start_date;
	
	
}
