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
                new ArrayList<>()
        ));
        CursosDAO.adicionaCurso(new Curso(
                1,
                "Reinos: Classificações dos seres",
                "Caio Luppo Ribeiro",
                10,
                "schoolar",
                new ArrayList<>()
        ));
    }
}
