package com.lugx.gamingHouse.services;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.lugx.gamingHouse.domain.Product;
import com.lugx.gamingHouse.repository.ProductRepository;

@Service
public class ProductService {
    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository){
        this.productRepository = productRepository;
    }

    public Page<Product> getAllProducts(Pageable pageable) {
        return this.productRepository.findAll(pageable);
    }

    public Product handleSaveProduct(Product product) {
        return this.productRepository.save(product);
    }

    public Product getProductById(long id) {
        return this.productRepository.findProductById(id);
    }

    public void deleteAProduct(long id) {
        this.productRepository.deleteById(id);
    }

    public List<Product> fetchProducts() {
        return this.productRepository.findAll();
    }

}
