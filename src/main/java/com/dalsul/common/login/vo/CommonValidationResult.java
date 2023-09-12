package com.dalsul.common.login.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommonValidationResult {
	private boolean success;
	private String message;
}
