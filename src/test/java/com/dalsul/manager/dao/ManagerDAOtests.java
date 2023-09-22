package com.dalsul.manager.dao;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.dalsul.manager.vo.ManagerCommonVO;
import com.dalsul.user.main.vo.ProductVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
public class ManagerDAOtests {
	
	@Setter(onMethod_ = @Autowired)
	private CommonManagerDAO commonManagerDAO;
	
	/*
	@Test
	public void testManagerMainChart() {
		log.info("===== testManagerMainChart 실행 =====");
		List<ProductVO> result = commonManagerDAO.managerMainChart();
		log.info("결과 값 : " + result.get(0));
		
	}
	*/
	
	/*
	@Test
	public void testManagerMainCount() {
		log.info("======= testManagerMainCount 호출 ======");
			
		List<ManagerCommonVO> result = null;
		result = commonManagerDAO.managerMainCount();
		
		log.info("결과 : " + result.toString());
		
	}
	*/
	
	@Test
	public void testManagerReviewChart() {
		log.info("=======managerReviewChart 호출==========");
		
		List<ManagerCommonVO> reviewChartDate = commonManagerDAO.managerReviewChart();
		
		log.info("차트데이터 : " + reviewChartDate.toString());
		
	};
	
	
	
	
}
