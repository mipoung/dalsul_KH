package com.dalsul.user.addr.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dalsul.user.addr.dao.AddrApiDAO;
import com.dalsul.user.addr.vo.AddrVO;

import lombok.Setter;

@Service
public class AddrServiceImpl implements AddrService {
	
	@Setter(onMethod_ = @Autowired)
	private AddrApiDAO addrApiDAO;

	/*쿼리문을 실행하고 성공과 실패여부를 1과 0으로 반환받음, 그결과를 확인하기위해 console에서 확인*/
	
	@Override
	public int insertAddr(AddrVO bvo) {
		int result = 0;
		
		result = addrApiDAO.insertAddr(bvo);
		if(result !=0) {
			System.out.println("추가에 성공하였습니다.");
		}else {
			System.out.println("추가에 실패하였습니다.");
		}	
		return result;
	}
	
	
	@Override
	public AddrVO selectAddr(AddrVO bvo) {
		AddrVO result = null;
		result = addrApiDAO.selectAddr(bvo);
				
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

}