package br.fmu.bioreino.model;

import android.widget.ImageView;

import com.squareup.picasso.Picasso;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Locale;

/// Modelo de curso
public class Curso implements Serializable {

    // Identificador
    private final int id;
    private final String categoria;

    // Constantes para o card
    private final String titulo;
    private final String professor;
    private final String linkImagem;

    // Variáveis de progresso
    private final int etapas;
    private double etapaAtual = 0;

    // Aulas do curso
    private final String plano;
    private final ArrayList<Aula> aulas;
    private Aula ultimaAula;

    public Curso(int id, String categoria, String titulo, String professor, String plano, ArrayList<Aula> aulas, String linkImagem) {
        this.id = id;
        this.categoria = categoria.toLowerCase(Locale.ROOT);
        this.titulo = titulo;
        this.professor = professor;
        this.etapas = aulas.size();
        this.plano = plano;
        this.aulas = aulas;
        this.ultimaAula = (aulas.size() > 0) ? aulas.get(0) : null;
        this.linkImagem = linkImagem;
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

    public String getCategoria() {
        return categoria;
    }

    public void adicionaProgresso() {
        if (this.etapaAtual <= this.etapas) this.etapaAtual++;
    }

    public void setImagem(ImageView target) {
        Picasso.get().load(linkImagem).into(target);
    }

    public Aula getUltimaAula() {
        return ultimaAula;
    }

    public void setUltimaAula(Aula ultimaAula) {
        this.ultimaAula = ultimaAula;
    }
}
