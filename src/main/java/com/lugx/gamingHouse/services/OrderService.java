package com.lugx.gamingHouse.services;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.time.LocalDateTime;
import java.util.stream.IntStream;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.lugx.gamingHouse.domain.Cart;
import com.lugx.gamingHouse.domain.CartDetail;
import com.lugx.gamingHouse.domain.Order;
import com.lugx.gamingHouse.domain.OrderDetail;
import com.lugx.gamingHouse.domain.Product;
import com.lugx.gamingHouse.domain.User;
import com.lugx.gamingHouse.repository.CartDetailRepositoty;
import com.lugx.gamingHouse.repository.CartRepository;
import com.lugx.gamingHouse.repository.OrderDetailRepository;
import com.lugx.gamingHouse.repository.OrderRepository;
import com.lugx.gamingHouse.repository.ProductRepository;
import com.lugx.gamingHouse.repository.UserRepository;

import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;

@Service
public class OrderService {

    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepositoty cartDetailRepository;
    private final ProductRepository productRepository;
    private final UserRepository userRepository;

    public OrderService(OrderRepository orderRepository, OrderDetailRepository orderDetailRepository,
            CartRepository cartRepository, CartDetailRepositoty cartDetailRepository,
            ProductRepository productRepository, UserRepository userRepository) {
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.productRepository = productRepository;
        this.userRepository = userRepository;
    }

    @Transactional
    public Order handlePlaceOrder(User user, HttpSession session) {
        // ✅ Fetch lại user từ DB để đảm bảo managed entity
        User managedUser = this.userRepository.findById(user.getId());
        if (managedUser == null) {
            return null;
        }

        Cart cart = this.cartRepository.findByUser(managedUser);

        if (cart == null || cart.getCartDetails() == null || cart.getCartDetails().isEmpty()) {
            return null;
        }

        List<CartDetail> cartDetails = cart.getCartDetails();

        // Tính tổng giá
        double totalPrice = 0;
        for (CartDetail cd : cartDetails) {
            totalPrice += cd.getPrice() * cd.getQuantity();
        }

        // ✅ LƯU THÔNG TIN TRƯỚC KHI XÓA
        List<OrderDetailTemp> tempList = new ArrayList<>();
        for (CartDetail cd : cartDetails) {
            OrderDetailTemp temp = new OrderDetailTemp();
            temp.productId = cd.getProduct().getId();
            temp.price = cd.getPrice();
            temp.quantity = cd.getQuantity();
            tempList.add(temp);
        }

        // ✅ BƯỚC 1: Ngắt kết nối User - Cart
        managedUser.setCart(null);
        this.userRepository.save(managedUser);

        // ✅ BƯỚC 2: Xóa Cart (cascade sẽ xóa CartDetails)
        this.cartRepository.delete(cart);
        this.cartRepository.flush();

        // ✅ BƯỚC 3: Tạo Order mới
        Order order = new Order();
        order.setUser(managedUser);
        order.setOrderDate(LocalDateTime.now());
        order.setStatus("PENDING");
        order.setTotalPrice(totalPrice);
        order = this.orderRepository.save(order);

        // ✅ BƯỚC 4: Tạo OrderDetails
        for (OrderDetailTemp temp : tempList) {
            Product product = this.productRepository.findById(temp.productId).orElse(null);
            if (product != null) {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setOrder(order);
                orderDetail.setProduct(product);
                orderDetail.setPrice(temp.price);
                orderDetail.setQuantity(temp.quantity);
                this.orderDetailRepository.save(orderDetail);
                order.getOrderDetails().add(orderDetail); // Thêm OrderDetail vào danh sách của Order
            }
        }

        // Cập nhật session
        session.setAttribute("sum", 0);

        return order;
    }

    // ✅ Inner class lưu thông tin tạm
    private static class OrderDetailTemp {
        Long productId;
        double price;
        long quantity;
    }

    public Page<Order> fetchAllOrders(Pageable pageable) {
        return this.orderRepository.findAll(pageable);
    }

    public Order fetchOrderById(long id) {
        return this.orderRepository.findById(id).orElse(null);
    }

    public List<Order> fetchOrderByUser(User user) {
        return this.orderRepository.findByUser(user);
    }

    public void updateOrder(Order order) {
        Order existingOrder = this.orderRepository.findById(order.getId()).orElse(null);
        if (existingOrder != null) {
            existingOrder.setStatus(order.getStatus());
            this.orderRepository.save(existingOrder);
        }
    }

    public void deleteOrderById(long id) {
        this.orderRepository.deleteById(id);
    }

    public long countOrders() {
        return this.orderRepository.count();
    }

    public double sumEarnings() {
        return this.orderRepository.sumTotalPriceByStatus("COMPLETE");
    }

    public List<Order> fetchAllOrders() {
        return this.orderRepository.findAll();
    }

    // public double sumAllOrders() {
    // return this.orderRepository.sumAllTotalPrice();
    // }

    public Map<Integer, Double> getMonthlyEarnings(int year) {
        List<Object[]> results = this.orderRepository.findMonthlyEarnings(year);

        // Initialize a map with all 12 months set to 0.0, using LinkedHashMap to
        // preserve order
        Map<Integer, Double> monthlyEarnings = new LinkedHashMap<>();
        IntStream.rangeClosed(1, 12).forEach(month -> monthlyEarnings.put(month, 0.0));

        // Populate the map with actual earnings from the query results
        for (Object[] result : results) {
            Integer month = (Integer) result[0];
            Double total = (Double) result[1];
            monthlyEarnings.put(month, total);
        }
        return monthlyEarnings;
    }
}
