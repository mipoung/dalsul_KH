package com.dalsul.user.main.dao;

import com.dalsul.user.main.vo.ProductVO;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface MainDAO {
    public List<ProductVO> getMainPageProducts();
    
    public List<ProductVO> getSearchResult(String str);
    
    public List<ProductVO> getTotalPageProducts();
    
    public List<ProductVO> getProducts(String str);
    
    public List<ProductVO> getProductsOrderByRating();
    
    public List<ProductVO> getProductsOrderByReviewCount();
    
    public List<ProductVO> getProductsOrderByPriceHigh();
    
    public List<ProductVO> getProductsOrderByPriceLow();
    
    //public List<ProductVO> getTotalResult(String str);
    
    //public List<ProductVO> getSelectResult(String str);
    
    public ProductVO getDetailPageProducts(ProductVO vo);
    
    
}