package com.AOP;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class LoggingAspect {

    @Before("execution(* com.AOP.ServicioOrden.procesarOrden(..))")
    public void logAntesDeProcesar() {
        System.out.println("LOG: Antes de procesar la orden");
    }
}
