package com.dalsul.common.cs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dalsul.common.cs.dao.InquiryDAO;
import com.dalsul.common.cs.vo.InquiryVO;

import lombok.Setter;

@Service
public class InquiryServiceImpl implements InquiryService {
	
	@Setter(onMethod_ = @Autowired)
	private InquiryDAO inquiryDAO;
	
	@Override
	public List<InquiryVO> inquiryList(InquiryVO ivo){
		List<InquiryVO> list = null;
		list = inquiryDAO.inquiryList(ivo);
		
		return list;
	}
	
	@Override
	public int inquiryInsert(InquiryVO ivo) {
		int result = 0;
		result = inquiryDAO.inquiryInsert(ivo);
		return result;
	}
	
	@Override
	public InquiryVO inquiryDetail(InquiryVO ivo) {
		InquiryVO detail = inquiryDAO.inquiryDetail(ivo);
		
		//질문 내용 줄바꿈
		if(detail != null) {
			detail.setInquiry_question(detail.getInquiry_question().toString().replaceAll("\n", "<br/>"));
		}
		return detail;
	}
	
	@Override
	public int pwdConfirm(InquiryVO ivo) {
		int result = 0;
		result = inquiryDAO.pwdConfirm(ivo);
		return result;
	}
	
	@Override
	public InquiryVO inquiryUpdateForm(InquiryVO ivo) {
		InquiryVO updateData = null;
		updateData = inquiryDAO.inquiryDetail(ivo);
		return updateData;
	}
	
	@Override
	public int inquiryUpdate(InquiryVO ivo) {
		int result = 0;
		result = inquiryDAO.inquiryUpdate(ivo);
		return result;
	}
	@Override
	public int inquiryDelete(InquiryVO ivo) {
		int result = 0;
		result = inquiryDAO.inquiryDelete(ivo);
		return result;
	}
	
	@Override
	public int inquiryListCnt(InquiryVO ivo) {
		int result = 0;
		result = inquiryDAO.inquiryListCnt(ivo);
		return result;
		
	}
	


}
