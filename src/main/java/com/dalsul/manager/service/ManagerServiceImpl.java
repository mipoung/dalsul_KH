package com.dalsul.manager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.dalsul.common.login.vo.UserVO;
import com.dalsul.manager.dao.ManagerDAO;
import com.dalsul.user.pay.vo.PayVO;

@Service
public class ManagerServiceImpl implements ManagerService {

	@Autowired
	private ManagerDAO managerDAO;
	
	@Override
	public List<UserVO> getUserList(UserVO uvo) {
		List<UserVO> result = managerDAO.getUserList(uvo);
		return result;
	}

	@Override
	public int userListCnt(UserVO uvo) {
		int result = managerDAO.userListCnt(uvo);
		return result;
	}

	@Override
	public int dropUsers(List<Integer> user_no) {
		int result = managerDAO.dropUsers(user_no);
		return result;
	}

	@Override
	public int appointManager(List<Integer> user_no) {
		int result = managerDAO.appointManager(user_no);
		return result;
	}

	//관리자가 구매자 내역 조회
	@Override
	public List<PayVO> orderListViewM(PayVO pvo) {
		List<PayVO> list;
		list=managerDAO.orderListViewM(pvo);
		return list;
	}
	
	//관리자가 구매자 상태 값 변경
	@Override
    public int updateOrderStatus(List<PayVO> selectedOrders) {
        int result = managerDAO.updateOrderStatus(selectedOrders);
        return result;
    }

}
