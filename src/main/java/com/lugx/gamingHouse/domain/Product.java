package com.lugx.gamingHouse.domain;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "products")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private Double price;

    private String image;

    // Chỉ dùng đúng 1 cột detail_desc (MEDIUMTEXT)
    @Column(name = "detail_desc", columnDefinition = "MEDIUMTEXT")
    private String detailDesc;

    // Chỉ dùng đúng 1 cột short_desc
    @Column(name = "short_desc")
    private String shortDesc;

    @Column(nullable = false)
    private Long quantity;

    @Column(nullable = false)
    private Long sold = 0L;

    @Column(nullable = false)
    private String category; // BattleRoyale, MOBA, FPS, RPG, Sports, Adventure, Account...


    // ==================== RELATIONSHIPS ====================

    // 1 Product có thể nằm trong nhiều CartDetail
    @OneToMany(mappedBy = "product")
    private List<CartDetail> cartDetails;

    // 1 Product có thể nằm trong nhiều OrderDetail
    @OneToMany(mappedBy = "product")
    private List<OrderDetail> orderDetails;

    // ==================== GETTERS & SETTERS ====================

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDetailDesc() {
        return detailDesc;
    }

    public void setDetailDesc(String detailDesc) {
        this.detailDesc = detailDesc;
    }

    public String getShortDesc() {
        return shortDesc;
    }

    public void setShortDesc(String shortDesc) {
        this.shortDesc = shortDesc;
    }

    public long getQuantity() {
        return quantity;
    }

    public void setQuantity(long quantity) {
        this.quantity = quantity;
    }

    public long getSold() {
        return sold;
    }

    public void setSold(long sold) {
        this.sold = sold;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public List<CartDetail> getCartDetails() {
        return cartDetails;
    }

    public void setCartDetails(List<CartDetail> cartDetails) {
        this.cartDetails = cartDetails;
    }

    public List<OrderDetail> getOrderDetails() {
        return orderDetails;
    }

    public void setOrderDetails(List<OrderDetail> orderDetails) {
        this.orderDetails = orderDetails;
    }

    @Override
    public String toString() {
        return "Product [id=" + id + ", name=" + name + ", price=" + price + ", image=" + image + ", detailDesc="
                + detailDesc + ", shortDesc=" + shortDesc + ", quantity=" + quantity + ", sold=" + sold + ", category="
                + category + ", cartDetails=" + cartDetails + ", orderDetails=" + orderDetails + "]";
    }

    
}