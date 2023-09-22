package com.dalsul.user.main.service;

import java.util.List;

import com.dalsul.user.main.vo.ProductVO;

public interface MainService {
	public List<ProductVO> getMainPageProducts();			// 메인페이지
	public List<ProductVO> getSearchResult(String str);		// 검색페이지
	public List<ProductVO> getTotalPageProducts();			// 전체페이지
	public List<ProductVO> getTotalResult(String product);	// 전체페이지-상품 필터링
	public ProductVO getDetailPageProducts(ProductVO vo);	// 상세페이지
	
}