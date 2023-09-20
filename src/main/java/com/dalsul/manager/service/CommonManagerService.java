package com.dalsul.manager.service;

import java.util.List;

import com.dalsul.common.login.vo.UserVO;
import com.dalsul.manager.vo.ManagerCommonVO;
import com.dalsul.user.main.vo.ProductVO;


public interface CommonManagerService {
	public List<ProductVO> managerMainChart();
	public List<ManagerCommonVO> managerMainCount();


}
