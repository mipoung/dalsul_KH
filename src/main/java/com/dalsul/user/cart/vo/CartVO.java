package com.dalsul.user.cart.vo;

import lombok.Data;

@Data
public class CartVO {
	private int cart_id;
	private int product_no;
	private int product_price;
	private int quantity;
	private int total;
	private String product_name;
}
