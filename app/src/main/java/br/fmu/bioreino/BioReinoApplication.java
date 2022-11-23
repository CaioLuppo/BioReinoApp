package br.fmu.bioreino;

import android.app.Application;

import androidx.core.content.ContextCompat;

import java.util.ArrayList;

import br.fmu.bioreino.adapter.ListaCategoriasAdapter;
import br.fmu.bioreino.dao.CursosDAO;
import br.fmu.bioreino.model.Categoria;
import br.fmu.bioreino.model.Curso;

public class BioReinoApplication extends Application {

    @Override
    public void onCreate() {
        super.onCreate();

        CursosDAO.adicionaCurso(new Curso(
                1,
                "Biologia Forense: Investigando a vida",
                "Caio Luppo Ribeiro",
                10,
                "schoolar",
                new ArrayList<>(),
                "https://images.unsplash.com/photo-1532077795300-c4b487f601f6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"

        ));
        CursosDAO.adicionaCurso(new Curso(
                1,
                "Reinos: Classificações dos seres",
                "Pedro H. Sampaio",
                10,
                "schoolar",
                new ArrayList<>(),
                "https://img.freepik.com/fotos-gratis/maos-segurando-selvagem-passaros-em-um-jardim-zoologico_53876-63246.jpg?w=996&t=st=1668436057~exp=1668436657~hmac=f39eccc10f9f46588e03d5caa7ff4777cffda9294486af8cad90d11840904729"
        ));
        CursosDAO.adicionaCurso(new Curso(
                1,
                "Insetos do Brasil",
                "Sophia Moteki",
                10,
                "kids",
                new ArrayList<>(),
                "https://conexaoplaneta.com.br/wp-content/uploads/2020/02/descoberta-nova-especie-louva-deus-mata-atlantica-conexao-planeta.jpg"
        ));

        ListaCategoriasAdapter.categorias.add(new Categoria("kids", "animais", ContextCompat.getColor(this, R.color.azul_esverdeado), ContextCompat.getColor(this, R.color.white)));
        ListaCategoriasAdapter.categorias.add(new Categoria("kids", "flores", ContextCompat.getColor(this, R.color.ciano), ContextCompat.getColor(this, R.color.white)));
        ListaCategoriasAdapter.categorias.add(new Categoria("scholar", "vestibular", ContextCompat.getColor(this, R.color.verde_escuro), ContextCompat.getColor(this, R.color.white)));
        ListaCategoriasAdapter.categorias.add(new Categoria("professional", "forense", ContextCompat.getColor(this, R.color.amarelo), ContextCompat.getColor(this, R.color.white)));
        ListaCategoriasAdapter.categorias.add(new Categoria("scholar", "E. médio", ContextCompat.getColor(this, R.color.laranja_avermelhado), ContextCompat.getColor(this, R.color.white)));
        ListaCategoriasAdapter.categorias.add(new Categoria("kids", "histórias", ContextCompat.getColor(this, R.color.laranja), ContextCompat.getColor(this, R.color.white)));

    }
}
