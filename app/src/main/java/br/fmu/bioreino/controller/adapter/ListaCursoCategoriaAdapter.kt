package br.fmu.bioreino.controller.adapter

import android.view.View
import android.view.ViewGroup
import android.widget.FrameLayout
import android.widget.ImageView
import android.widget.ProgressBar
import android.widget.TextView
import androidx.cardview.widget.CardView
import androidx.recyclerview.widget.RecyclerView
import br.fmu.bioreino.R
import br.fmu.bioreino.controller.util.ListaUtil.formataProgressoBarra
import br.fmu.bioreino.controller.util.ListaUtil.inflaLayout
import br.fmu.bioreino.model.dao.CursosDAO
import br.fmu.bioreino.model.entities.Curso

class ListaCursoCategoriaAdapter(private val categoria: String) :
    RecyclerView.Adapter<ListaCursoCategoriaAdapter.Holder>() {
    private val cursosLista = CursosDAO.cursos
    private val cursosDaCategoria: ArrayList<Curso>

    init {
        cursosDaCategoria = pegaCursosDaCategoria()
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): Holder {
        return Holder(
            inflaLayout(
                parent,
                if (cursosDaCategoria.size != 0) R.layout.item_card_aula else R.layout.layout_lista_vazia
            )
        )
    }

    override fun onBindViewHolder(holder: Holder, position: Int) {
        if (cursosDaCategoria.size == 0) {
            mostraMensagemVazia(holder)
        } else {
            val curso = cursosDaCategoria[position]
            atualizaInformacoes(holder, curso)
        }
    }

    override fun getItemCount(): Int {
        var size = 0
        for (curso in cursosLista) {
            val categoriasCurso =
                curso.categoria.lowercase().split("\\|".toRegex()).dropLastWhile { it.isEmpty() }
                    .toTypedArray()
            val pertenceCategoriaEscolhida = comparaCategoriasCurso(categoriasCurso)
            if (pertenceCategoriaEscolhida) size++
        }
        if (size == 0) {
            size = 1
        }
        // Pois mostrará a mensagem de erro.
        return size
    }

    class Holder(itemView: View) : RecyclerView.ViewHolder(itemView) {

        val root: CardView? = itemView.findViewById(R.id.item_card_aula_root)
        val titulo: TextView? = itemView.findViewById(R.id.item_card_aula_titulo)
        val professor: TextView? = itemView.findViewById(R.id.item_card_aula_professor)
        val porcentagem: TextView? = itemView.findViewById(R.id.item_card_aula_porcentagem)
        val barraDeProgresso: ProgressBar? = itemView.findViewById(R.id.item_card_aula_progress_bar)
        val imagem: ImageView? = itemView.findViewById(R.id.item_card_aula_imagem)
        val mensagemErro: TextView? = itemView.findViewById(R.id.layout_lista_vazia_mensagem)

    }

    private fun comparaCategoriasCurso(categorias: Array<String>): Boolean {
        for (element in categorias) {
            if (categoria == element) {
                return true
            }
        }
        return false
    }

    private fun atualizaInformacoes(holder: Holder, curso: Curso) {
        val layoutParams = parametrosCardView(holder)
        holder.root?.layoutParams = layoutParams
        holder.titulo?.text = curso.titulo
        holder.professor?.text = String.format("Prof: %s", curso.professor)
        holder.barraDeProgresso?.progress = formataProgressoBarra(curso.progresso)
        holder.porcentagem?.text = String.format("%s%%", curso.progresso)
        curso.setImagem(holder.imagem)
    }

    private fun parametrosCardView(holder: Holder): FrameLayout.LayoutParams? {
        val layoutParams = holder.root?.resources?.getDimension(R.dimen.aula_card_height)?.let {
            FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                it.toInt()
            )
        }
        val margemCard = holder.root?.resources?.getDimension(R.dimen.aula_card_margin)?.toInt()
        margemCard?.let { layoutParams?.setMargins(margemCard, margemCard, margemCard, margemCard) }
        return layoutParams
    }

    private fun pegaCursosDaCategoria(): ArrayList<Curso> {
        val cursosCat = ArrayList<Curso>()
        for (curso in CursosDAO.cursos) {
            val categoriasCurso =
                curso.categoria.split("\\|".toRegex()).dropLastWhile { it.isEmpty() }
                    .toTypedArray()
            val pertenceCategoria = comparaCategoriasCurso(categoriasCurso)
            if (pertenceCategoria) cursosCat.add(curso)
        }
        return cursosCat
    }

    private fun mostraMensagemVazia(holder: Holder) {
        holder.mensagemErro?.setText(R.string.categoria_sem_cursos)
    }
}