package com.me.kycloakdemo.repository;

import com.me.kycloakdemo.entiries.Product;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductRepository extends JpaRepository<Product, String> {
}
