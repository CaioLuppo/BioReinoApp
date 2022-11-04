package br.fmu.bioreino.adapters;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ProgressBar;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import java.util.ArrayList;

import br.fmu.bioreino.R;
import br.fmu.bioreino.dao.CursosDAO;
import br.fmu.bioreino.model.Curso;

public class CursoCardAdapter extends RecyclerView.Adapter<CursoCardAdapter.Holder> {

    ArrayList<Curso> cursos;
    private final Context context;

    public CursoCardAdapter(ArrayList<Curso> cursos, Context context) {
        this.context = context;
        this.cursos = cursos;
    }

    @NonNull
    @Override
    public Holder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(context).inflate(
                R.layout.item_card_aula,
                parent,
                false
        );
        return new Holder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull Holder views, int position) {
        Curso curso = cursos.get(position);
        views.titulo.setText(curso.getTitulo());
        views.professor.setText(String.format("Prof: %s", curso.getProfessor()));
        views.barraDeProgresso.setProgress(calculaProgressoBarra(curso.getProgresso()));
        views.porcentagem.setText(String.format("%s%%", curso.getProgresso()));
    }

    private int calculaProgressoBarra(int progresso) {
        if (progresso == 0 || progresso > 10) {
            return progresso;
        }
        return 10;
    }

    @Override
    public int getItemCount() {
        return cursos.size();
    }

    public static class Holder extends RecyclerView.ViewHolder {

        TextView titulo;
        TextView professor;
        TextView porcentagem;
        ProgressBar barraDeProgresso;

        public Holder(@NonNull View itemView) {
            super(itemView);
            titulo = itemView.findViewById(R.id.item_card_aula_titulo);
            professor = itemView.findViewById(R.id.item_card_aula_professor);
            porcentagem = itemView.findViewById(R.id.item_card_aula_porcentagem);
            barraDeProgresso = itemView.findViewById(R.id.item_card_aula_progress_bar);
        }
    }

}
