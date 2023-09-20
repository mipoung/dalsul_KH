package com.dalsul.manager.service;

import java.util.List;

import com.dalsul.manager.vo.ManagerVO;
import com.dalsul.user.main.vo.ProductVO;


public interface CommonManagerService {
	public List<ProductVO> managerMainChart();
	public List<ManagerVO> managerMainCount();

}
