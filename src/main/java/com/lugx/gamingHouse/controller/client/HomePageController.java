package com.lugx.gamingHouse.controller.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


import com.lugx.gamingHouse.domain.Product;
import com.lugx.gamingHouse.services.ProductService;

@Controller
public class HomePageController {
    private final ProductService productService;

    public HomePageController(ProductService productService){
        this.productService = productService;
    }

    @GetMapping("/")
    public String getHomePage(Model model) {
        // Trending = sold cao nhất
        List<Product> trending = productService.getTrendingProducts(4);
        // Most Played = hiển thị game hot cố định hoặc theo lượt xem
        List<Product> mostPlayed = productService.getMostPlayedProducts(); // tự viết query lấy 6 cái hot nhất

        model.addAttribute("trendingProducts", trending);
        model.addAttribute("mostPlayedProducts", mostPlayed);
        return "client/homepage/show"; 
    }
}