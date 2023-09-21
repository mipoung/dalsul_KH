package com.dalsul.manager.service;

import java.util.List;

import com.dalsul.user.main.vo.ProductVO;

public interface ProductService {
	public List<ProductVO> getProductList(ProductVO pvo);
	public int getProductListCnt(ProductVO pvo);
	public int productRegProcess(ProductVO pvo);
	public int productUpdate(ProductVO pvo);
	public List<ProductVO> productUpdateList(List<Integer> product_no);
	public int productDelete(List<Integer> product_no);
}