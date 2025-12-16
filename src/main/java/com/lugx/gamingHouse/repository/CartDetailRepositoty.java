package com.lugx.gamingHouse.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.lugx.gamingHouse.domain.Cart;
import com.lugx.gamingHouse.domain.CartDetail;
import com.lugx.gamingHouse.domain.Product;

public interface CartDetailRepositoty extends JpaRepository<CartDetail, Long> {
    boolean existsByCartAndProduct(Cart cart,Product product);
    CartDetail findByCartAndProduct(Cart cart,Product product);
    void deleteAllByCart(Cart cart);
}
