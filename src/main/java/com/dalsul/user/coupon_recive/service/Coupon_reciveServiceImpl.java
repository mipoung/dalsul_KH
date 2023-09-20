package com.dalsul.user.coupon_recive.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dalsul.user.coupon_recive.dao.Coupon_reciveDAO;

import lombok.Setter;

@Service
public class Coupon_reciveServiceImpl implements Coupon_reciveService {

	@Setter(onMethod_ =@Autowired)
	private Coupon_reciveDAO coupon_reciveDAO;
}
