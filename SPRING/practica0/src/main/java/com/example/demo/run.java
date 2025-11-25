package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import com.AOP.ServicioOrden;

@SpringBootApplication(scanBasePackages = {"com.AOP", "com.beans", "com.interfaces"})
public class run {
    public static void main(String[] args) {
        ApplicationContext context = SpringApplication.run(run.class, args);

        ServicioOrden ser = context.getBean(ServicioOrden.class);
        ser.procesarOrden("Ordenador");
    }
}
