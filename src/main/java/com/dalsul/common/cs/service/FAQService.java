package com.dalsul.common.cs.service;

import java.util.List;


import com.dalsul.common.cs.vo.FAQVO;

public interface FAQService {

	public List<FAQVO> faqList(FAQVO fvo);
	public int faqListCnt(FAQVO fvo);
	public int managerFAQInsert(FAQVO fvo);
	public FAQVO managerFAQUpdateForm(FAQVO fvo);
	public int managerFAQUpdate(FAQVO fvo);
	public FAQVO faqDetail(FAQVO fvo);
	public int managerFAQDelete(FAQVO fvo);
}
