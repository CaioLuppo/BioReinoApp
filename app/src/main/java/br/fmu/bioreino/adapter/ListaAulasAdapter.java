package br.fmu.bioreino.adapter;

import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.core.content.res.ResourcesCompat;
import androidx.recyclerview.widget.RecyclerView;

import br.fmu.bioreino.R;
import br.fmu.bioreino.model.Aula;
import br.fmu.bioreino.model.Curso;
import br.fmu.bioreino.util.ListaAulasInterface;
import br.fmu.bioreino.util.ListaUtil;

public class ListaAulasAdapter extends RecyclerView.Adapter<ListaAulasAdapter.LayoutAula> {

    private final Curso curso;
    private final int quantidadeDeAulas;
    private final ListaAulasInterface listaAulasInterface;

    public ListaAulasAdapter(Curso curso, ListaAulasInterface listaAulasInterface) {
        this.curso = curso;
        quantidadeDeAulas = curso.getAulas().size();
        this.listaAulasInterface = listaAulasInterface;
    }


    // Métodos Padrão ------------------------------------------------------------------------------
    @NonNull
    @Override
    public LayoutAula onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        return new LayoutAula(
                ListaUtil.inflaLayout(parent, escolheLayout()),
                quantidadeDeAulas,
                listaAulasInterface,
                curso
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
        ImageView claquete;

        public LayoutAula(@NonNull View itemView, int quantidadeDeAulas, ListaAulasInterface listaAulasInterface, Curso curso) {
            super(itemView);
            if (quantidadeDeAulas > 0) {

                titulo = itemView.findViewById(R.id.item_aulas_curso_titulo);
                descricao = itemView.findViewById(R.id.item_aulas_curso_descricao);
                claquete = itemView.findViewById(R.id.item_aulas_curso_icone);

                itemView.setOnClickListener(view -> {
                    if (listaAulasInterface != null) {
                        int posicao = getAbsoluteAdapterPosition();
                        if (posicao != RecyclerView.NO_POSITION) {
                            boolean aulaFoiVista = curso.getAulas().get(posicao).getAulaFoiVista();
                            if (!aulaFoiVista) {
                                trocaImagemClaquete(claquete, itemView);
                                listaAulasInterface.quandoClicarNaAula(posicao);
                            }
                        }
                    }
                });

            } else {
                mensagemVazia = itemView.findViewById(R.id.layout_lista_vazia_mensagem);
            }
        }

        public static void trocaImagemClaquete(ImageView claquete, View view) {
            claquete.setImageDrawable(ResourcesCompat.getDrawable(
                    view.getResources(),
                    R.drawable.ic_claquete_fechada,
                    view.getContext().getTheme()
            ));
        }

    }


    // Helpers -------------------------------------------------------------------------------------
    private void atualizaInformacoesAula(@NonNull LayoutAula holder, int position) {
        Aula aula = curso.getAulas().get(position);
        holder.titulo.setText(aula.getTitulo());
        holder.descricao.setText(aula.getSubtitulo());
        if (aula.getAulaFoiVista()) {
            LayoutAula.trocaImagemClaquete(holder.claquete, holder.itemView);
        }
    }

    private void exibeMensagemVazia(LayoutAula holder, int mensagem) {
        holder.mensagemVazia.setText(mensagem);
    }

    private int escolheLayout() {
        return (quantidadeDeAulas > 0)
                ? R.layout.item_aulas_curso
                : R.layout.layout_lista_vazia;
    }
}
