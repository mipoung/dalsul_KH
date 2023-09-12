package com.dalsul.common.cs.vo;

import com.dalsul.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class NoticeVO extends CommonVO{
	private int notice_no = 0;
	private String notice_title = "";
	private String notice_subject = "";
	private String notice_date;
	private String notice_update_date;

}
