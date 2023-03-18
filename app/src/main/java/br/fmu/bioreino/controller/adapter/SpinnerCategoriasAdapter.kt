package br.fmu.bioreino.controller.adapter

import android.view.View
import android.view.ViewGroup
import android.widget.BaseAdapter
import android.widget.TextView
import br.fmu.bioreino.R
import br.fmu.bioreino.controller.util.ListaUtil.inflaLayout

class SpinnerCategoriasAdapter(private val planos: Array<String>) : BaseAdapter() {
    override fun getCount(): Int {
        return planos.size
    }

    override fun getItem(i: Int): Any? {
        return null
    }

    override fun getItemId(i: Int): Long {
        return 0
    }

    override fun getView(i: Int, view: View?, viewGroup: ViewGroup): View {
        val layout = inflaLayout(viewGroup, R.layout.item_plano_categoria)
        val label = layout.findViewById<TextView>(R.id.item_plano_categoria_label)
        label.text = planos[i]
        return layout
    }
}