package br.fmu.bioreino.model;

import android.graphics.Color;

public class Categoria {
    private final String plano;
    private final String nome;
    private int corFundo;
    private int corTexto;

    public Categoria(String plano, String nome, int corFundo, int corTexto) {
        this.plano = plano;
        this.nome = nome;
        this.corFundo = corFundo;
        this.corTexto = corTexto;
    }

    public String getNome() {
        return nome;
    }

    public int getCorFundo() {
        return corFundo;
    }

    public int getCorTexto() {
        return corTexto;
    }

    public void setCorFundo(int corFundo) {
        this.corFundo = corFundo;
    }

    public void setCorTexto(int corTexto) {
        this.corTexto = corTexto;
    }

    public String getPlano() {
        return plano;
    }
}
