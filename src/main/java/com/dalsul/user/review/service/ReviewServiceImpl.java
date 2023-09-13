package com.dalsul.user.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dalsul.common.login.vo.UserVO;
import com.dalsul.common.vo.CommonVO;
import com.dalsul.user.review.dao.ReviewDAO;
import com.dalsul.user.review.vo.ProductVO;
import com.dalsul.user.review.vo.ReviewVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ReviewServiceImpl implements ReviewService {
	@Setter(onMethod_ = @Autowired)
	private ReviewDAO reviewDAO;
	
	
	@Override
	public List<ReviewVO> myReviewList(UserVO uvo) {
		List<ReviewVO> list = reviewDAO.myReviewList(uvo);
		return list;
	}
	
	
	
	@Override
	public List<ReviewVO> managerReviewList(CommonVO cvo) {
		List<ReviewVO> list = reviewDAO.managerReviewList(cvo);
		return list;
	}
	
	
	
	
	@Override
	public List<ReviewVO> detailReviewList(ReviewVO rvo) {
		List<ReviewVO> list = reviewDAO.detailReviewList(rvo);
		return list;
	}

	


	@Override
	public void myReviewDelete(ReviewVO rvo) {
		reviewDAO.myReviewDelete(rvo);
	}


	@Override
	public int myReviewInsert(ReviewVO rvo) {
		int result = reviewDAO.myReviewInsert(rvo);
		
		
		
		return result;
	}


	@Override
	public int myReviewUpdate(ReviewVO rvo) {
		int result = reviewDAO.myReviewUpdate(rvo);
		return result;
	}



	@Override
	public int reviewLikeCount(ReviewVO rvo) {
		int reivewCount = reviewDAO.reviewLikeCount(rvo);
		return reivewCount;
	}


	@Override
	public int reviewLikeCountPlus(ReviewVO rvo) {
		int CountPlus = reviewDAO.reviewLikeCountPlus(rvo);
		return CountPlus;
	}



	@Override
	public int reviewListCnt(ReviewVO rvo) {
		int result = reviewDAO.reviewListCnt(rvo);
		return result;
	}










	

	

}
