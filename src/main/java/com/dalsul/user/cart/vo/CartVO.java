package com.dalsul.user.cart.vo;

import lombok.Data;

@Data
public class CartVO {
	//private int member_id;
	private int product_no;
	private int product_price;
	private int quantity;
	private int total;

}
