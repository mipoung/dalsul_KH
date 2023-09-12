package com.dalsul.common.cs.vo;

import com.dalsul.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class FAQVO extends CommonVO{
	
	private int faq_no = 0;				//글번호
	private String faq_title = "";		//글제목
	private String faq_question = "";	//faq 질문
	private String faq_answer = "";		//faq 답변
	private String faq_date;		//작성일자
	private String faq_update_date;	//수정일자
}
