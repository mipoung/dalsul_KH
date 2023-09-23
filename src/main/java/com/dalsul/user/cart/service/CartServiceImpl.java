package com.dalsul.user.cart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dalsul.common.login.vo.UserVO;
import com.dalsul.user.cart.dao.CartDAO;
import com.dalsul.user.cart.vo.CartVO;

import lombok.Setter;

@Service
public class CartServiceImpl implements CartService{
	@Setter(onMethod_ =@Autowired )
	private CartDAO cartDao;
	
	@Override
	public List<CartVO> cartList(UserVO uvo) {
		List<CartVO> list;
		list=cartDao.cartList(uvo);
		return list;
	}
	

	@Override
    public int cartInsert(CartVO cvo) {
        int result = cartDao.cartInsert(cvo);
        return result;
    }

	@Override
	public int cartDelete(CartVO cvo) {
		int result = 0;
		result = cartDao.cartDelete(cvo.getProduct_no());
		return result;
	}

	@Override
	public int cartPlus(CartVO cvo) {
		int result = cartDao.cartPlus(cvo);
		return result;
	}

	@Override
	public int cartMinus(CartVO cvo) {
		int result=cartDao.cartMinus(cvo);
		return result;
	}


	@Override
	public UserVO getUserInfo(UserVO uvo) {
		UserVO result = cartDao.getUserInfo(uvo);
		return result;
	}


	@Override
	public List<CartVO> cartListDetail(UserVO uvo) {
		List<CartVO> list;
		list=cartDao.cartList(uvo);
		return list;
	}




}
