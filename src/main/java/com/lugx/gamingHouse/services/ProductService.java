package com.lugx.gamingHouse.services;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.lugx.gamingHouse.domain.Cart;
import com.lugx.gamingHouse.domain.CartDetail;
import com.lugx.gamingHouse.domain.Product;
import com.lugx.gamingHouse.domain.User;
import com.lugx.gamingHouse.repository.CartDetailRepositoty;
import com.lugx.gamingHouse.repository.CartRepository;
import com.lugx.gamingHouse.repository.ProductRepository;
import com.lugx.gamingHouse.repository.UserRepository;
import com.lugx.gamingHouse.services.specification.ProductSpecs;

import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;

@Service
public class ProductService {

    private final ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepositoty cartDetailRepositoty;
    private final UserService userService;
    private final UserRepository userRepository;
    // private final OrderRepository orderRepository;
    // private final OrderDetailRepository orderDetailRepository;

    public ProductService(ProductRepository productRepository, CartRepository cartRepository,
            CartDetailRepositoty cartDetailRepositoty, UserService userService, UserRepository userRepository) {
        this.productRepository = productRepository;
        this.cartRepository = cartRepository;
        this.cartDetailRepositoty = cartDetailRepositoty;
        this.userService = userService;
        this.userRepository = userRepository;
    }

    // ==================== HOME PAGE ====================

    // Trending Products - Get top bestsellers (highest sold count)
    public List<Product> getTrendingProducts(int limit) {
        return productRepository.findTopSold(limit);
    }

    // Most Played / Top Games - Get 6 hottest games (can be by sold count or fixed)
    public List<Product> getMostPlayedProducts() {
        return productRepository.findTop6MostPlayed();
    }

    // Get latest products (for a "New Arrival" section if desired)
    public List<Product> getNewArrivals(int limit) {
        return productRepository.findNewArrivals(limit);
    }

    // ==================== SHOP & FILTER ====================

    // Get all products + pagination
    public Page<Product> getAllProducts(Pageable pageable) {
        return productRepository.findAll(pageable);
    }

    // Find by category (BattleRoyale, MOBA, Account, etc.)
    public Page<Product> getProductsByCategory(String category, Pageable pageable) {
        return productRepository.findByCategory(category, pageable);
    }

    // Filter by price range
    public Page<Product> filterByPrice(double minPrice, double maxPrice, Pageable pageable) {
        return productRepository.findByPriceBetween(minPrice, maxPrice, pageable);
    }

    // ==================== DETAIL & CRUD ====================

    public Product getProductById(long id) {
        return productRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Product not found with ID: " + id));
    }

    @Transactional
    public Product handleSaveProduct(Product product) {
        return productRepository.save(product);
    }

    @Transactional
    public void deleteProduct(long id) {
        productRepository.deleteById(id);
    }

    // Get all products (for admin or combobox)
    public List<Product> getAllProductsList() {
        return productRepository.findAll();
    }

    public Cart fetchByUser(User user) {
        return this.cartRepository.findByUser(user);
    }

    // Increase sold count on successful order (very important!)
    @Transactional
    public void increaseSoldCount(long productId, long quantity) {
        Product product = getProductById(productId);
        product.setSold(product.getSold() + quantity);
        productRepository.save(product);
    }

    public Page<Product> getAllProductsWithSpec(Pageable pageable, String name, List<String> cate, Integer maxPrice) {

        Specification<Product> spec = Specification.where(null);

        // Filter by name
        if (name != null && !name.trim().isEmpty()) {
            spec = spec.and(ProductSpecs.nameLike(name.trim()));
        }

        // Filter by category
        if (cate != null && !cate.isEmpty()) {
            spec = spec.and(ProductSpecs.categoryIn(cate));
        }

        // condition maxPrice > 0
        if (maxPrice != null && maxPrice > 0) {
            spec = spec.and(ProductSpecs.priceLessThanOrEqualTo(maxPrice));
        }

        return productRepository.findAll(spec, pageable);
    }

    public void handleAddProductToCart(String email, long productId, HttpSession session) {
        User user = this.userService.getUserByEmail(email);
        if (user != null) {
            Cart cart = this.cartRepository.findByUser(user);
            if (cart == null) {
                Cart otherCart = new Cart();
                otherCart.setUser(user);
                otherCart.setSum(0);

                cart = this.cartRepository.save(otherCart);
            }
            // save cart_detail

            // find productByID
            Optional<Product> producOptional = this.productRepository.findById(productId);
            if (producOptional.isPresent()) {
                Product realProduct = producOptional.get();

                CartDetail oldDetail = this.cartDetailRepositoty.findByCartAndProduct(cart, realProduct);

                if (oldDetail == null) {
                    CartDetail cd = new CartDetail();
                    cd.setCart(cart);
                    cd.setProduct(realProduct);
                    // Calculate discounted price
                    double finalPrice = realProduct.getPrice();
                    if (realProduct.getDiscount() > 0) {
                        finalPrice = realProduct.getPrice() * (1 - realProduct.getDiscount() / 100.0);
                    }
                    cd.setPrice(finalPrice);
                    cd.setQuantity(1);
                    this.cartDetailRepositoty.save(cd);

                    // update cart
                    int s = cart.getSum() + 1;
                    cart.setSum(s);
                    this.cartRepository.save(cart);
                    session.setAttribute("sum", s);
                } // If product is already in cart, do nothing.

            }

        }
    }

    @Transactional
    public void handleRemoveCartDetail(long cartDetailId, HttpSession session) {
        Optional<CartDetail> cartDetailOptional = this.cartDetailRepositoty.findById(cartDetailId);
        if (cartDetailOptional.isPresent()) {
            CartDetail cartDetail = cartDetailOptional.get();
            Cart cart = cartDetail.getCart();

            // Update sum
            int newSum = cart.getSum() - 1;
            cart.setSum(newSum);
            session.setAttribute("sum", newSum);

            // Remove CartDetail from Cart's list.
            // Due to orphanRemoval=true, Hibernate will automatically delete CartDetail
            // from DB.
            cart.getCartDetails().remove(cartDetail);
        }
    }

    public long countProducts() {
        return this.userRepository.count();
    }

    public void updateSold(long productId, long quantity) {
        this.productRepository.updateSold(productId, quantity);
    }

}