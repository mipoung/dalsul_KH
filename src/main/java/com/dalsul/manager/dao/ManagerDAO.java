package com.dalsul.manager.dao;

import java.util.List;

import com.dalsul.user.main.vo.ProductVO;


public interface ManagerDAO {
	public List<ProductVO> managerMainChart(ProductVO pvo);
}
