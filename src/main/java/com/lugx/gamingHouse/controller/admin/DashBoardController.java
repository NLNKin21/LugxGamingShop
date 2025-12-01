package com.lugx.gamingHouse.controller.admin;

import org.springframework.stereotype.Controller;

import com.lugx.gamingHouse.services.UserService;

import ch.qos.logback.core.model.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class DashBoardController {
    private final UserService userService;

    public DashBoardController(UserService userService){
        this.userService = userService;
    }

    @GetMapping("/admin")
    public String getDashboard(Model model) {
        return "/admin/dashboard/show";
    }
    
}
