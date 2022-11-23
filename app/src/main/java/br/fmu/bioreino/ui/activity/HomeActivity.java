package br.fmu.bioreino.ui.activity;

import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
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
import br.fmu.bioreino.util.SessaoUltimoCursoUtil;

public class HomeActivity extends AppCompatActivity implements SessaoCategoriaSpinner.SpinnerListener {

    SessaoCategoriasUtil categoriasUtil;
    SessaoUltimoCursoUtil ultimoCursoUtil;

    // Seus Cursos
    RecyclerView cursosRecyclerView;
    LinearLayoutManager linearLayoutManager;
    ListaSeusCursosAdapter listaSeusCursosAdapter;


    // Métodos principais --------------------------------------------------------------------------
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home);
        // Código
        configuraListaSeusCursos();
        configuraSessaoCategorias();

    }

    @Override
    protected void onResume() {
        super.onResume();
        // Código
        configuraSessaoUltimoCurso();
        categoriasUtil.atualizaTemaSeletor();
    }

    // Configurações -------------------------------------------------------------------------------
    private void configuraSessaoCategorias() {
        categoriasUtil = new SessaoCategoriasUtil(this);
        categoriasUtil.configuraSessaoCategorias();
        categoriasUtil.atualizaTemaSeletor();
    }
    private void configuraSessaoUltimoCurso() {
        ultimoCursoUtil = new SessaoUltimoCursoUtil(this);
        ultimoCursoUtil.mostraConteudoUltimoCurso();
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

}