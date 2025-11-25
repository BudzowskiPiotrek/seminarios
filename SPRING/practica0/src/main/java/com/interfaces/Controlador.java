package com.interfaces;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component
public class Controlador {

    public ServicioSaludo servicioSaludo;

    @Autowired
    public Controlador(@Qualifier("saludoInformal") ServicioSaludo servicioSaludo) {
        this.servicioSaludo = servicioSaludo;
    }

    public void ejecutar() {
        servicioSaludo.saludar();
    }
}
