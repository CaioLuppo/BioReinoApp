package br.fmu.bioreino.controller.adapter

import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView
import androidx.core.content.res.ResourcesCompat
import androidx.recyclerview.widget.RecyclerView
import br.fmu.bioreino.R
import br.fmu.bioreino.controller.adapter.ListaAulasAdapter.LayoutAula
import br.fmu.bioreino.controller.util.ListaAulasInterface
import br.fmu.bioreino.controller.util.ListaUtil.inflaLayout
import br.fmu.bioreino.model.entities.Curso

class ListaAulasAdapter(private val curso: Curso, listaAulasInterface: ListaAulasInterface) :
    RecyclerView.Adapter<LayoutAula>() {
    private val quantidadeDeAulas: Int = curso.aulas.size
    private val listaAulasInterface: ListaAulasInterface

    init {
        this.listaAulasInterface = listaAulasInterface
    }

    // Métodos Padrão ------------------------------------------------------------------------------
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): LayoutAula {
        return LayoutAula(
            inflaLayout(parent, escolheLayout()),
            quantidadeDeAulas,
            listaAulasInterface,
            curso
        )
    }

    override fun onBindViewHolder(holder: LayoutAula, position: Int) {
        if (quantidadeDeAulas > 0) {
            atualizaInformacoesAula(holder, position)
        } else {
            exibeMensagemVazia(holder, R.string.curso_sem_aulas)
        }
    }

    override fun getItemCount(): Int {
        return if (quantidadeDeAulas == 0) 1 else quantidadeDeAulas
    }

    class LayoutAula(
        itemView: View,
        quantidadeDeAulas: Int,
        listaAulasInterface: ListaAulasInterface?,
        curso: Curso
    ) : RecyclerView.ViewHolder(itemView) {
        var titulo: TextView? = null
        var descricao: TextView? = null
        var mensagemVazia: TextView? = null
        var claquete: ImageView? = null

        init {
            if (quantidadeDeAulas > 0) {
                titulo = itemView.findViewById(R.id.item_aulas_curso_titulo)
                descricao = itemView.findViewById(R.id.item_aulas_curso_descricao)
                claquete = itemView.findViewById(R.id.item_aulas_curso_icone)
                itemView.setOnClickListener {
                    if (listaAulasInterface != null) {
                        val posicao = absoluteAdapterPosition
                        if (posicao != RecyclerView.NO_POSITION) {
                            val aulaFoiVista = curso.aulas[posicao].aulaFoiVista
                            if (!aulaFoiVista) {
                                trocaImagemClaquete(claquete, itemView)
                                listaAulasInterface.quandoClicarNaAula(posicao)
                            }
                        }
                    }
                }
            } else {
                mensagemVazia = itemView.findViewById(R.id.layout_lista_vazia_mensagem)
            }
        }

        companion object {
            fun trocaImagemClaquete(claquete: ImageView?, view: View) {
                claquete!!.setImageDrawable(
                    ResourcesCompat.getDrawable(
                        view.resources,
                        R.drawable.ic_claquete_fechada,
                        view.context.theme
                    )
                )
            }
        }
    }

    // Helpers -------------------------------------------------------------------------------------
    private fun atualizaInformacoesAula(holder: LayoutAula, position: Int) {
        val aula = curso.aulas[position]
        holder.titulo!!.text = aula.titulo
        holder.descricao!!.text = aula.subtitulo
        if (aula.aulaFoiVista) {
            LayoutAula.trocaImagemClaquete(holder.claquete, holder.itemView)
        }
    }

    private fun exibeMensagemVazia(holder: LayoutAula, mensagem: Int) {
        holder.mensagemVazia!!.setText(mensagem)
    }

    private fun escolheLayout(): Int {
        return if (quantidadeDeAulas > 0) R.layout.item_aulas_curso else R.layout.layout_lista_vazia
    }
}