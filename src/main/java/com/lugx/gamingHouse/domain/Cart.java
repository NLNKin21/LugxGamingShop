package com.lugx.gamingHouse.domain;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "carts")
public class Cart {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private int sum; // Tổng số lượng sản phẩm trong giỏ

    // ==================== RELATIONSHIPS ====================

    // 1 Cart thuộc 1 User (One-to-One)
    @OneToOne
    @JoinColumn(name = "user_id")
    private User user;

    // 1 Cart có nhiều CartDetail (One-to-Many)
    @OneToMany(mappedBy = "cart")
    private List<CartDetail> cartDetails;

    // ==================== GETTERS & SETTERS ====================

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public int getSum() {
        return sum;
    }

    public void setSum(int sum) {
        this.sum = sum;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<CartDetail> getCartDetails() {
        return cartDetails;
    }

    public void setCartDetails(List<CartDetail> cartDetails) {
        this.cartDetails = cartDetails;
    }

    @Override
    public String toString() {
        return "Cart [id=" + id + ", sum=" + sum + "]";
    }
}