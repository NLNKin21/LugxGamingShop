package com.lugx.gamingHouse.controller.client;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lugx.gamingHouse.domain.Cart;
import com.lugx.gamingHouse.domain.CartDetail;
import com.lugx.gamingHouse.domain.Product;
import com.lugx.gamingHouse.domain.User;
import com.lugx.gamingHouse.services.UserService;
import com.lugx.gamingHouse.services.ProductService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ItemController {
    private final ProductService productService;
    private final UserService userService;

    public ItemController(ProductService productService, UserService userService) {
        this.productService = productService;
        this.userService = userService;
    }

    @GetMapping("/products")
    public String getProductPage(
            Model model,
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "name", required = false) String name,
            @RequestParam(value = "category", required = false) List<String> category,
            @RequestParam(value = "maxPrice", required = false) Integer maxPrice,
            @RequestParam(value = "sort", required = false) String sort) {

        Pageable pageable;
        if ("asc".equals(sort)) {
            pageable = PageRequest.of(page - 1, 6, Sort.by("price").ascending());
        } else if ("desc".equals(sort)) {
            pageable = PageRequest.of(page - 1, 6, Sort.by("price").descending());
        } else {
            pageable = PageRequest.of(page - 1, 6);
        }

        Page<Product> products = productService.getAllProductsWithSpec(pageable, name, category, maxPrice);
        int totalPages = products.getTotalPages();
        if (totalPages == 0) {
            totalPages = 1;
        }
        model.addAttribute("pro", products.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);

        // Truyền lại các filter để giữ trạng thái
        Map<String, Object> param = new HashMap<>();
        param.put("name", name == null ? "" : name);
        param.put("category", category == null ? new ArrayList<>() : category);
        param.put("maxPrice", maxPrice == null ? 0 : maxPrice);
        param.put("sort", sort == null ? "" : sort);
        model.addAttribute("param", param);

        return "client/product/show";
    }

    @RequestMapping("/product/{id}")
    public String getProductDetailPage(Model model, @PathVariable long id) {
        Product product = productService.getProductById(id);
        List<Product> related = productService.getTrendingProducts(5);

        model.addAttribute("product", product);
        model.addAttribute("relatedProducts", related);

        return "client/product/detail";
    }

    @PostMapping("/add-product-to-cart")
    public String addProductToCart(@RequestParam("productId") long productId, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email"); // Giả sử email được lưu trong session khi đăng nhập
        this.productService.handleAddProductToCart(email, productId, session);
        return "redirect:/products";
    }

    @PostMapping("/delete-cart-product/{id}")
    public String deleteCartProduct(Model model, @PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        this.productService.handleRemoveCartDetail(id, session);
        return "redirect:/cart";
    }

    @GetMapping("/cart")
    public String getCartPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        User curUser = this.userService.getUserByEmail(email);

        Cart cart = this.productService.fetchByUser(curUser);
        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();

        double totalPrice = 0;
        for (CartDetail cd : cartDetails) {
            totalPrice += cd.getPrice();
        }
        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalPrice", totalPrice);

        model.addAttribute("cart", cart);

        return "client/cart/show";
    }

}
