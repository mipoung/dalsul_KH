package com.dalsul.common.login.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ManagerVO {
	private int manager_no;
	private String manager_email;
	private String manager_password;
	private String manager_salt;
	private String manager_name;
	private String manager_birth;
	private String manager_phone_num;
	private String manager_reg_date;
	private String manager_update_reg_date;
	private String manager_status;
}