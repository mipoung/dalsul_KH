package com.dalsul.user.addr.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dalsul.common.login.vo.UserVO;
import com.dalsul.user.addr.dao.AddrApiDAO;
import com.dalsul.user.addr.vo.AddrVO;

import lombok.Setter;

@Service
public class AddrServiceImpl implements AddrService {
	
	@Setter(onMethod_ = @Autowired)
	private AddrApiDAO addrApiDAO;

	/*쿼리문을 실행하고 성공과 실패여부를 1과 0으로 반환받음, 그결과를 확인하기위해 console에서 확인*/
	
	@Override
	public int insertAddr(AddrVO avo) {
		int result = 0;
		
		result = addrApiDAO.insertAddr(avo);
		if(result !=0) {
			System.out.println("추가에 성공하였습니다.");
		}else {
			System.out.println("추가에 실패하였습니다.");
		}	
		return result;
	}
	
	
	@Override
	public List<AddrVO> userAddrInfo(UserVO uvo) {
		List<AddrVO> result= null;
		result = addrApiDAO.userAddrInfo(uvo);
				
		return result;
		
	}
	
	/*쿼리문을 실행하고 성공과 실패여부를 1과 0으로 반환받음, 그결과를 확인하기위해 console에서 확인*/
	@Override
	public int updateAddr(AddrVO bvo) {
		int result = 0;
		
		result = addrApiDAO.updateAddr(bvo);
		if(result !=0) {
			System.out.println("수정에 성공하였습니다.");
		}else {
			System.out.println("수정에 실패하였습니다.");
		}	
		return result;
	}
	
	/*쿼리문을 실행하고 성공과 실패여부를 1과 0으로 반환받음, 그결과를 확인하기위해 console에서 확인*/
	@Override
	public int deleteAddr(AddrVO bvo) {
		int result = 0;
		
		result = addrApiDAO.deleteAddr(bvo);
		if(result !=0) {
			System.out.println("삭제에 성공하였습니다.");
		}else {
			System.out.println("삭제에 실패하였습니다.");
		}	
		return result;
	}
	
	/*사용자 입력 레코드 개수 검증 함수 */
	@Override
	public String chkUserAddr(UserVO uvo) {
		String result;
		
		result = addrApiDAO.chkUserAddr(uvo);
		
		return result;
	}
	
	/*사용자 선택 레코드 읽어오는함수*/
	@Override
	public AddrVO selectAddr(AddrVO avo) {
		AddrVO result;
		
		result = addrApiDAO.selectAddr(avo);
		
		return result;
	}
	

}