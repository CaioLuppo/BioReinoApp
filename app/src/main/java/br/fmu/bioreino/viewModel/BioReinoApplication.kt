package br.fmu.bioreino.controller

import android.app.Application
import androidx.core.content.ContextCompat
import br.fmu.bioreino.R
import br.fmu.bioreino.model.dao.CursosDAO
import br.fmu.bioreino.model.entities.Aula
import br.fmu.bioreino.model.entities.Categoria
import br.fmu.bioreino.model.entities.Curso

class BioReinoApplication : Application() {
    override fun onCreate() {
        super.onCreate()
        CursosDAO.adicionaCurso(
            Curso(
                1,
                "forense", "Biologia Forense: Investigando a vida",
                "Caio Luppo Ribeiro",
                "schoolar",
                ArrayList(),
                "https://images.unsplash.com/photo-1532077795300-c4b487f601f6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"
            )
        )
        CursosDAO.adicionaCurso(
            Curso(
                1,
                "animais|e. médio", "Reinos: Classificações dos seres vivos",
                "Pedro H. Sampaio",
                "schoolar",
                ArrayList(),
                "https://img.freepik.com/fotos-gratis/maos-segurando-selvagem-passaros-em-um-jardim-zoologico_53876-63246.jpg?w=996&t=st=1668436057~exp=1668436657~hmac=f39eccc10f9f46588e03d5caa7ff4777cffda9294486af8cad90d11840904729"
            )
        )
        val aulas = ArrayList<Aula>()
        aulas.add(
            Aula("Não mate os bixinhos!", "Saiba a importância dos insetos.")
        )
        aulas.add(
            Aula("Louva-a-deus", "Conheça um dos mestre do kung-fu!")
        )
        aulas.add(
            Aula("Barbeiro", "O que fazer para se proteger.")
        )
        aulas.add(
            Aula("Não mate os bixinhos!", "Saiba a importância dos insetos.")
        )
        aulas.add(
            Aula("Louva-a-deus", "Conheça um dos mestre do kung-fu!")
        )
        aulas.add(
            Aula("Barbeiro", "O que fazer para se proteger.")
        )
        aulas.add(
            Aula("Não mate os bixinhos!", "Saiba a importância dos insetos.")
        )
        aulas.add(
            Aula("Louva-a-deus", "Conheça um dos mestre do kung-fu!")
        )
        aulas.add(
            Aula("Barbeiro", "O que fazer para se proteger.")
        )
        CursosDAO.adicionaCurso(
            Curso(
                1,
                "animais", "Insetos do Brasil",
                "Sophia Moteki",
                "kids",
                aulas,
                "https://conexaoplaneta.com.br/wp-content/uploads/2020/02/descoberta-nova-especie-louva-deus-mata-atlantica-conexao-planeta.jpg"
            )
        )
        CursosDAO.adicionaCategoria(
            Categoria(
                "kids",
                "animais",
                ContextCompat.getColor(this, R.color.azul_esverdeado),
                ContextCompat.getColor(this, R.color.white)
            )
        )
        CursosDAO.adicionaCategoria(
            Categoria(
                "kids",
                "flores",
                ContextCompat.getColor(this, R.color.ciano),
                ContextCompat.getColor(this, R.color.white)
            )
        )
        CursosDAO.adicionaCategoria(
            Categoria(
                "scholar",
                "vestibular",
                ContextCompat.getColor(this, R.color.verde_escuro),
                ContextCompat.getColor(this, R.color.white)
            )
        )
        CursosDAO.adicionaCategoria(
            Categoria(
                "professional",
                "forense",
                ContextCompat.getColor(this, R.color.amarelo),
                ContextCompat.getColor(this, R.color.white)
            )
        )
        CursosDAO.adicionaCategoria(
            Categoria(
                "scholar",
                "E. médio",
                ContextCompat.getColor(this, R.color.laranja_avermelhado),
                ContextCompat.getColor(this, R.color.white)
            )
        )
        CursosDAO.adicionaCategoria(
            Categoria(
                "kids",
                "histórias",
                ContextCompat.getColor(this, R.color.laranja),
                ContextCompat.getColor(this, R.color.white)
            )
        )
    }
}