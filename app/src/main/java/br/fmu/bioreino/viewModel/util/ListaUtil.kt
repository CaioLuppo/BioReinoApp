package br.fmu.bioreino.controller.util

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import br.fmu.bioreino.R

object ListaUtil {
    @JvmStatic
    fun inflaLayout(parent: ViewGroup, layout: Int): View {
        return LayoutInflater.from(parent.context).inflate(layout, parent, false)
    }

    fun mensagemVazia(mensagem: String?, context: Context?, viewGroup: ViewGroup?): View {
        val view =
            LayoutInflater.from(context).inflate(R.layout.layout_lista_vazia, viewGroup, false)
        val mensagemView = view.findViewById<TextView>(R.id.layout_lista_vazia_mensagem)
        mensagemView.text = mensagem
        return view
    }

    @JvmStatic
    fun formataProgressoBarra(progresso: Int): Int {
        return if (progresso == 0 || progresso > 10) {
            progresso
        } else 10
    }
}