package com.dalsul.manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.dalsul.manager.service.CommonManagerService;
import com.dalsul.manager.vo.ManagerVO;
import com.dalsul.user.main.vo.ProductVO;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.Setter;

@Controller
public class CommonManagerController {
	
	@Setter(onMethod_ = @Autowired)
	private CommonManagerService managerService;
	
	
	
	
	
	
	// 관리자페이지 메인으로 이동
		@GetMapping("/manager/managerMain")
		public String managerMain(Model model) {
			
			List<ProductVO> result = managerService.managerMainChart();
			model.addAttribute("result", result);
			
			
			List<ManagerVO> count = managerService.managerMainCount();
			model.addAttribute("count", count);
			
			
			// Java 객체를 JSON 문자열로 변환
		    ObjectMapper mapper = new ObjectMapper();
		    String jsonDataChart = "";
		    try {
		        jsonDataChart = mapper.writeValueAsString(result);
		    } catch (JsonProcessingException e) {
		        e.printStackTrace();
		    }
			
			model.addAttribute("chartData", jsonDataChart);
			
			
			
			
			
			return "manager/managerMain";
		}
	
}
