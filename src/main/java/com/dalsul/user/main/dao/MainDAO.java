package com.dalsul.user.main.dao;

import com.dalsul.user.main.vo.ProductVO;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface MainDAO {
    List<ProductVO> getMainPageProducts();
}