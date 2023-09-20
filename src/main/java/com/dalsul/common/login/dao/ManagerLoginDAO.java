package com.dalsul.common.login.dao;

import org.apache.ibatis.annotations.Mapper;

import com.dalsul.common.login.vo.ManagerVO;

@Mapper
public interface ManagerLoginDAO {
	public String getSalt(ManagerVO mvo);
	public String passwordVerification(ManagerVO mvo);
	public String getPassword(ManagerVO mvo);
	public ManagerVO getManagerInfo(ManagerVO mvo);
}