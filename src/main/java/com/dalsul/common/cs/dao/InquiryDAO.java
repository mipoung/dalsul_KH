package com.dalsul.common.cs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.dalsul.common.cs.vo.InquiryVO;

@Mapper
public interface InquiryDAO {

	public List<InquiryVO> inquiryList(InquiryVO ivo);
	public InquiryVO inquiryDetail(InquiryVO ivo);
	public int inquiryInsert(InquiryVO ivo);
	public int pwdConfirm(InquiryVO ivo);
	public int inquiryUpdate(InquiryVO ivo);
	public int inquiryDelete(InquiryVO ivo);
	public int inquiryListCnt(InquiryVO ivo);

}
