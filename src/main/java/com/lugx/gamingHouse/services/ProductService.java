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
import com.lugx.gamingHouse.services.specification.ProductSpecs;

import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;

@Service
public class ProductService {

    private final ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepositoty cartDetailRepositoty;
    private final UserService userService;
    // private final OrderRepository orderRepository;
    // private final OrderDetailRepository orderDetailRepository;

    public ProductService(ProductRepository productRepository, CartRepository cartRepository,
            CartDetailRepositoty cartDetailRepositoty, UserService userService) {
        this.productRepository = productRepository;
        this.cartRepository = cartRepository;
        this.cartDetailRepositoty = cartDetailRepositoty;
        this.userService = userService;
    }

    // ==================== TRANG CHỦ ====================

    // Trending Products - Lấy top bán chạy nhất (sold cao nhất)
    public List<Product> getTrendingProducts(int limit) {
        return productRepository.findTopSold(limit);
    }

    // Most Played / Top Games - Lấy 6 game hot nhất (có thể theo sold hoặc cố định)
    public List<Product> getMostPlayedProducts() {
        return productRepository.findTop6MostPlayed();
    }

    // Lấy sản phẩm mới nhất (dành cho phần "New Arrival" nếu muốn thêm)
    public List<Product> getNewArrivals(int limit) {
        return productRepository.findNewArrivals(limit);
    }

    // ==================== SHOP & FILTER ====================

    // Lấy tất cả sản phẩm + phân trang
    public Page<Product> getAllProducts(Pageable pageable) {
        return productRepository.findAll(pageable);
    }

    // Tìm theo category (BattleRoyale, MOBA, Account, v.v.)
    public Page<Product> getProductsByCategory(String category, Pageable pageable) {
        return productRepository.findByCategory(category, pageable);
    }

    // Lọc theo khoảng giá (rất cần cho shop Việt Nam)
    public Page<Product> filterByPrice(double minPrice, double maxPrice, Pageable pageable) {
        return productRepository.findByPriceBetween(minPrice, maxPrice, pageable);
    }

    // ==================== CHI TIẾT & CRUD ====================

    public Product getProductById(long id) {
        return productRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Không tìm thấy sản phẩm ID: " + id));
    }

    @Transactional
    public Product handleSaveProduct(Product product) {
        return productRepository.save(product);
    }

    @Transactional
    public void deleteProduct(long id) {
        productRepository.deleteById(id);
    }

    // Lấy tất cả sản phẩm (dùng cho admin hoặc combobox)
    public List<Product> getAllProductsList() {
        return productRepository.findAll();
    }

     public Cart fetchByUser(User user) {
        return this.cartRepository.findByUser(user);
    }

    // Tăng số lượng đã bán khi có đơn hàng thành công (rất quan trọng!)
    @Transactional
    public void increaseSoldCount(long productId, long quantity) {
        Product product = getProductById(productId);
        product.setSold(product.getSold() + quantity);
        productRepository.save(product);
    }

    // Giảm số lượng tồn kho
    @Transactional
    public void decreaseQuantity(long productId, long quantity) {
        Product product = getProductById(productId);
        if (product.getQuantity() < quantity) {
            throw new RuntimeException("Sản phẩm " + product.getName() + " không đủ hàng!");
        }
        product.setQuantity(product.getQuantity() - quantity);
        productRepository.save(product);
    }

    public Page<Product> getAllProductsWithSpec(Pageable pageable, String name, List<String> cate, Integer maxPrice) {

        Specification<Product> spec = Specification.where(null);

        // Lọc theo tên
        if (name != null && !name.trim().isEmpty()) {
            spec = spec.and(ProductSpecs.nameLike(name.trim()));
        }

        // Lọc theo category
        if (cate != null && !cate.isEmpty()) {
            spec = spec.and(ProductSpecs.categoryIn(cate));
        }

        // điều kiện maxPrice > 0
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

            // tim productByID
            Optional<Product> producOptional = this.productRepository.findById(productId);
            if (producOptional.isPresent()) {
                Product realProduct = producOptional.get();

                CartDetail oldDetail = this.cartDetailRepositoty.findByCartAndProduct(cart, realProduct);

                if (oldDetail == null) {
                    CartDetail cd = new CartDetail();
                    cd.setCart(cart);
                    cd.setProduct(realProduct);
                    cd.setPrice(realProduct.getPrice());
                    cd.setQuantity(1);
                    this.cartDetailRepositoty.save(cd);

                    // update cart
                    int s = cart.getSum() + 1;
                    cart.setSum(s);
                    this.cartRepository.save(cart);
                    session.setAttribute("sum", s);
                } else {
                    oldDetail.setQuantity(oldDetail.getQuantity() + 1);
                    this.cartDetailRepositoty.save(oldDetail);
                }

            }

        }
    }
}