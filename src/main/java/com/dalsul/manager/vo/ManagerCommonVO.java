package com.dalsul.manager.vo;

import lombok.Data;

@Data
public class ManagerCommonVO {
	// 메인 페이지 통계를 위해 필요한 필드
		private String product_count;
		private String review_count;
		private String users_count;
		private String today_users_count;
		private String today_review_count;
		private String today_product_count;
		
		
	// 리뷰 페이지 차트 데이터
		private String product_type;
		private String avg_review_rating;
		private String avg_product_alcohol;
		private String avg_product_price;
		
		private String review_like_count;
		private String review_today;
		
		private String max_like_review_no;
		private String max_like_product_name;
		private String max_review_rating;
}
