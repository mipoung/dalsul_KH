package com.dalsul.manager.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dalsul.manager.dao.ManagerDAO;


import lombok.Setter;

@Service
public class ManagerServiceImpl implements ManagerService {
	
	@Setter(onMethod_ = @Autowired)
	private ManagerDAO managerDAO;
	

	
	
}
