package br.fmu.bioreino;

import android.app.Application;

import java.util.ArrayList;

import br.fmu.bioreino.dao.CursosDAO;
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
                "https://img.freepik.com/vetores-gratis/colecao-de-capas-de-animais-selvagens_23-2148972320.jpg?w=996&t=st=1668200799~exp=1668201399~hmac=8b8a8131c8bc55b94963f218982b8b03ff4d60b18331bdef378a9e646e7ee716"

        ));
        CursosDAO.adicionaCurso(new Curso(
                1,
                "Reinos: Classificações dos seres",
                "Caio Luppo Ribeiro",
                10,
                "schoolar",
                new ArrayList<>(),
                "https://img.freepik.com/vetores-gratis/animais-vintage-vector-fundo-botanico-copia-espaco_53876-110549.jpg?w=996&t=st=1668200801~exp=1668201401~hmac=d1f71162ba0e8afb0a7b10dbf0f28c02d6eadd1a7137efad8e8409726355df77"
        ));
    }
}
