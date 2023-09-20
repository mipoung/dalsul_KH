package com.dalsul.user.main.dao;

import com.dalsul.user.main.vo.ProductVO;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface MainDAO {
    public List<ProductVO> getMainPageProducts();
    
    public List<ProductVO> getSearchResult(String str);
    
    public List<ProductVO> getTotalPageProducts();
    
    public ProductVO getDetailPageProducts(ProductVO vo);
    
    
}