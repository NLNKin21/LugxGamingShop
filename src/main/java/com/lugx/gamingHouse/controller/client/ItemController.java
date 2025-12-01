package com.lugx.gamingHouse.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ItemController {

    @RequestMapping("/product/{id}")
    public String getProductDetailPage(Model model, @PathVariable long id) {
        // User uid = this.userService.getUserById(id);
        // model.addAttribute("Userid", uid);
        return "client/product/detail";
    }
}
