package com.dalsul.common.login.vo;

import com.dalsul.common.vo.CommonVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class UserVO extends CommonVO{
	private int user_no;
	private String user_email;
	private String user_password;
	private String user_salt;
	private String user_name;
	private String user_birth;
	private String user_phone_num;
	private String user_reg_date;
	private String user_update_reg_date;
	private String user_status;
} 