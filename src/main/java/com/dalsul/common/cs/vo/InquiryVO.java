package com.dalsul.common.cs.vo;

import com.dalsul.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class InquiryVO extends CommonVO{
	private int inquiry_no = 0;			//글 번호
	private int user_no = 0;				//회원일련번호
	private String inquiry_title;		//글 제목
	private String inquiry_question;	//글 내용
	private String inquiry_password = "";	//글 비밀번호
	private String inquiry_date;		//글 작성일
	private String inquiry_update_date;	//글 수정일

	
}
