package br.fmu.bioreino.model;

public class Aula {

    private final String titulo;
    private final String Subtitulo;


    public Aula(String titulo, String subtitulo) {
        this.titulo = titulo;
        Subtitulo = subtitulo;
    }

    public String getTitulo() {
        return titulo;
    }

    public String getSubtitulo() {
        return Subtitulo;
    }

}
