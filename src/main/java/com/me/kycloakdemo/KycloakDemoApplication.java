package com.me.kycloakdemo;

import com.me.kycloakdemo.entiries.Product;
import com.me.kycloakdemo.repository.ProductRepository;
import org.apache.catalina.core.ApplicationContext;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import java.util.UUID;

@SpringBootApplication
public class KycloakDemoApplication {

    public static void main(String[] args) {
        SpringApplication.run(KycloakDemoApplication.class, args);
    }


    @Bean
    CommandLineRunner commandLineRunner(ProductRepository productRepository) {
        return args -> {
            Product product =Product.builder().id(UUID.randomUUID().toString()).name("PC").price(12000).quantity(2).build();
            productRepository.save(product);
            Product product1 =Product.builder().id(UUID.randomUUID().toString()).name("TV").price(14200).quantity(4).build();
            productRepository.save(product1);
            Product product2 =Product.builder().id(UUID.randomUUID().toString()).name("AIRFiRE").price(16700).quantity(6).build();
            productRepository.save(product2);
        };
    }
}
