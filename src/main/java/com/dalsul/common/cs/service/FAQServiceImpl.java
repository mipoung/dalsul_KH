package com.dalsul.common.cs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dalsul.common.cs.dao.FAQDAO;
import com.dalsul.common.cs.vo.FAQVO;

import lombok.Setter;



@Service
public class FAQServiceImpl implements FAQService{
	
	@Setter(onMethod_ = @Autowired)
	private FAQDAO faqDAO;
	
	@Override
	public List<FAQVO> faqList(FAQVO fvo){
		List<FAQVO> list = null;
		list = faqDAO.faqList(fvo);
		//System.out.println("2. 서비스에서 받아오는 값 : "+list.toString());
		return list;
	}
	@Override
	public int adminFAQInsert(FAQVO fvo) {
		int result = 0;
		
		result = faqDAO.adminFAQInsert(fvo);

		return result;
		
	}
	@Override
	public FAQVO faqDetail(FAQVO fvo) {
		FAQVO detail = faqDAO.faqDetail(fvo);
		
		//faq 내용 줄 바꿈 코드
		if(detail != null) {
			detail.setFaq_answer(detail.getFaq_answer().toString().replaceAll("\n", "<br/>"));
		}
		return detail;
		
	}
	@Override
	public FAQVO adminFAQUpdateForm(FAQVO fvo) {
		FAQVO updateData = null;
		updateData = faqDAO.faqDetail(fvo);
		return updateData;
	}
	@Override
	public int adminFAQUpdate(FAQVO fvo) {
		int result = 0;
		result = faqDAO.adminFAQUpdate(fvo);
		return result;
		
	}
	@Override
	public int adminFAQDelete(FAQVO fvo) {
	    int result = 0;
	    result = faqDAO.adminFAQDelete(fvo);
	    return result;
	}
	@Override
	public int faqListCnt(FAQVO fvo) {
		int result = 0;
		result = faqDAO.faqListCnt(fvo);
		return result;
	}

}
