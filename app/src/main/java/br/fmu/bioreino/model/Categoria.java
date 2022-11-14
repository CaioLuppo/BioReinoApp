package br.fmu.bioreino.model;

import android.graphics.Color;

public class Categoria {
    private final String nome;
    private Color corFundo;
    private Color corTexto;

    Categoria(String nome, Color corFundo, Color corTexto) {
        this.nome = nome;
        this.corFundo = corFundo;
        this.corTexto = corTexto;
    }

    public String getNome() {
        return nome;
    }

    public Color getCorFundo() {
        return corFundo;
    }

    public Color getCorTexto() {
        return corTexto;
    }

    public void setCorFundo(Color corFundo) {
        this.corFundo = corFundo;
    }

    public void setCorTexto(Color corTexto) {
        this.corTexto = corTexto;
    }

}
