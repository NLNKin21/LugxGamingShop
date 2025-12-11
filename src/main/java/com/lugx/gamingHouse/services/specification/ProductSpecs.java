package com.lugx.gamingHouse.services.specification;

import java.util.List;

import org.springframework.data.jpa.domain.Specification;

import com.lugx.gamingHouse.domain.Product;

public class ProductSpecs {
    public static Specification<Product> nameLike(String name) {
        return (root, query, cb) -> cb.like(root.get("name"), "%" + name + "%");
    }

    public static Specification<Product> categoryIn(List<String> category) {
        return (root, query, cb) -> root.get("category").in(category);
    }

    public static Specification<Product> priceLessThanOrEqualTo(Integer maxPrice) {
        return (root, query, cb) -> cb.le(root.get("price"), maxPrice);
    }

    // public static Specification<Product> purposeEqual(String purpose) {
    //     return (root, query, cb) -> cb.equal(root.get("target"), purpose);
    // }
}
