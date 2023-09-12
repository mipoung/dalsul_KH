package com.dalsul.common.session;

import com.dalsul.common.vo.CommonVO;

import lombok.Data;
import lombok.Setter;

@Data
public class UserVO {
	private int user_no;
	private String user_email = "mimpoug";
	

	
	public UserVO() {};
	
	
	public UserVO(int user_no) {
		this.user_no = user_no;
	}
	
	
}
