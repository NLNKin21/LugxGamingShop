package com.lugx.gamingHouse.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lugx.gamingHouse.domain.User;


@Controller
public class HomePageController {
    @GetMapping("/")
    public String getHomePage() {
        return "/client/homepage/show";
    }

}
