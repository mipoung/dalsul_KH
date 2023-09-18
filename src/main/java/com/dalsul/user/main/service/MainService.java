package com.dalsul.user.main.service;

import java.util.List;

import com.dalsul.user.main.vo.ProductVO;

public interface MainService {
	public List<ProductVO> getMainPageProducts();
	public List<ProductVO> getSearchResult(String str);
	public ProductVO getDetailPageProducts(ProductVO vo);	// 상세페이지
}