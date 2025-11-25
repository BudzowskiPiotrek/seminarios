package com.example.demo.controlador;

import com.example.demo.service.service;
import com.example.demo.modelo.Chiste;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class controlador {

    private service chisteService;

    public controlador(service chisteService) {
        this.chisteService = chisteService;
    }

    @GetMapping("/chisteazar")
    public Chiste chisteAzar() {
        Chiste chisteAzar = chisteService.obtenerChisteAleatorio();        
        return chisteAzar;
    }
    
    @GetMapping("/chistetodos")
    public List <Chiste> chisteTodos() {
        List<Chiste> chistes=chisteService.todos();
        return chistes;
    }

}
