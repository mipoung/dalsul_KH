package com.dalsul.common.cs.vo;

import com.dalsul.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class ReplyVO extends CommonVO {
	private int reply_no = 0;
	private int inquiry_no = 0;
	private String reply_answer = "";
	private String reply_date;
	private String reply_update_date;
	

}
