package com.dalsul.user.main.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/products")
public class ProductController {

   /* @GetMapping("/all")
    public List<String> getAllProductNames() {
        // 모든 제품명을 데이터베이스 또는 다른 소스에서 가져오는 로직 작성
        List<String> productNames = productService.getAllProductNames();
        
        return productNames;
    }*/
}
