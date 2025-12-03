package com.lugx.gamingHouse.controller.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lugx.gamingHouse.domain.Product;
import com.lugx.gamingHouse.services.ProductService;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.GetMapping;



@Controller
public class ItemController {
    private final ProductService productService;

    public ItemController(ProductService productService){
        this.productService = productService;
    }

    @RequestMapping("/product/{id}")
    public String getProductDetailPage(Model model, @PathVariable long id) {
        Product product = productService.getProductById(id);
        List<Product> related = productService.getTrendingProducts(5); 

        model.addAttribute("product", product);
        model.addAttribute("relatedProducts", related);

        return "client/product/detail";
    }

    @GetMapping("/shop")
    public String getMethodName(@RequestParam String param) {
        return "client/product/shop";
    }
    
    
}
