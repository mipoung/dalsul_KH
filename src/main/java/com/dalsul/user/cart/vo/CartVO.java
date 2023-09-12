package com.dalsul.user.cart.vo;

import lombok.Data;

@Data
public class CartVO {
	//private int member_id;
	private int product_id;
	private int price;
	private int quantity;
	private int total;

}
