package com.dalsul.manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.dalsul.common.login.vo.UserVO;
import com.dalsul.common.vo.PageDTO;
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
		public String managerMain(@SessionAttribute(name="managerLogin", required = false) ManagerVO mvo,  Model model) {
			
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
			
			
			return "/manager/managerMain";
		}
	
	// 회원 정보 조회
	@GetMapping("/manager/userManagement")
	public String userManagement(@SessionAttribute(name="managerLogin", required = false) ManagerVO mvo, @ModelAttribute UserVO uvo, Model model) {
		if(mvo==null) {
			return "account/login/managerLoginForm";
		}
		
		List<UserVO> userList = managerService.getUserList(uvo);
		model.addAttribute("user", userList);
		
		// 전체 레코드 수 반환
		int total = managerService.userListCnt(uvo);

		// 페이징 처리
		model.addAttribute("pageMaker", new PageDTO(uvo, total));
		// new PageDTO(CommonVO 또는 CommonVO 하위 클래스의 인스턴스 (BoardVO), 총 레코드 수)
		
		return "/manager/user/userManagement";
	}
}
