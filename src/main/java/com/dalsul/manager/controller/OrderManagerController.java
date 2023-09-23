package com.dalsul.manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dalsul.manager.service.ManagerService;
import com.dalsul.user.pay.vo.PayVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/manager/order/*")
public class OrderManagerController {
	
	@Autowired
	private ManagerService managerService;
	
	@GetMapping("managerOrder")
	public String managerOrder(PayVO pvo,Model model) {
		
		List<PayVO> buyerList=managerService.orderListViewM(pvo);
		System.out.println(buyerList.toString());
		model.addAttribute("buyerList", buyerList);
		
		return "manager/order/managerOrder";
	}

	@ResponseBody
    @PostMapping("updateStatus") // POST 요청으로 변경
    public int updateStatus(@RequestBody List<PayVO> selectedOrders) {
		
		for (PayVO payVO : selectedOrders) {
			System.out.println(payVO.toString());
		}
        int result= managerService.updateOrderStatus(selectedOrders);
        System.out.println(result);
        
        
        return result; // 성공적으로 처리되면 어떤 응답을 반환해도 됩니다.
    }
}
