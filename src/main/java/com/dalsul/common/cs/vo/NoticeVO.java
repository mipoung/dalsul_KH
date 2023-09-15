package com.dalsul.common.cs.vo;

import com.dalsul.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class NoticeVO extends CommonVO{
	private int notice_no = 0;				//글 번호
	private String notice_title = "";		//글 제목
	private String notice_subject = "";		//글 내용
	private String notice_date;				//글 작성일
	private String notice_update_date;		//글 수정일

}
