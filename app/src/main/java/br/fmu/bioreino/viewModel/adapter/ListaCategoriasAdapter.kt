package br.fmu.bioreino.viewModel.adapter

import android.view.View
import android.view.ViewGroup
import android.widget.Filter
import android.widget.Filterable
import android.widget.TextView
import androidx.cardview.widget.CardView
import androidx.recyclerview.widget.RecyclerView
import br.fmu.bioreino.R
import br.fmu.bioreino.viewModel.adapter.ListaCategoriasAdapter.CategoriaLayout
import br.fmu.bioreino.viewModel.util.CategoriaInterface
import br.fmu.bioreino.viewModel.util.ListaUtil.inflaLayout
import br.fmu.bioreino.model.dao.CursosDAO
import br.fmu.bioreino.model.entities.Categoria

class ListaCategoriasAdapter(private val categoriaInterface: CategoriaInterface) :
    RecyclerView.Adapter<CategoriaLayout>(), Filterable {
    private val categorias = ArrayList<Categoria>()
    private val categoriasCompleta = CursosDAO.categorias

    // Métodos Padrão ------------------------------------------------------------------------------
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): CategoriaLayout {
        return CategoriaLayout(
            inflaLayout(parent, R.layout.item_categoria),
            categoriaInterface
        )
    }

    override fun onBindViewHolder(holder: CategoriaLayout, position: Int) {
        val categoria = categorias[position]
        atualizaInformacoes(holder, categoria)
    }

    override fun getItemCount(): Int {
        return categorias.size
    }

    class CategoriaLayout(itemView: View, categoriaInterface: CategoriaInterface?) :
        RecyclerView.ViewHolder(itemView) {
        val cardFundo: CardView
        val texto: TextView

        init {
            cardFundo = itemView.findViewById(R.id.item_categoria_card)
            texto = itemView.findViewById(R.id.item_categoria_texto)
            itemView.setOnClickListener {
                categoriaInterface?.quandoClicarNaCategoria(
                    texto.text.toString().lowercase()
                )
            }
        }
    }

    // Filtro --------------------------------------------------------------------------------------
    override fun getFilter(): Filter {
        return filtro
    }

    private val filtro: Filter = object : Filter() {
        override fun performFiltering(charSequence: CharSequence): FilterResults {
            val listaFiltrada: MutableList<Categoria> = ArrayList()
            if (charSequence.isEmpty()) {
                listaFiltrada.addAll(categoriasCompleta)
            } else {
                val planoSelecionado = charSequence.toString().lowercase().trim { it <= ' ' }
                for (categoria in categoriasCompleta) {
                    if (categoria.plano.lowercase().contains(planoSelecionado)) {
                        listaFiltrada.add(categoria)
                    }
                }
            }
            val resultado = FilterResults()
            resultado.values = listaFiltrada
            return resultado
        }

        override fun publishResults(charSequence: CharSequence, filterResults: FilterResults) {
            categorias.clear()
            categorias.addAll(filterResults.values as List<Categoria>)
            notifyDataSetChanged()
        }
    }

    // Helpers -------------------------------------------------------------------------------------
    private fun atualizaInformacoes(holder: CategoriaLayout, categoria: Categoria) {
        holder.cardFundo.setCardBackgroundColor(categoria.corFundo)
        holder.texto.text = categoria.nome
        holder.texto.setTextColor(categoria.corTexto)
    }
}