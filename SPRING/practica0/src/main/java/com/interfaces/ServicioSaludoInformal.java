package com.interfaces;

import org.springframework.stereotype.Component;

@Component("saludoInformal")
public class ServicioSaludoInformal implements ServicioSaludo {
    @Override
    public void saludar() {
        System.out.println("¡Hola, qué tal!");
    }
}
