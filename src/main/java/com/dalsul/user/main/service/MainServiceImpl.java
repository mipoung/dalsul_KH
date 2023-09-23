package com.dalsul.user.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dalsul.user.main.dao.MainDAO;
import com.dalsul.user.main.vo.ProductVO;

@Service
public class MainServiceImpl implements MainService {
	private final MainDAO mainDao;

	@Autowired
	public MainServiceImpl(MainDAO mainDao) {
		this.mainDao = mainDao;
	}

	@Override
	public List<ProductVO> getMainPageProducts() {
		return mainDao.getMainPageProducts();
	}
	
	@Override
	public List<ProductVO> getSearchResult(String str) {
		return mainDao.getSearchResult(str);
	}
	
	@Override
	public List<ProductVO> getTotalPageProducts() {
		return mainDao.getTotalPageProducts();
	}
	
	
	@Override
	public List<ProductVO> getProductsOrderByRating() {
		return mainDao.getProductsOrderByRating();
	}
	
	@Override
	public List<ProductVO> getProductsOrderByReviewCount() {
		return mainDao.getProductsOrderByReviewCount();
	}
	
	@Override
	public List<ProductVO> getProductsOrderByPriceHigh() {
		return mainDao.getProductsOrderByPriceHigh();
	}
	
	@Override
	public List<ProductVO> getProductsOrderByPriceLow() {
		return mainDao.getProductsOrderByPriceLow();
	}
	
	/*@Override
	public List<ProductVO> getTotalResult(String str) {
		return mainDao.getTotalResult(str);
	}
	
	@Override
	public List<ProductVO> getSelectResult(String str) {
		return mainDao.getSelectResult(str);
	}*/
	
	@Override
	public ProductVO getDetailPageProducts(ProductVO vo) {
			
		return mainDao.getDetailPageProducts(vo);
	}


}
