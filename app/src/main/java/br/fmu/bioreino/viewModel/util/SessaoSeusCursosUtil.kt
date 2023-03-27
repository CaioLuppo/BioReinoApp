package br.fmu.bioreino.viewModel.util

import android.view.View
import android.widget.TextView
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import br.fmu.bioreino.R
import br.fmu.bioreino.viewModel.adapter.ListaSeusCursosAdapter
import br.fmu.bioreino.model.entities.Curso
import br.fmu.bioreino.view.activity.MainActivity
import br.fmu.bioreino.view.fragments.HomeFragment

class SessaoSeusCursosUtil(
    private val homeFragmentView: View,
    private val fragment: HomeFragment,
    private val listaSeusCursosData: ArrayList<Curso>
) {
    fun configuraSessaoSeusCursos() {
        configuraMostrarMais()
        configuraListaSeusCursos()
    }

    private fun configuraMostrarMais() {
        val mostarMais =
            homeFragmentView.findViewById<TextView>(R.id.sessao_seus_cursos_mostrar_tudo)
        mostarMais.setOnClickListener {
            (fragment.activity as MainActivity?)?.showNotYetDefined(fragment.context)
        }
    }

    private fun configuraListaSeusCursos() {
        // Seus Cursos
        val cursosRecyclerView =
            homeFragmentView.findViewById<RecyclerView>(R.id.sessao_seus_cursos_lista_seus_cursos)
        val linearLayoutManager = LinearLayoutManager(
            fragment.context,
            RecyclerView.HORIZONTAL,
            false
        )
        val listaSeusCursosAdapter = ListaSeusCursosAdapter(
            fragment, listaSeusCursosData
        )
        cursosRecyclerView.layoutManager = linearLayoutManager
        cursosRecyclerView.adapter = listaSeusCursosAdapter
    }
}