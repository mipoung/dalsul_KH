package com.dalsul.common.cs.service;

import java.util.List;


import com.dalsul.common.cs.vo.FAQVO;


public interface FAQService {

	public List<FAQVO> faqList(FAQVO fvo);
	public int faqListCnt(FAQVO fvo);
	public int adminFAQInsert(FAQVO fvo);
	public FAQVO adminFAQUpdateForm(FAQVO fvo);
	public int adminFAQUpdate(FAQVO fvo);
	public FAQVO faqDetail(FAQVO fvo);
	public int adminFAQDelete(FAQVO fvo);
}
