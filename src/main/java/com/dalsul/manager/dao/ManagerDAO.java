package com.dalsul.manager.dao;

import java.util.List;

import com.dalsul.user.review.vo.ProductVO;

public interface ManagerDAO {
	public List<ProductVO> managerMainChart(ProductVO pvo);
}
