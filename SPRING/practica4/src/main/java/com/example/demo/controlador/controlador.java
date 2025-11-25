package com.example.demo.controlador;

import com.example.demo.service.service;
import com.example.demo.modelo.Chiste;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class controlador {

    private final service chisteService;

    public controlador(service chisteService) {
        this.chisteService = chisteService;
    }

    @GetMapping("/")
    public String inicio(Model model) {
        Chiste chisteAzar = chisteService.obtenerChisteAleatorio();
        model.addAttribute("chiste", chisteAzar);
        return "index";
    }

}
