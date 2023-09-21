package com.dalsul.manager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dalsul.manager.dao.ProductDAO;
import com.dalsul.user.main.vo.ProductVO;

import lombok.Setter;

@Service
public class ProductServiceImpl implements ProductService{

	@Setter(onMethod_ = @Autowired)
	private ProductDAO productDAO;
	
	@Override
	public List<ProductVO> getProductList(ProductVO pvo) {
		List<ProductVO> result = productDAO.getProductList(pvo);
		
		return result;
	}

	@Override
	public int getProductListCnt(ProductVO pvo) {
		int result = productDAO.getProductListCnt(pvo);
		
		return result;
	}

	@Override
	public int productRegProcess(ProductVO pvo) {
		int result = productDAO.productRegProcess(pvo);
		
		return result;
	}

	@Override
	public int productUpdate(ProductVO pvo) {
		int result = productDAO.productUpdate(pvo);
		
		return result;
	}

	@Override
	public int productDelete(List<Integer> product_no) {
		int result = productDAO.productDelete(product_no);
		
		return result;
	}

	@Override
	public List<ProductVO> productUpdateList(List<Integer> product_no) {
		List<ProductVO> result = productDAO.productUpdateList(product_no);
		return result;
	}

}