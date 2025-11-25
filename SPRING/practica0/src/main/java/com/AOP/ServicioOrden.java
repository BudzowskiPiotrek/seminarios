package com.AOP;

import org.springframework.stereotype.Service;

@Service
public class ServicioOrden {

    public void procesarOrden(String producto) {
        System.out.println("Procesando orden: " + producto);
    }
}
