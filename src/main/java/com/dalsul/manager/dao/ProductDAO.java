package com.dalsul.manager.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.dalsul.user.main.vo.ProductVO;

@Mapper
public interface ProductDAO {
	public List<ProductVO> getProductList(ProductVO pvo);
	public int getProductListCnt(ProductVO pvo);
	public int productRegProcess(ProductVO pvo);
	public int productUpdate(ProductVO pvo);
	public int productDelete(List<Integer> product_no);
	public List<ProductVO> productUpdateList(List<Integer> product_no);
}
