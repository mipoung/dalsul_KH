package com.dalsul.common.cs.service;

import java.util.List;


import com.dalsul.common.cs.vo.InquiryVO;

public interface InquiryService {

	public List<InquiryVO> inquiryList(InquiryVO ivo);
	public int inquiryListCnt(InquiryVO ivo);
	public int inquiryInsert(InquiryVO ivo);
	public InquiryVO inquiryDetail(InquiryVO ivo);
	public int pwdConfirm(InquiryVO ivo);
	public InquiryVO inquiryUpdateForm(InquiryVO ivo);
	public int inquiryUpdate(InquiryVO ivo);
	public int inquiryDelete(InquiryVO ivo);


}
