package com.dalsul.user.addr.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.dalsul.common.login.vo.UserVO;
import com.dalsul.user.addr.vo.AddrVO;

@Mapper
public interface AddrApiDAO {
	
	public int insertAddr(AddrVO avo); //기본배송주소지 추가 
	public List<AddrVO> userAddrInfo(UserVO uvo); //기본배송주소지 조회
	public int updateAddr(AddrVO bvo);	//기본배송주소지 업데이트
	public int deleteAddr(AddrVO bvo);	//기본배송주소지 삭제
	public String chkUserAddr(UserVO uvo); //사용자 배송지 입력개수 체크 함수
	public AddrVO selectAddr(AddrVO avo); //사용자가 여러배송지중 하나의 배송지를 클릭했을시 읽어오는 함수
	
}
