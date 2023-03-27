package br.fmu.bioreino.viewModel.adapter

import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.ProgressBar
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import br.fmu.bioreino.R
import br.fmu.bioreino.viewModel.util.ListaCursosInterface
import br.fmu.bioreino.viewModel.util.ListaUtil.formataProgressoBarra
import br.fmu.bioreino.viewModel.util.ListaUtil.inflaLayout
import br.fmu.bioreino.model.entities.Curso

class ListaSeusCursosAdapter(
    private val listaCursosInterface: ListaCursosInterface,
    private val cursos: ArrayList<Curso>
) : RecyclerView.Adapter<ListaSeusCursosAdapter.CardLayout>() {
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): CardLayout {
        return CardLayout(inflaLayout(parent, R.layout.item_card_aula), listaCursosInterface)
    }

    override fun onBindViewHolder(views: CardLayout, position: Int) {
        val curso = cursos[position]
        atualizaInformacoes(views, curso)
    }

    override fun getItemCount(): Int {
        return cursos.size
    }

    class CardLayout(itemView: View, listaCursosInterface: ListaCursosInterface?) :
        RecyclerView.ViewHolder(itemView) {
        val titulo: TextView
        val professor: TextView
        val porcentagem: TextView
        val barraDeProgresso: ProgressBar
        val imagem: ImageView

        init {
            titulo = itemView.findViewById(R.id.item_card_aula_titulo)
            professor = itemView.findViewById(R.id.item_card_aula_professor)
            porcentagem = itemView.findViewById(R.id.item_card_aula_porcentagem)
            barraDeProgresso = itemView.findViewById(R.id.item_card_aula_progress_bar)
            imagem = itemView.findViewById(R.id.item_card_aula_imagem)
            itemView.setOnClickListener {
                if (listaCursosInterface != null) {
                    val posicao = absoluteAdapterPosition
                    if (posicao != RecyclerView.NO_POSITION) {
                        listaCursosInterface.quandoClicarNoCurso(posicao)
                    }
                }
            }
        }
    }

    private fun atualizaInformacoes(views: CardLayout, curso: Curso) {
        views.titulo.text = curso.titulo
        views.professor.text = String.format("Prof: %s", curso.professor)
        views.barraDeProgresso.progress = formataProgressoBarra(curso.progresso)
        views.porcentagem.text = String.format("%s%%", curso.progresso)
        curso.setImagem(views.imagem)
    }
}