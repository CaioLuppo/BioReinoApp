package br.fmu.bioreino.ui.activity;

import android.os.Bundle;
import android.view.View;
import android.widget.Spinner;

import androidx.appcompat.app.AppCompatActivity;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import br.fmu.bioreino.R;
import br.fmu.bioreino.adapter.ListaSeusCursosAdapter;
import br.fmu.bioreino.componentes.SessaoCategoriaSpinner;
import br.fmu.bioreino.dao.CursosDAO;
import br.fmu.bioreino.util.SessaoCategoriasUtil;

public class HomeActivity extends AppCompatActivity implements SessaoCategoriaSpinner.SpinnerListener {

    // Categorias
    SessaoCategoriasUtil categoriasUtil;

    // Seus Cursos
    RecyclerView cursosRecyclerView;
    LinearLayoutManager linearLayoutManager;
    ListaSeusCursosAdapter listaSeusCursosAdapter;

    // Ultimo Curso
    ConstraintLayout sessaoUltimoCurso;
    ConstraintLayout conteudoUltimoCurso;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home);
        // Código
        configuraListaSeusCursos();
        onCreateSessaoCategorias();
    }

    @Override
    protected void onResume() {
        super.onResume();
        // Código
        mostraConteudoUltimoCurso();
        categoriasUtil.atualizaTemaSeletor();
    }

    private void onCreateSessaoCategorias() {
        categoriasUtil = new SessaoCategoriasUtil(this);
        categoriasUtil.configuraSessaoCategorias();
        categoriasUtil.atualizaTemaSeletor();
    }

    private void mostraConteudoUltimoCurso() {
        sessaoUltimoCurso = findViewById(R.id.activity_home_sessao_ultimo_curso_conteudo);
        sessaoUltimoCurso.removeAllViews();

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
        configuraConstraints(parametros);

    }

    private void configuraConstraints(ConstraintLayout.LayoutParams parametros) {
        parametros.startToStart = sessaoUltimoCurso.getId();
        parametros.endToEnd = sessaoUltimoCurso.getId();
        parametros.topToTop = sessaoUltimoCurso.getId();
        parametros.bottomToBottom = sessaoUltimoCurso.getId();

        conteudoUltimoCurso.setLayoutParams(parametros);
    }

    private void configuraListaSeusCursos() {
        cursosRecyclerView = findViewById(R.id.activity_home_lista_seus_cursos);

        linearLayoutManager = new LinearLayoutManager(this, RecyclerView.HORIZONTAL, false);
        listaSeusCursosAdapter = new ListaSeusCursosAdapter(CursosDAO.getCursos(), this);

        cursosRecyclerView.setLayoutManager(linearLayoutManager);
        cursosRecyclerView.setAdapter(listaSeusCursosAdapter);
    }

    // SessaoCategoriaSpinner ----------------------------------------------------------------------

    @Override
    public void aberturaPopUp(Spinner spinner) {
        spinner.setBackground(categoriasUtil.backgroundSpinnerAberto);
    }

    @Override
    public void fechamentoPopUp(Spinner spinner) {
        spinner.setBackground(categoriasUtil.backgroundSpinnerFechado);
    }

    // Helpers -------------------------------------------------------------------------------------

    private View pegaLayout(int layout) {
        return getLayoutInflater().inflate(layout, null);
    }

}