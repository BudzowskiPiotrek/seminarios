package com.beans;

import org.springframework.stereotype.Component;

@Component
public class Motor {
    public void encender() {
        System.out.println("El motor está encendido");
    }
}
