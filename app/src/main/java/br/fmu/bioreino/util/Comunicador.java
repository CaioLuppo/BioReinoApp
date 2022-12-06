package br.fmu.bioreino.util;

import android.os.Bundle;

import androidx.fragment.app.Fragment;

import br.fmu.bioreino.model.Curso;

public interface Comunicador {

    void enviaCurso(Curso curso);

    void trocaTela(Fragment fragment);

    void trocaTela(Fragment fragment, Bundle bundle);

}
