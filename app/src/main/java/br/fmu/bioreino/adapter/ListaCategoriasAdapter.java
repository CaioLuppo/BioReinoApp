package br.fmu.bioreino.adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Filter;
import android.widget.Filterable;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.cardview.widget.CardView;
import androidx.recyclerview.widget.RecyclerView;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import br.fmu.bioreino.R;
import br.fmu.bioreino.dao.CursosDAO;
import br.fmu.bioreino.model.Categoria;

public class ListaCategoriasAdapter extends RecyclerView.Adapter<ListaCategoriasAdapter.CategoriaLayout> implements Filterable {

    private final Context contexto;

    private final ArrayList<Categoria> categorias = new ArrayList<>();
    private final ArrayList<Categoria> categoriasCompleta = CursosDAO.getCategorias();

    public ListaCategoriasAdapter(Context contexto) {
        this.contexto = contexto;
    }

    @NonNull
    @Override
    public CategoriaLayout onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        return new CategoriaLayout(retornaLayoutInflado(parent));
    }

    @Override
    public void onBindViewHolder(@NonNull CategoriaLayout holder, int position) {
        Categoria categoria = categorias.get(position);
        atualizaInformacoes(holder, categoria);
    }

    @Override
    public int getItemCount() {
        return categorias.size();
    }

    public static class CategoriaLayout extends RecyclerView.ViewHolder {

        final CardView cardFundo;
        final TextView texto;

        public CategoriaLayout(@NonNull View itemView) {
            super(itemView);

            cardFundo = itemView.findViewById(R.id.item_categoria_card);
            texto = itemView.findViewById(R.id.item_categoria_texto);

        }

    }

    private View retornaLayoutInflado(ViewGroup parent) {
        return LayoutInflater.from(contexto).inflate(R.layout.item_categoria, parent, false);
    }

    private void atualizaInformacoes(@NonNull CategoriaLayout holder, Categoria categoria) {

        holder.cardFundo.setCardBackgroundColor(categoria.getCorFundo());
        holder.texto.setText(categoria.getNome());
        holder.texto.setTextColor(categoria.getCorTexto());

    }


    @Override
    public Filter getFilter() {
        return filtro;
    }

    private final Filter filtro = new Filter() {
        @Override
        protected FilterResults performFiltering(CharSequence charSequence) {
            List<Categoria> listaFiltrada = new ArrayList<>();

            if (charSequence == null || charSequence.length() == 0) {
                listaFiltrada.addAll(categoriasCompleta);
            } else {
                String planoSelecionado = charSequence.toString().toLowerCase(Locale.ROOT).trim();

                for (Categoria categoria : categoriasCompleta) {
                    if (categoria.getPlano().toLowerCase(Locale.ROOT).contains(planoSelecionado)) {
                        listaFiltrada.add(categoria);
                    }
                }
            }

            FilterResults resultado = new FilterResults();
            resultado.values = listaFiltrada;

            return resultado;
        }

        @Override
        protected void publishResults(CharSequence charSequence, FilterResults filterResults) {
            categorias.clear();
            categorias.addAll((List) filterResults.values);
            notifyDataSetChanged();
        }
        
    };

}
