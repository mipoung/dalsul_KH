package com.dalsul.user.main.service;

import java.util.List;

import com.dalsul.user.main.vo.ProductVO;

public interface MainService {
	public List<ProductVO> getMainPageProducts();			// 메인페이지
	public List<ProductVO> getSearchResult(String str);		// 검색페이지
	public List<ProductVO> getTotalPageProducts();			// 전체페이지

	
	public List<ProductVO> getProductsOrderByRating();		// 전체페이지-평점순
	public List<ProductVO> getProductsOrderByReviewCount(); // 전체페이지-리뷰순
	public List<ProductVO> getProductsOrderByPriceHigh();	// 전체페이지-가격높은순
	public List<ProductVO> getProductsOrderByPriceLow();	// 전체페이지-가격낮은순	
	
	
	
	//public List<ProductVO> getTotalResult(String product);	// 전체페이지-상품 필터링
	//public List<ProductVO> getSelectResult(String selectedValue); // 전체페이지 - 상품 셀렉팅 
	public ProductVO getDetailPageProducts(ProductVO vo);	// 상세페이지
	
}