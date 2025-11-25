package com.interfaces;

import org.springframework.stereotype.Component;

@Component("saludoFormal")
public class ServicioSaludoFormal implements ServicioSaludo {
    @Override
    public void saludar() {
        System.out.println("Buenos días, señor/señora.");
    }
}
