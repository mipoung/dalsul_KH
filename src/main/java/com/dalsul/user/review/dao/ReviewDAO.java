package com.dalsul.user.review.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.dalsul.common.login.vo.UserVO;
import com.dalsul.common.vo.CommonVO;
import com.dalsul.user.review.vo.ProductVO;
import com.dalsul.user.review.vo.ReviewVO;

@Mapper
public interface ReviewDAO {
	public List<ReviewVO> myReviewList(UserVO uvo);
	public List<ReviewVO> detailReviewList(ReviewVO rvo);
	public List<ReviewVO> managerReviewList(ReviewVO rvo);
	
	
	
	public int myReviewDelete(ReviewVO rvo);
	public int myReviewInsert(ReviewVO rvo);
	public int myReviewUpdate(ReviewVO rvo);
	
	
	public int reviewLikeCount(ReviewVO rvo);
	public int reviewLikeCountPlus(ReviewVO rvo);
	
	// 페이징 처리
	public int reviewListCnt(ReviewVO rvo);
	

}
