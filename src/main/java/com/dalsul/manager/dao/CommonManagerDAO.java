package com.dalsul.manager.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.dalsul.manager.vo.ManagerVO;
import com.dalsul.user.main.vo.ProductVO;
import com.dalsul.user.review.vo.ReviewVO;


@Mapper
public interface CommonManagerDAO {
	public List<ProductVO> managerMainChart();
	public List<ManagerVO> managerMainCount();
	
	
}
