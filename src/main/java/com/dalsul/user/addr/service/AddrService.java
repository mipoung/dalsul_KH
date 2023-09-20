package com.dalsul.user.addr.service;

import java.util.List;

import com.dalsul.common.login.vo.UserVO;
import com.dalsul.user.addr.vo.AddrVO;

public interface AddrService {
	
	/*사용자가 기본배송지 정보를 api를 이용해 데이터 베이스에 저장하는 메소드*/
	public int insertAddr(AddrVO bvo );
	
	/*사용자가 저장한 기본배송지 정보를 조회하는 메소드*/
	public List<AddrVO> userAddrInfo(UserVO uvo);

	/*사용자가 저장한 기본배송지 정보를 업데이트하는 메소드*/
	public int updateAddr(AddrVO bvo);

	/*사용자가 저장한 기본배송지 정보를 삭제하는 메소드*/
	public int deleteAddr(AddrVO bvo);

	/*사용자가 배송지를 추가하기전 5개이상이면 true를 반환받는 메소드*/
	public String chkUserAddr(AddrVO bvo);

	
}
