package com.lugx.gamingHouse.services;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.lugx.gamingHouse.domain.Product;
import com.lugx.gamingHouse.repository.ProductRepository;

import jakarta.transaction.Transactional;

@Service
public class ProductService {

    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
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
}