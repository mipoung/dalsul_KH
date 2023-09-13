package com.dalsul.user.review.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dalsul.common.session.UserVO;
import com.dalsul.common.vo.CommonVO;
import com.dalsul.user.review.vo.ProductVO;
import com.dalsul.user.review.vo.ReviewVO;


public interface ReviewService {
	public List<ReviewVO> myReviewList(UserVO uvo);
	public List<ReviewVO> detailReviewList(ReviewVO rvo);
	public List<ReviewVO> managerReviewList(CommonVO cvo);
	
	public void myReviewDelete(ReviewVO rvo);
	public int myReviewInsert(ReviewVO rvo);
	public int myReviewUpdate(ReviewVO rvo);
	
	public int reviewLikeCountPlus(ReviewVO rvo);
	public int reviewLikeCount(ReviewVO rvo);
	
	
	public int reviewListCnt(ReviewVO rvo);
	
	
}
