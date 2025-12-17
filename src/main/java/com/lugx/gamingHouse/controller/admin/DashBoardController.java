package com.lugx.gamingHouse.controller.admin;

import java.time.Year;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.lugx.gamingHouse.domain.Order;
import com.lugx.gamingHouse.services.OrderService;
import com.lugx.gamingHouse.services.ProductService;
import com.lugx.gamingHouse.services.UserService;

import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashBoardController {
    private final UserService userService;
    private final OrderService orderService;
    private final ProductService productService;

    public DashBoardController(UserService userService, OrderService orderService, ProductService productService) {
        this.userService = userService;
        this.orderService = orderService;
        this.productService = productService;
    }

    @GetMapping("/admin")
    public String getDashboard(Model model) {
        // Statistics
        model.addAttribute("countUsers", this.userService.countUsers());
        model.addAttribute("countOrders", this.orderService.countOrders());
        model.addAttribute("countProducts", this.productService.countProducts());
        model.addAttribute("totalEarnings", this.orderService.sumEarnings());

        // Data for Pie Chart
        List<Order> allOrders = this.orderService.fetchAllOrders();
        Map<String, Long> orderStatusCounts = allOrders.stream()
                .collect(Collectors.groupingBy(Order::getStatus, Collectors.counting()));

        model.addAttribute("orderStatusCounts", orderStatusCounts);

        // Data for Bar Chart
        int currentYear = Year.now().getValue();
        model.addAttribute("monthlyEarnings", this.orderService.getMonthlyEarnings(currentYear));

        return "admin/dashboard/show";
    }

}
