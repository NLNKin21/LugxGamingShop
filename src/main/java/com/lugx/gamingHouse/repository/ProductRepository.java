package com.lugx.gamingHouse.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.lugx.gamingHouse.domain.Product;

import jakarta.transaction.Transactional;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long>, JpaSpecificationExecutor<Product> {
    Product save(Product laptop);

    Optional<Product> findById(long id);

    void deleteById(long id);

    Product findProductById(long id);

    Page<Product> findAll(Pageable pageable);

    Page<Product> findAll(Specification<Product> spec, Pageable pageable);

    // Trending - Top bán chạy
    @Query("SELECT p FROM Product p ORDER BY p.sold DESC LIMIT :limit")
    List<Product> findTopSold(@Param("limit") int limit);

    // Most Played - Top 6
    @Query("SELECT p FROM Product p ORDER BY p.sold DESC LIMIT 6")
    List<Product> findTop6MostPlayed();

    // New Arrivals
    @Query("SELECT p FROM Product p ORDER BY p.id DESC LIMIT :limit")
    List<Product> findNewArrivals(@Param("limit") int limit);

    // Filter category
    Page<Product> findByCategory(String category, Pageable pageable);

    // Search
    Page<Product> findByNameContainingIgnoreCase(String keyword, Pageable pageable);

    // Filter price
    Page<Product> findByPriceBetween(double minPrice, double maxPrice, Pageable pageable);

    @Transactional
    @Modifying
    @Query("UPDATE Product p SET p.sold = p.sold + ?2 WHERE p.id = ?1")
    void updateSold(long productId, long quantity);
}