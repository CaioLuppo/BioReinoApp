package br.fmu.bioreino.adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.cardview.widget.CardView;
import androidx.recyclerview.widget.RecyclerView;

import java.util.ArrayList;

import br.fmu.bioreino.R;
import br.fmu.bioreino.model.Categoria;

public class ListaCategoriasAdapter extends RecyclerView.Adapter<ListaCategoriasAdapter.CategoriaLayout> {

    public static String filtro = "kids";
    private final Context contexto;
    public static final ArrayList<Categoria> categorias = new ArrayList<>();

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
        int count = 0;
        for (Categoria categoria:
             categorias) {
            if (categoria.getPlano().equals(filtro)) {
                count++;
            }
        }
        return count;
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

        if (categoria.getPlano().equals(filtro)) {
            holder.cardFundo.setCardBackgroundColor(categoria.getCorFundo());
            holder.texto.setText(categoria.getNome());
            holder.texto.setTextColor(categoria.getCorTexto());
        }
    }
}
