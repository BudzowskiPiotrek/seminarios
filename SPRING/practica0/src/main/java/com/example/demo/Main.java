package com.example.demo;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.AOP.*;
import com.interfaces.Controlador;


public class Main {
    public static void main(String[] args) {
        ApplicationContext context =
            new AnnotationConfigApplicationContext(AppConfig.class);

//        Coche coche = context.getBean(Coche.class);
//        coche.arrancar();
        Controlador controlador = context.getBean(Controlador.class);
        controlador.ejecutar();
        ServicioOrden ser = context.getBean(ServicioOrden.class);
        ser.procesarOrden("Ordenador");
    }
}

