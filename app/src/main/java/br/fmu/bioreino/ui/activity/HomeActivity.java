package br.fmu.bioreino.ui.activity;

import android.app.ActionBar;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;

import androidx.appcompat.app.AppCompatActivity;
import androidx.cardview.widget.CardView;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.constraintlayout.widget.ConstraintSet;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import java.util.ArrayList;

import br.fmu.bioreino.R;
import br.fmu.bioreino.adapter.CursoCardAdapter;
import br.fmu.bioreino.dao.CursosDAO;

public class HomeActivity extends AppCompatActivity {

    // Views
    RecyclerView cursosView;
    ConstraintLayout sessaoUltimoCurso;
    ConstraintLayout conteudoUltimoCurso;

    // DataSource
    ArrayList<String> dataSource;

    // RecyclerView
    LinearLayoutManager linearLayoutManager;
    CursoCardAdapter cursoCardAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home);
        // Código
        configuraListaSeusCursos();

    }

    @Override
    protected void onResume() {
        super.onResume();
        // Código
        mostraConteudoUltimoCurso();

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

    private View pegaLayout(int layout) {
        return getLayoutInflater().inflate(layout, null);
    }

    private void configuraListaSeusCursos() {
        cursosView = findViewById(R.id.activity_home_lista_seus_cursos);

        linearLayoutManager = new LinearLayoutManager(this, RecyclerView.HORIZONTAL, false);
        cursoCardAdapter = new CursoCardAdapter(CursosDAO.getCursos(), this);

        cursosView.setLayoutManager(linearLayoutManager);
        cursosView.setAdapter(cursoCardAdapter);
    }

}