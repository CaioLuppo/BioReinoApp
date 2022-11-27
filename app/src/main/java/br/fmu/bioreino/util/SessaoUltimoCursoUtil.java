package br.fmu.bioreino.util;

import android.view.View;

import androidx.constraintlayout.widget.ConstraintLayout;

import br.fmu.bioreino.R;
import br.fmu.bioreino.dao.CursosDAO;
import br.fmu.bioreino.ui.fragments.HomeFragment;

public class SessaoUltimoCursoUtil {

    private final View view;
    private final HomeFragment homeFragment;

    public SessaoUltimoCursoUtil(HomeFragment homeFragment, View view) {
        this.homeFragment = homeFragment;
        this.view = view;
    }

    public void mostraConteudoUltimoCurso() {
        ConstraintLayout sessaoUltimoCurso = view.findViewById(R.id.sessao_ultimo_curso_conteudo);
        sessaoUltimoCurso.removeAllViews();
        ConstraintLayout conteudoUltimoCurso;

        ConstraintLayout.LayoutParams parametros;

        if (CursosDAO.ultimoCurso == null) {
            conteudoUltimoCurso = (ConstraintLayout) pegaLayout(R.layout.layout_ultimo_curso_vazio);
            parametros = new ConstraintLayout.LayoutParams(
                    ConstraintLayout.LayoutParams.WRAP_CONTENT, ConstraintLayout.LayoutParams.WRAP_CONTENT
            );
        } else {
            conteudoUltimoCurso = (ConstraintLayout) pegaLayout(R.layout.item_card_aula_ultimo_curso);
            parametros = new ConstraintLayout.LayoutParams(
                    ConstraintLayout.LayoutParams.MATCH_PARENT, ConstraintLayout.LayoutParams.MATCH_PARENT
            );
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

    private View pegaLayout(int layout) {
        return homeFragment.getLayoutInflater().inflate(layout, null);
    }

}
