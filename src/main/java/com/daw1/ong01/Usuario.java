package com.daw1.ong01;

import java.util.ArrayList;

public class Usuario {
    private String nombre;
    private String contrasena;
    private String foto;
    private ArrayList<String> skills = new ArrayList<>();
    boolean esContribuidor = true;
    private ArrayList<String> ayudasRecibidas = new ArrayList<>();
    private ArrayList<String> ayudasProporcionadas = new ArrayList<>();

    public Usuario(String nombre, String contrasena, String email, String foto) {
        this.nombre = nombre;
        this.contrasena = contrasena;
        this.foto = foto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto() {
        this.foto = foto;
    }

    public void addSkill(String skill) {
        skills.add(skill);
    }

    public ArrayList<String> getSkills() {
        return skills;
    }

    public void setSkills(ArrayList<String> skills) {
        this.skills = skills;
    }

    public void removeSkill(String skill) {
        skills.remove(skill);
    }
    public void addReceivedHelp(String help) {
        ayudasRecibidas.add(help);
    }
    public ArrayList<String> getAyudasRecibidas() {
        return ayudasRecibidas;
    }

    public void setAyudasRecibidas(ArrayList<String> ayudasRecibidas) {
        this.ayudasRecibidas = ayudasRecibidas;
    }
    public void addProvidedHelp(String help) {
        ayudasProporcionadas.add(help);
    }
    public void setAyudasProporcionadas(ArrayList<String> ayudasProporcionadas) {
        this.ayudasProporcionadas = ayudasProporcionadas;
    }
}

