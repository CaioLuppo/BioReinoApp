package br.fmu.bioreino.adapter;

import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import br.fmu.bioreino.R;
import br.fmu.bioreino.model.Aula;
import br.fmu.bioreino.model.Curso;
import br.fmu.bioreino.util.ListaUtil;

public class ListaAulasAdapter extends RecyclerView.Adapter<ListaAulasAdapter.LayoutAula> {

    private final Curso curso;
    int quantidadeDeAulas;

    public ListaAulasAdapter(Curso curso) {
        this.curso = curso;
        quantidadeDeAulas = curso.getAulas().size();
    }


    // Métodos Padrão ------------------------------------------------------------------------------
    @NonNull
    @Override
    public LayoutAula onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        return new LayoutAula(
                ListaUtil.inflaLayout(
                        parent,
                        (quantidadeDeAulas > 0)
                                ? R.layout.item_aulas_curso
                                : R.layout.layout_lista_vazia
                ),
                quantidadeDeAulas
        );
    }

    @Override
    public void onBindViewHolder(@NonNull LayoutAula holder, int position) {
        if (quantidadeDeAulas > 0) {
            atualizaInformacoesAula(holder, position);
        } else {
            exibeMensagemVazia(holder, R.string.curso_sem_aulas);
        }
    }


    @Override
    public int getItemCount() {
        return (quantidadeDeAulas == 0) ? 1 : quantidadeDeAulas;
    }

    public static class LayoutAula extends RecyclerView.ViewHolder {

        TextView titulo;
        TextView descricao;
        TextView mensagemVazia;

        public LayoutAula(@NonNull View itemView, int quantidadeDeAulas) {
            super(itemView);
            if (quantidadeDeAulas > 0) {
                titulo = itemView.findViewById(R.id.item_aulas_curso_titulo);
                descricao = itemView.findViewById(R.id.item_aulas_curso_descricao);
            } else {
                mensagemVazia = itemView.findViewById(R.id.layout_lista_vazia_mensagem);
            }
        }

    }


    // Helpers -------------------------------------------------------------------------------------
    private void atualizaInformacoesAula(@NonNull LayoutAula holder, int position) {
        Aula aula = curso.getAulas().get(position);
        holder.titulo.setText(aula.getTitulo());
        holder.descricao.setText(aula.getSubtitulo());
    }

    private void exibeMensagemVazia(LayoutAula holder, int mensagem) {
        holder.mensagemVazia.setText(mensagem);
    }

}
