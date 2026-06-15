package com.me.kycloakdemo.web;

import com.me.kycloakdemo.entiries.Product;
import com.me.kycloakdemo.repository.ProductRepository;
import lombok.AllArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api")
@AllArgsConstructor
public class ProductController {

    private ProductRepository productRepository;

    @GetMapping("/products")
    @PreAuthorize("hasAuthority('USER')")
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @GetMapping("/products/{id}")
    public Product findOne(@PathVariable String id) {
        return productRepository.findById(id).orElse(null);
    }

    @GetMapping("/auth")
    public Authentication getAuthentication(Authentication authentication) {
        return authentication;
    }
}
