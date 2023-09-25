package com.dalsul.user.cart.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.dalsul.common.login.vo.UserVO;
import com.dalsul.user.cart.vo.CartVO;
@Mapper
public interface CartDAO {

	public int cartInsert(CartVO cvo);
	public int cartDelete(int product_no);
	public int cartPlus(CartVO cvo);
	public int cartMinus(CartVO cvo);
	public List<CartVO> cartList(UserVO uvo);
	public UserVO getUserInfo(UserVO uvo);
	public List<CartVO> cartListDetail(CartVO cvo);
	//List<CartVO> cartListDetailByProductNumbers(@Param("user_no") int user_no, @Param("productNumbers") List<Integer> productNumbers);
	}
