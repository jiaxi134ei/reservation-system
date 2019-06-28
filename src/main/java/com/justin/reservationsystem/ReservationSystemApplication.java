package com.justin.reservationsystem;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.justin.reservationsystem.mapper")
public class ReservationSystemApplication {

    public static void main(String[] args) {
        SpringApplication.run(ReservationSystemApplication.class, args);
    }

}
