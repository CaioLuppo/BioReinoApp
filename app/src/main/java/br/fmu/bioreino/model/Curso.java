package br.fmu.bioreino.model;

import java.util.ArrayList;

/// Modelo de curso
public class Curso {

    // Identificador
    private final int id;

    // Constantes para o card
    private final String titulo;
    private final String professor;

    // Variáveis de progresso
    private final int etapas;
    private double etapaAtual = 10;

    // Aulas do curso
    private final String plano;
    private final ArrayList<Aula> aulas;

    public Curso(int id, String titulo, String professor, int etapas, String plano, ArrayList<Aula> aulas) {
        this.id = id;
        this.titulo = titulo;
        this.professor = professor;
        this.etapas = etapas;
        this.plano = plano;
        this.aulas = aulas;
    }

    public int getId() {
        return id;
    }

    public String getTitulo() {
        return titulo;
    }

    public String getProfessor() {
        return professor;
    }

    public int getProgresso() {
        return (int) Math.round((this.etapaAtual/this.etapas) * 100);
    }

    public ArrayList<Aula> getAulas() {
        return aulas;
    }

    public String getPlano() {
        return plano;
    }

    public void setEtapaAtual(int etapaAtual) {
        this.etapaAtual = etapaAtual;
    }

}
