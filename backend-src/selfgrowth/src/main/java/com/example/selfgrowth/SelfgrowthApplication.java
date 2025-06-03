package com.example.selfgrowth;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.example.selfgrowth.mapper") // これが必要！
public class SelfgrowthApplication {
    public static void main(String[] args) {
        SpringApplication.run(SelfgrowthApplication.class, args);
    }
}
