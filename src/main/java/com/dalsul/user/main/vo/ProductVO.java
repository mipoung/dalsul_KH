package com.dalsul.user.main.vo;

import lombok.Data;

@Data
public class ProductVO {
	private int product_no;				  // 제품번호 - 상세페이지로 이동
	private String product_name;		  // 제품명 - 화면 표시, 제품 검색
	private String product_type;		  // 주종	- 화면 표시, 제품 분류
	private int product_ml;				  // 용량	- 화면 표시, 제품 분류
	private int product_alcohol;		  // 도수	- 화면 표시, 제품 분류
	private String product_taste;		  // 맛	- 제품 분류
	private String product_base;		  // 원료	- 제품 분류
    private int product_price;			  // 가격 - 화면 표시
    private int product_stock;			  // 재고	- 상품판매여부
    private String product_main_image;	  // 제품대표이미지 - 화면 표시 
    private String product_explain_image; // 제품상세이미지 - 화면 표시
    private int product_sale_status;	  // 제품 판매여부
    
    
    private int review_num;				  // 리뷰개수 - 화면 표시	
    private double review_rating;		  // 별점 - 화면 표시
    
    
    private int product_type_count; // 관리자페이지 메인에서 제품 타입별 개수를 보여주려고 추가함(영훈)
    private String avg_price;
    private String avg_rating;
    private String best_product;
    private String reviewOrderBy; // 상세페이지 리뷰 정렬 용도
}