package com.dalsul.common.login.service;

import com.dalsul.common.login.vo.ManagerVO;

public interface ManagerLoginService {
	public String getSalt(ManagerVO mvo);
	public ManagerVO passwordVerification(ManagerVO mvo);
}
