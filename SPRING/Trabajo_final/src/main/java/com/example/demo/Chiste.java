package com.example.demo;

public class Chiste {
	private int id;
	private String texto;
	private String autor;

	public Chiste(int id, String texto, String autor) {
		this.id = id;
		this.texto = texto;
		this.autor = autor;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTexto() {
		return texto;
	}

	public void setTexto(String texto) {
		this.texto = texto;
	}

	public String getAutor() {
		return autor;
	}

	public void setAutor(String autor) {
		this.autor = autor;
	}

}