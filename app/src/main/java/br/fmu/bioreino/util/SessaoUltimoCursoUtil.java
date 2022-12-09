package br.fmu.bioreino.util;

import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.constraintlayout.widget.ConstraintLayout;

import br.fmu.bioreino.R;
import br.fmu.bioreino.dao.CursosDAO;
import br.fmu.bioreino.model.Aula;
import br.fmu.bioreino.ui.fragments.HomeFragment;

public class SessaoUltimoCursoUtil {

    private final View view;
    private final HomeFragment homeFragment;

    public SessaoUltimoCursoUtil(HomeFragment homeFragment, View view) {
        this.homeFragment = homeFragment;
        this.view = view;
    }

    public void mostraConteudoUltimoCurso(Comunicador comunicador) {
        ConstraintLayout sessaoUltimoCurso = view.findViewById(R.id.sessao_ultimo_curso_conteudo);
        sessaoUltimoCurso.removeAllViews();
        ConstraintLayout conteudoUltimoCurso;

        ConstraintLayout.LayoutParams parametros;

        if (CursosDAO.ultimoCurso == null) {
            conteudoUltimoCurso = getLayoutVazio();
            parametros = getLayoutVazioParams();
        } else {
            conteudoUltimoCurso = getCardAula();
            parametros = getCardAulaParams();
            configuraConteudoUltimoCurso(conteudoUltimoCurso);
            configuraAulaUltimoCurso(conteudoUltimoCurso);
            configuraClick(comunicador, conteudoUltimoCurso);
        }
        sessaoUltimoCurso.addView(conteudoUltimoCurso);
        configuraConstraints(parametros, conteudoUltimoCurso, sessaoUltimoCurso);

    }

    private void configuraConstraints(
            ConstraintLayout.LayoutParams parametros,
            ConstraintLayout conteudoUltimoCurso,
            ConstraintLayout sessaoUltimoCurso) {

        parametros.startToStart = sessaoUltimoCurso.getId();
        parametros.endToEnd = sessaoUltimoCurso.getId();
        parametros.topToTop = sessaoUltimoCurso.getId();
        parametros.bottomToBottom = sessaoUltimoCurso.getId();

        conteudoUltimoCurso.setLayoutParams(parametros);
    }

    // Helpers -------------------------------------------------------------------------------------
    @NonNull
    private ConstraintLayout.LayoutParams getLayoutVazioParams() {
        ConstraintLayout.LayoutParams parametros;
        parametros = new ConstraintLayout.LayoutParams(
                ConstraintLayout.LayoutParams.WRAP_CONTENT, ConstraintLayout.LayoutParams.WRAP_CONTENT
        );
        return parametros;
    }

    private ConstraintLayout getLayoutVazio() {
        return (ConstraintLayout) pegaLayout(R.layout.layout_ultimo_curso_vazio);
    }

    private ConstraintLayout getCardAula() {
        return (ConstraintLayout) pegaLayout(R.layout.item_card_aula_ultimo_curso);
    }

    private void configuraConteudoUltimoCurso(ConstraintLayout conteudoUltimoCurso) {
        TextView titulo = conteudoUltimoCurso.findViewById(R.id.item_card_aula_ultimo_curso_titulo);
        TextView professor = conteudoUltimoCurso.findViewById(R.id.item_card_aula_ultimo_curso_professor);
        ImageView imagem = conteudoUltimoCurso.findViewById(R.id.item_card_aula_ultimo_curso_imagem);

        titulo.setText(CursosDAO.ultimoCurso.getTitulo());
        professor.setText(String.format("Prof: %s", CursosDAO.ultimoCurso.getProfessor()));
        CursosDAO.ultimoCurso.setImagem(imagem);
    }

    private void configuraAulaUltimoCurso(ConstraintLayout conteudoUltimoCurso) {
        TextView tituloAula = conteudoUltimoCurso.findViewById(R.id.item_aulas_curso_titulo);
        TextView subtituloAula = conteudoUltimoCurso.findViewById(R.id.item_aulas_curso_descricao);

        Aula ultimaAula = CursosDAO.getUltimaAula(CursosDAO.ultimoCurso);
        if (ultimaAula != null) {
            tituloAula.setText(ultimaAula.getTitulo());
            subtituloAula.setText(ultimaAula.getSubtitulo());
        } else {
            tituloAula.setText(R.string.curso_sem_aula_titulo);
            subtituloAula.setText(R.string.curso_sem_aula_sub);
        }
    }

    @NonNull
    private ConstraintLayout.LayoutParams getCardAulaParams() {
        ConstraintLayout.LayoutParams parametros;
        parametros = new ConstraintLayout.LayoutParams(
                ConstraintLayout.LayoutParams.MATCH_PARENT, ConstraintLayout.LayoutParams.MATCH_PARENT
        );
        return parametros;
    }

    private void configuraClick(Comunicador comunicador, ConstraintLayout conteudoUltimoCurso) {
        conteudoUltimoCurso.setOnClickListener(view -> {
            if (comunicador != null) comunicador.enviaCurso(CursosDAO.ultimoCurso);
        });
    }

    private View pegaLayout(int layout) {
        return homeFragment.getLayoutInflater().inflate(layout, null);
    }

}
