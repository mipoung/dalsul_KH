package com.dalsul.manager.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.dalsul.user.review.vo.ProductVO;

@Mapper
public interface ManagerDAO {
	public List<ProductVO> managerMainChart(ProductVO pvo);
	
}
