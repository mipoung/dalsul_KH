package com.dalsul.user.main.vo;

import lombok.Data;

@Data
public class ProductVO {
	private int product_no;
    private String product_name;
    private int product_price;
    private String product_main_image;
    private int review_num;
    private double review_rating;
}