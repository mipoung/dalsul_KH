package com.dalsul.user.review.vo;

import com.dalsul.common.vo.CommonVO;
import com.dalsul.user.main.vo.ProductVO;

import lombok.Data;
import lombok.EqualsAndHashCode;



@Data
@EqualsAndHashCode(callSuper=false)
public class ReviewVO extends CommonVO {
	private int review_no = 0;
	private int order_no = 0;
	private int user_no = 0; // 이미 UserVO가 갖고있으니 가져와서 사용하는거로 변경 예정
	private String review_content = "";
	private int review_rating = 0;
	private int review_like_count= 0;
	private String review_date;
	private int review_total_count = 0;

	private int product_no;
	private String product_name;
	private int product_alcohol;
	private String product_type;
	private String product_main_image;
	private int product_ml;
	private int product_price;
	
	private ProductVO pvo;

	// 정렬을 위한 필드 
	private String reviewOrderBy="";
	private String best_review;

	// 날짜 범위 검색을 위한 필드
	private String searchDate1;
	private String searchDate2;
	
	
	
	
	
	/*
	public String getProduct_name() {
        if (pvo != null) {
            return pvo.getProduct_name();
        }
        return "";
    }
	*/
	
	
	
	
	
	

	
	

}
