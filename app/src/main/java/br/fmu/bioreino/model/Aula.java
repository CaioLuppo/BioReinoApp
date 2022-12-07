package br.fmu.bioreino.model;

public class Aula {

    private final String titulo;
    private final String Subtitulo;
    private boolean aulaVista = false;


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

    public void setAulaVista(boolean aulaVista) {
        this.aulaVista = aulaVista;
    }

    public boolean getAulaFoiVista() {
        return this.aulaVista;
    }

}
