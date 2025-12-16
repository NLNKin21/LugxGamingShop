package com.lugx.gamingHouse.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "cart_details")
public class CartDetail {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private long quantity;

    private double price; // Giá tại thời điểm thêm vào giỏ

    // ==================== RELATIONSHIPS ====================

    // Nhiều CartDetail thuộc 1 Cart (Many-to-One)
    @ManyToOne
    @JoinColumn(name = "cart_id")
    private Cart cart;

    // Nhiều CartDetail liên kết 1 Product (Many-to-One)
    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;

    // ==================== GETTERS & SETTERS ====================

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getQuantity() {
        return quantity;
    }

    public void setQuantity(long quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    @Override
    public String toString() {
        return "CartDetail [id=" + id + ", quantity=" + quantity + ", price=" + price + "]";
    }
}