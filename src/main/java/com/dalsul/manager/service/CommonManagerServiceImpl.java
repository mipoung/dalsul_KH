package com.dalsul.manager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dalsul.common.login.vo.UserVO;
import com.dalsul.manager.dao.CommonManagerDAO;
import com.dalsul.manager.vo.ManagerCommonVO;
import com.dalsul.user.main.vo.ProductVO;

import lombok.Setter;

@Service
public class CommonManagerServiceImpl implements CommonManagerService {
	
	@Setter(onMethod_ = @Autowired)
	private CommonManagerDAO commonManagerDAO;

	@Override
	public List<ProductVO> managerMainChart() {
		List<ProductVO> result = commonManagerDAO.managerMainChart();
		return result;
	}

	@Override
	public List<ManagerCommonVO> managerMainCount() {
		List<ManagerCommonVO> result = commonManagerDAO.managerMainCount();
		return result;
	}

	@Override
	public List<ManagerCommonVO> managerReviewChart() {
		List<ManagerCommonVO> reviewChartData = commonManagerDAO.managerReviewChart();
		return reviewChartData;
	}

	@Override
	public List<ManagerCommonVO> managerReviewStatistics() {
		List<ManagerCommonVO> reviewStaticsData = commonManagerDAO.managerReviewStatistics();
		return reviewStaticsData;
	}



}
