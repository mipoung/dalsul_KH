package com.dalsul.manager.vo;

import lombok.Data;

@Data
public class ManagerVO {
	// 메인 페이지 통계를 위해 필요한 필드
		private String product_count;
		private String review_count;
		private String users_count;
		private String today_users_count;
		private String today_review_count;
		private String today_product_count;
}
