package br.fmu.bioreino.controller.util;

import android.os.Bundle;
import android.widget.Toolbar;

import androidx.fragment.app.Fragment;

import br.fmu.bioreino.model.entities.Curso;

public interface Comunicador {

    void enviaCurso(Curso curso);

    void enviaCategoria(String categoria);

    void trocaTela(Fragment fragment);

    void trocaTela(Fragment fragment, Bundle bundle);

    void trocaAppBar(Toolbar toolbar);

    void configuraBotaoVoltarSistema(Fragment fragmentAtual);

}
