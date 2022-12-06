package br.fmu.bioreino.adapter;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import br.fmu.bioreino.R;
import br.fmu.bioreino.model.Aula;
import br.fmu.bioreino.model.Curso;

public class ListaAulasAdapter extends RecyclerView.Adapter<ListaAulasAdapter.LayoutAula> {

    private final Curso curso;

    public ListaAulasAdapter(Curso curso) {
        this.curso = curso;
    }

    @NonNull
    @Override
    public LayoutAula onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View itemAula = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_aulas_curso, parent, false);

        return new LayoutAula(itemAula);
    }

    @Override
    public void onBindViewHolder(@NonNull LayoutAula holder, int position) {
        Aula aula = curso.getAulas().get(position);
    }

    public static class LayoutAula extends RecyclerView.ViewHolder {

        TextView titulo;
        TextView descricao;

        public LayoutAula(@NonNull View itemView) {
            super(itemView);
            titulo = itemView.findViewById(R.id.item_aulas_curso_titulo);
            descricao = itemView.findViewById(R.id.item_aulas_curso_descricao);

        }

    }

    @Override
    public int getItemCount() {
        return curso.getAulas().size();
    }
}
