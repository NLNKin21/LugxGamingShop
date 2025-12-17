package com.lugx.gamingHouse.controller.client;

import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.lugx.gamingHouse.domain.Cart;
import com.lugx.gamingHouse.domain.CartDetail;
import com.lugx.gamingHouse.domain.User;
import com.lugx.gamingHouse.services.UserService;
import com.lugx.gamingHouse.services.OrderService;
import com.lugx.gamingHouse.domain.Order;
import com.lugx.gamingHouse.services.ProductService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller("clientOrderController")
public class OrderController {

    private final OrderService orderService;
    private final UserService userService;
    private final ProductService productService;

    public OrderController(OrderService orderService, UserService userService, ProductService productService) {
        this.orderService = orderService;
        this.userService = userService;
        this.productService = productService;
    }

    @PostMapping("/place-order")
    public String placeOrder(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        User user = this.userService.getUserByEmail(email);

        if (user != null) {
            this.orderService.handlePlaceOrder(user, session);
        }

        return "redirect:/thank-you";
    }

    @GetMapping("/checkout")
    public String showCheckoutPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        User curUser = this.userService.getUserByEmail(email);

        Cart cart = this.productService.fetchByUser(curUser);
        List<CartDetail> cartDetails = (cart != null) ? cart.getCartDetails() : new ArrayList<CartDetail>();

        double totalPrice = 0;
        for (CartDetail cd : cartDetails) {
            totalPrice += cd.getPrice();
        }

        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("cart", cart);

        return "client/cart/checkout";
    }

    @GetMapping("/thank-you")
    public String showThankYouPage() {
        return "client/cart/thank-you";
    }

    @GetMapping("/order-history")
    public String getOrderHistoryPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        User curUser = this.userService.getUserByEmail(email);

        if (curUser != null) {
            List<Order> orders = this.orderService.fetchOrderByUser(curUser);
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
            for (Order order : orders) {
                order.setFormattedDate(order.getOrderDate().format(formatter));
            }
            model.addAttribute("orders", orders);
        } else {
            // Handle case where user is not found or not logged in
            model.addAttribute("orders", new ArrayList<Order>());
        }

        return "client/cart/order-history";
    }

    @GetMapping("/order-history/{id}")
    public String getOrderHistoryDetailPage(@PathVariable long id, Model model) {
        Order order = this.orderService.fetchOrderById(id);
        model.addAttribute("order", order);
        return "client/order/detail";
    }
}