package com.beans;

import org.springframework.stereotype.Component;

@Component
public class Coche {

    private Motor motor;

    public Coche(Motor motor) {
        this.motor = motor;
    }

    public void arrancar() {
        motor.encender();
    }
}
