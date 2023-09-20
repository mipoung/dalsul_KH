package com.dalsul.manager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dalsul.common.login.vo.UserVO;
import com.dalsul.manager.dao.CommonManagerDAO;
import com.dalsul.manager.vo.ManagerVO;
import com.dalsul.user.main.vo.ProductVO;

import lombok.Setter;

@Service
public class CommonManagerServiceImpl implements CommonManagerService {
	
	@Setter(onMethod_ = @Autowired)
	private CommonManagerDAO managerDAO;

	@Override
	public List<ProductVO> managerMainChart() {
		List<ProductVO> result = managerDAO.managerMainChart();
		return result;
	}

	@Override
	public List<ManagerVO> managerMainCount() {
		List<ManagerVO> result = managerDAO.managerMainCount();
		return result;
	}



}
