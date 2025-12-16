package com.lugx.gamingHouse.controller.admin;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lugx.gamingHouse.domain.Order;
import com.lugx.gamingHouse.services.OrderService;

@Controller("adminOrderController")
@RequestMapping("/admin/order")
public class OrderController {

    private final OrderService orderService;

    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @GetMapping
    public String getOrderPage(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {
        Pageable pageable = PageRequest.of(page - 1, 5);
        Page<Order> orderPage = this.orderService.fetchAllOrders(pageable);
        List<Order> orders = orderPage.getContent();

        model.addAttribute("orders", orders);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", orderPage.getTotalPages());

        return "admin/order/show";
    }

    @GetMapping("/{id}")
    public String getOrderDetailPage(@PathVariable long id, Model model) {
        Order order = this.orderService.fetchOrderById(id);
        model.addAttribute("order", order);
        return "admin/order/detail";
    }

    @GetMapping("/update/{id}")
    public String getUpdateOrderPage(@PathVariable long id, Model model) {
        Order order = this.orderService.fetchOrderById(id);
        model.addAttribute("order", order);
        return "admin/order/update";
    }

    @PostMapping("/update")
    public String handleUpdateOrder(@ModelAttribute("order") Order order) {
        this.orderService.updateOrder(order);
        return "redirect:/admin/order";
    }

    @GetMapping("/delete/{id}")
    public String getDeleteOrderPage(@PathVariable long id, Model model) {
        Order order = this.orderService.fetchOrderById(id);
        model.addAttribute("order", order);
        return "admin/order/delete";
    }

    @PostMapping("/delete")
    public String handleDeleteOrder(@RequestParam("id") long id) {
        this.orderService.deleteOrderById(id);
        return "redirect:/admin/order";
    }
}