package com.dalsul.manager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.dalsul.common.login.vo.ManagerVO;
import com.dalsul.manager.service.ManagerService;
import com.dalsul.common.vo.PageDTO;
import com.dalsul.common.login.vo.UserVO;
import java.util.List;

import lombok.Setter;

@Controller
public class CommonManagerController {

	// 관리자페이지 메인으로 이동
		@GetMapping("/manager/managerMain")
		public String managerMain(@SessionAttribute(name="managerLogin", required = false) ManagerVO mvo,  Model model) {
			
			if(mvo==null) {
				return "account/login/managerLoginForm";
			}
			
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
