package br.fmu.bioreino.ui.fragments;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Spinner;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import java.util.ArrayList;

import br.fmu.bioreino.R;
import br.fmu.bioreino.adapter.ListaSeusCursosAdapter;
import br.fmu.bioreino.componentes.SessaoCategoriaSpinner;
import br.fmu.bioreino.dao.CursosDAO;
import br.fmu.bioreino.model.Curso;
import br.fmu.bioreino.ui.activity.MainActivity;
import br.fmu.bioreino.util.CategoriaInterface;
import br.fmu.bioreino.util.Comunicador;
import br.fmu.bioreino.util.ListaCursosInterface;
import br.fmu.bioreino.util.SessaoCategoriasUtil;
import br.fmu.bioreino.util.SessaoSeusCursosUtil;
import br.fmu.bioreino.util.SessaoUltimoCursoUtil;

public class HomeFragment extends Fragment implements SessaoCategoriaSpinner.SpinnerListener, ListaCursosInterface, CategoriaInterface {

    // Binding
    private View homeFragmentView;

    // Sessões
    private SessaoCategoriasUtil categoriasUtil;
    private SessaoUltimoCursoUtil ultimoCursoUtil;
    private SessaoSeusCursosUtil seusCursosUtil;

    // Comunicador
    private Comunicador comunicador;

    // DataSet
    private final ArrayList<Curso> listaSeusCursosData = CursosDAO.getCursos();

    public HomeFragment() {
        // Required empty public constructor
    }

    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        homeFragmentView = inflater.inflate(R.layout.fragment_home, container, false);

        configuraSessaoCategorias();
        configuraSessaoUltimoCurso();
        configuraSessaoSeusCursos();

        return homeFragmentView;
    }


    // Configurações -------------------------------------------------------------------------------
    private void configuraSessaoCategorias() {
        categoriasUtil = new SessaoCategoriasUtil(this, homeFragmentView.findViewById(R.id.fragment_home_sessao_categorias));
        categoriasUtil.configuraSessaoCategorias(this);
        categoriasUtil.atualizaTemaSeletor();
    }

    private void configuraSessaoUltimoCurso() {
        ultimoCursoUtil = new SessaoUltimoCursoUtil(this, homeFragmentView);
        ultimoCursoUtil.mostraConteudoUltimoCurso((Comunicador) getActivity());
    }

    private void configuraSessaoSeusCursos() {
        seusCursosUtil = new SessaoSeusCursosUtil(homeFragmentView, this, listaSeusCursosData);
        seusCursosUtil.configuraSessaoSeusCursos();
    }


    // Interfaces ----------------------------------------------------------------------------------
    @Override
    public void quandoClicarNoCurso(int posicao) {
        comunicador = (Comunicador) getActivity();

        if (comunicador != null) {
            CursosDAO.ultimoCurso = CursosDAO.getCursos().get(posicao);
            comunicador.enviaCurso(listaSeusCursosData.get(posicao));
        }
    }

    @Override
    public void quandoClicarNaCategoria(String categoria) {
        comunicador = (Comunicador) getActivity();

        if (comunicador != null) {
            comunicador.enviaCategoria(categoria);
        }
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