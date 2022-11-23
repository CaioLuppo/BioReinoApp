package br.fmu.bioreino.adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.squareup.picasso.Picasso;

import java.util.ArrayList;

import br.fmu.bioreino.R;
import br.fmu.bioreino.model.Curso;

public class ListaSeusCursosAdapter extends RecyclerView.Adapter<ListaSeusCursosAdapter.CardLayout> {

    private final ArrayList<Curso> cursos;
    private final Context context;

    public ListaSeusCursosAdapter(ArrayList<Curso> cursos, Context context) {
        this.context = context;
        this.cursos = cursos;
    }

    @NonNull
    @Override
    public CardLayout onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        return new CardLayout(retornaLayoutInflado(parent));
    }

    @Override
    public void onBindViewHolder(@NonNull CardLayout views, int position) {
        Curso curso = cursos.get(position);
        atualizaInformacoes(views, curso);
    }

    @Override
    public int getItemCount() {
        return cursos.size();
    }

    public static class CardLayout extends RecyclerView.ViewHolder {

        final TextView titulo;
        final TextView professor;
        final TextView porcentagem;
        final ProgressBar barraDeProgresso;
        final ImageView imagem;

        public CardLayout(@NonNull View itemView) {
            super(itemView);
            titulo = itemView.findViewById(R.id.item_card_aula_titulo);
            professor = itemView.findViewById(R.id.item_card_aula_professor);
            porcentagem = itemView.findViewById(R.id.item_card_aula_porcentagem);
            barraDeProgresso = itemView.findViewById(R.id.item_card_aula_progress_bar);
            imagem = itemView.findViewById(R.id.item_card_aula_imagem);
        }

    }

    private View retornaLayoutInflado(@NonNull ViewGroup parent) {
        return LayoutInflater.from(context).inflate(
                R.layout.item_card_aula,
                parent,
                false
        );
    }

    private void atualizaInformacoes(@NonNull CardLayout views, Curso curso) {
        views.titulo.setText(curso.getTitulo());
        views.professor.setText(String.format("Prof: %s", curso.getProfessor()));
        views.barraDeProgresso.setProgress(formataProgressoBarra(curso.getProgresso()));
        views.porcentagem.setText(String.format("%s%%", curso.getProgresso()));
        Picasso.get().load(curso.getLinkImagem()).into(views.imagem);
    }

    private int formataProgressoBarra(int progresso) {
        if (progresso == 0 || progresso > 10) {
            return progresso;
        }
        return 10;
    }

}
