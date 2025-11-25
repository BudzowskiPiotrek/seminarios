package com.example.demo.controlador;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.demo.modelo.*;

@Controller
public class controlador {
    
    @GetMapping("/")
    public String inicio(Model model) {
        List<Chiste> chistes = new ArrayList<>();
        chistes.add(new Chiste("¿Qué le dice un 0 a un 8? Bonito cinturón."));
        chistes.add(new Chiste("¿Qué hace una abeja en el gimnasio? ¡Zum-ba!"));
        chistes.add(new Chiste("¿Cuál es el colmo de un electricista? Que su hijo sea un apagado."));
        chistes.add(new Chiste("¿Por qué estás hablando con la pared? ¡Porque la mesa no me responde!"));
        
        Chiste chisteAzar = chistes.get((int)(Math.random() * chistes.size()));
        
        model.addAttribute("chiste", chisteAzar);
        return "index";
    }
}
