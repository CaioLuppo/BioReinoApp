package br.fmu.bioreino.model.entities;

public class Categoria {
    private final String plano;
    private final String nome;
    private final int corFundo;
    private final int corTexto;

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

    public String getPlano() {
        return plano;
    }
}
