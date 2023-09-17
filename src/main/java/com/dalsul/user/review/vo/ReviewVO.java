package com.dalsul.user.review.vo;

import com.dalsul.common.vo.CommonVO;

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
	private int product_no = 0;

	
	// 정렬을 위한 필드 
	private String reviewOrderBy="";

	// 날짜 범위 검색을 위한 필드
	private String searchDate1;
	private String searchDate2;
	
	// productVO에도 있음
	private String product_name;
	private String product_alcohol;
	private String product_type;
	private String product_main_image;
	private String product_ml;
	private String product_price;
	
	private ProductVO pvo;
	
	
	
	/*
	public String getProduct_name() {
        if (pvo != null) {
            return pvo.getProduct_name();
        }
        return "";
    }
	*/
	
	
	

	
	

}
