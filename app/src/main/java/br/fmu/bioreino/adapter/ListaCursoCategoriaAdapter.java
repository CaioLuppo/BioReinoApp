package br.fmu.bioreino.adapter;

import android.util.Log;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.cardview.widget.CardView;
import androidx.recyclerview.widget.RecyclerView;

import java.util.ArrayList;
import java.util.Locale;
import java.util.Objects;

import br.fmu.bioreino.R;
import br.fmu.bioreino.dao.CursosDAO;
import br.fmu.bioreino.model.Curso;
import br.fmu.bioreino.util.CategoriaInterface;
import br.fmu.bioreino.util.ListaUtil;

public class ListaCursoCategoriaAdapter extends RecyclerView.Adapter<ListaCursoCategoriaAdapter.Holder> {

    private final String categoria;
    private final ArrayList<Curso> cursosLista = CursosDAO.getCursos();
    private final ArrayList<Curso> cursosDaCategoria;

    public ListaCursoCategoriaAdapter(String categoria) {
        this.categoria = categoria;
        cursosDaCategoria = pegaCursosDaCategoria();
    }

    @NonNull
    @Override
    public Holder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        return new Holder(
                ListaUtil.inflaLayout(
                        parent,
                        (cursosDaCategoria.size() != 0)
                                ? R.layout.item_card_aula
                                : R.layout.layout_lista_vazia
                )
        );
    }

    @Override
    public void onBindViewHolder(@NonNull Holder holder, int position) {
        if (cursosDaCategoria.size() == 0) {
            mostraMensagemVazia(holder);
        } else {
            Curso curso = cursosDaCategoria.get(position);
            atualizaInformacoes(holder, curso);
        }
    }

    @Override
    public int getItemCount() {
        int size = 0;
        for (Curso curso: cursosLista) {
            String[] categoriasCurso = curso.getCategoria().toLowerCase(Locale.ROOT).split("\\|");
            boolean pertenceCategoriaEscolhida = comparaCategoriasCurso(categoriasCurso);
            if (pertenceCategoriaEscolhida) size++;
        }
        if (size == 0) {
            size = 1;
        }; // Pois mostrará a mensagem de erro.
        return size;
    }

    public static class Holder extends RecyclerView.ViewHolder {

        final CardView root;
        final TextView titulo;
        final TextView professor;
        final TextView porcentagem;
        final ProgressBar barraDeProgresso;
        final ImageView imagem;
        final TextView mensagemErro;

        public Holder(@NonNull View itemView) {
            super(itemView);
            titulo = itemView.findViewById(R.id.item_card_aula_titulo);
            professor = itemView.findViewById(R.id.item_card_aula_professor);
            porcentagem = itemView.findViewById(R.id.item_card_aula_porcentagem);
            barraDeProgresso = itemView.findViewById(R.id.item_card_aula_progress_bar);
            imagem = itemView.findViewById(R.id.item_card_aula_imagem);
            mensagemErro = itemView.findViewById(R.id.layout_lista_vazia_mensagem);
            root = itemView.findViewById(R.id.item_card_aula_root);
        }

    }

    private boolean comparaCategoriasCurso(String[] categorias) {
        for (int count = 0; count <= (categorias.length-1); count++) {
            if (Objects.equals(categoria, categorias[count])) {
                return true;
            }
        }
        return false;
    }

    private void atualizaInformacoes(Holder holder, Curso curso) {
        CardView.LayoutParams layoutParams = parametrosCardView(holder);
        holder.root.setLayoutParams(layoutParams);
        holder.titulo.setText(curso.getTitulo());
        holder.professor.setText(String.format("Prof: %s", curso.getProfessor()));
        holder.barraDeProgresso.setProgress(ListaUtil.formataProgressoBarra(curso.getProgresso()));
        holder.porcentagem.setText(String.format("%s%%", curso.getProgresso()));
        curso.setImagem(holder.imagem);
    }

    @NonNull
    private CardView.LayoutParams parametrosCardView(Holder holder) {
        CardView.LayoutParams layoutParams =
                new CardView.LayoutParams(
                        CardView.LayoutParams.MATCH_PARENT,
                        (int) holder.root.getResources().getDimension(R.dimen.aula_card_height)
                );
        int margemCard = (int) holder.root.getResources().getDimension(R.dimen.aula_card_margin);
        layoutParams.setMargins(margemCard, margemCard, margemCard, margemCard);
        return layoutParams;
    }

    private ArrayList<Curso> pegaCursosDaCategoria() {
        ArrayList<Curso> cursosCat = new ArrayList<>();
        for (Curso curso : CursosDAO.getCursos()){
            String[] categoriasCurso = curso.getCategoria().split("\\|");
            boolean pertenceCategoria = comparaCategoriasCurso(categoriasCurso);
            if (pertenceCategoria) cursosCat.add(curso);
        }
        return cursosCat;
    }

    private void mostraMensagemVazia(Holder holder) {
        holder.mensagemErro.setText(R.string.categoria_sem_cursos);
    }

}
