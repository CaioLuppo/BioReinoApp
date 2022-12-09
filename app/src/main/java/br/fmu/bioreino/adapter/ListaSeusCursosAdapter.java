package br.fmu.bioreino.adapter;

import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import java.util.ArrayList;

import br.fmu.bioreino.R;
import br.fmu.bioreino.model.Curso;
import br.fmu.bioreino.util.ListaCursosInterface;
import br.fmu.bioreino.util.ListaUtil;

public class ListaSeusCursosAdapter extends RecyclerView.Adapter<ListaSeusCursosAdapter.CardLayout> {

    private final ListaCursosInterface listaCursosInterface;
    private final ArrayList<Curso> cursos;

    public ListaSeusCursosAdapter(ListaCursosInterface listaCursosInterface, ArrayList<Curso> cursos) {
        this.listaCursosInterface = listaCursosInterface;
        this.cursos = cursos;
    }

    @NonNull
    @Override
    public CardLayout onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        return new CardLayout(ListaUtil.inflaLayout(parent, R.layout.item_card_aula), listaCursosInterface);
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

        public CardLayout(@NonNull View itemView, ListaCursosInterface listaCursosInterface) {
            super(itemView);
            titulo = itemView.findViewById(R.id.item_card_aula_titulo);
            professor = itemView.findViewById(R.id.item_card_aula_professor);
            porcentagem = itemView.findViewById(R.id.item_card_aula_porcentagem);
            barraDeProgresso = itemView.findViewById(R.id.item_card_aula_progress_bar);
            imagem = itemView.findViewById(R.id.item_card_aula_imagem);

            itemView.setOnClickListener(view -> {
                if (listaCursosInterface != null) {
                    int posicao = getAbsoluteAdapterPosition();

                    if (posicao != RecyclerView.NO_POSITION) {
                        listaCursosInterface.quandoClicarNoCurso(posicao);
                    }
                }
            });
        }

    }

    private void atualizaInformacoes(@NonNull CardLayout views, Curso curso) {
        views.titulo.setText(curso.getTitulo());
        views.professor.setText(String.format("Prof: %s", curso.getProfessor()));
        views.barraDeProgresso.setProgress(ListaUtil.formataProgressoBarra(curso.getProgresso()));
        views.porcentagem.setText(String.format("%s%%", curso.getProgresso()));
        curso.setImagem(views.imagem);
    }

}
