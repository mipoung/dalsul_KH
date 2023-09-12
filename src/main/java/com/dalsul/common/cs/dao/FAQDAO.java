package com.dalsul.common.cs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.dalsul.common.cs.vo.FAQVO;

@Mapper
public interface FAQDAO {
	
	public List<FAQVO> faqList(FAQVO fvo);
	public int adminFAQInsert(FAQVO fvo);
	public FAQVO faqDetail(FAQVO fvo);
	public int adminFAQUpdate(FAQVO fvo);
	public int adminFAQDelete(FAQVO fvo);
	public int faqListCnt(FAQVO fvo);
	
}
