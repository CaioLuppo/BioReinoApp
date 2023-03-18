package br.fmu.bioreino.controller.util

import android.os.Bundle
import android.widget.Toolbar
import androidx.fragment.app.Fragment
import br.fmu.bioreino.model.entities.Curso

interface Comunicator {
    fun enviaCurso(curso: Curso)
    fun enviaCategoria(categoria: String)
    fun changeFragment(fragment: Fragment, bundle: Bundle? = null)
    fun trocaAppBar(toolbar: Toolbar)
    fun configuraBotaoVoltarSistema(fragmentAtual: Fragment)
}