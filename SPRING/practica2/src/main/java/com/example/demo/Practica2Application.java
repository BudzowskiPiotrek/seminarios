package com.example.demo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@SpringBootApplication
public class Practica2Application {

    public static void main(String[] args) {
        SpringApplication.run(Practica2Application.class, args);
    }

    @GetMapping("/")
    public String inicio(Model model) {
        List<String> chistes=new ArrayList<>();
        chistes.add("¿Qué le dice un 0 a un 8? Bonito cinturón.");
        chistes.add("¿Qué hace una abeja en el gimnasio? ¡Zum-ba!");
        chistes.add("¿Cuál es el colmo de un electricista? Que su hijo sea un apagado.");
        chistes.add("¿Por qué estás hablando con la pared? ¡Porque la mesa no me responde!");
        
        String chisteAzar = chistes.get((int)(Math.random()*chistes.size()));
        
        model.addAttribute("chiste", chisteAzar);
        return "index";
    }
}