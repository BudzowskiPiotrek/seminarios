package com.example.demo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@SpringBootApplication
public class Practica2Application {

	private List<Chiste> lista = new ArrayList<>();

	public static void main(String[] args) {
		SpringApplication.run(Practica2Application.class, args);
	}

	public Practica2Application() {
		lista.add(new Chiste(1, "¿Qué le dice un 0 a un 8? Bonito cinturón.", "Juan"));
		lista.add(new Chiste(2, "¿Qué hace una abeja en el gimnasio? ¡Zum-ba!", "Marcos"));
		lista.add(new Chiste(3, "¿Cuál es el colmo de un electricista? Que su hijo sea un apagado.", "Luis"));
		lista.add(new Chiste(4, "¿Por qué estás hablando con la pared? ¡Porque la mesa no me responde!", "Anonimo"));
	}

	@GetMapping("/")
	public String inicio(Model model) {
		model.addAttribute("lista", lista);
		return "index";
	}

	@PostMapping("/agregar")
	public String agregar(
			@RequestParam int id,
			@RequestParam String texto,
			@RequestParam String autor) {

		lista.add(new Chiste(id, texto, autor));
		return "redirect:/";
	}

	@GetMapping("/eliminar/{id}")
	public String eliminar(@PathVariable int id) {
		lista.removeIf(c -> c.getId() == id);
		return "redirect:/";
	}
}
