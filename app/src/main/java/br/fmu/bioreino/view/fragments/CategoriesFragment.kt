package br.fmu.bioreino.view.fragments

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import br.fmu.bioreino.R
import br.fmu.bioreino.controller.adapter.ListaCursoCategoriaAdapter
import br.fmu.bioreino.controller.util.Comunicator

class CategoriesFragment : Fragment() {
    private var listaCursosDaCategoria: RecyclerView? = null
    var categoria: String? = null
    private var comunicator: Comunicator? = null
    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        val fragment = inflater.inflate(R.layout.fragment_categoria, container, false)
        configuraBotaoVoltarSistema()
        configuraLista(fragment)
        return fragment
    }

    //  Helpers ------------------------------------------------------------------------------------
    private fun configuraBotaoVoltarSistema() {
        comunicator = activity as Comunicator?
        if (comunicator != null) comunicator?.configuraBotaoVoltarSistema(this)
    }

    private fun configuraLista(fragment: View) {
        listaCursosDaCategoria = fragment.findViewById(R.id.fragment_categoria_lista)
        categoria = if (arguments != null) {
            requireArguments().getString("categoria")
        } else {
            "erro"
        }
        val listaCursoCategoriaAdapter = ListaCursoCategoriaAdapter(categoria!!)
        val linearLayoutManager = LinearLayoutManager(this.context)
        listaCursosDaCategoria?.layoutManager = linearLayoutManager
        listaCursosDaCategoria?.adapter = listaCursoCategoriaAdapter
    }
}