package com.dalsul.user.addr.dao;

import org.apache.ibatis.annotations.Mapper;

import com.dalsul.user.addr.vo.AddrVO;

@Mapper
public interface AddrApiDAO {
	
	public int insertAddr(AddrVO bvo); //기본배송주소지 추가 
	public AddrVO selectAddr(AddrVO bvo); //기본배송주소지 조회
	public int updateAddr(AddrVO bvo);	//기본배송주소지 업데이트
	public int deleteAddr(AddrVO bvo);	//기본배송주소지 삭제
	public String chkUserAddr(AddrVO bvo); //사용자 배송지 입력개수 체크 함수
	
}
