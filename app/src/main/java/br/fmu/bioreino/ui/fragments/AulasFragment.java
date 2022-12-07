package br.fmu.bioreino.ui.fragments;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import java.util.ArrayList;

import br.fmu.bioreino.R;
import br.fmu.bioreino.adapter.ListaAulasAdapter;
import br.fmu.bioreino.dao.CursosDAO;
import br.fmu.bioreino.model.Aula;
import br.fmu.bioreino.model.Curso;
import br.fmu.bioreino.util.Comunicador;
import br.fmu.bioreino.util.ListaAulasInterface;

public class AulasFragment extends Fragment implements ListaAulasInterface {

    View aulasFragment;
    Comunicador comunicador;

    RecyclerView listaAulas;
    TextView titulo;
    TextView professor;
    ImageView imagem;

    Curso curso;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        aulasFragment = inflater.inflate(R.layout.fragment_aulas, container, false);

        recebeCurso();
        configuraListaAulas();
        configuraTituloProfessor();
        configuraImagem();

        return aulasFragment;
    }

    // Comunicação ---------------------------------------------------------------------------------
    private void recebeCurso() {
        if (getArguments() != null) {
            curso = (Curso) getArguments().getSerializable("curso");
        } else {
            comunicador = (Comunicador) getActivity();
            if (comunicador != null) {
                comunicador.trocaTela(new HomeFragment());
            }
        }
    }

    // Configurações -------------------------------------------------------------------------------
    private void configuraTituloProfessor() {
        titulo = aulasFragment.findViewById(R.id.fragment_aulas_titulo);
        professor = aulasFragment.findViewById(R.id.fragment_aulas_professor);

        titulo.setText(curso.getTitulo());
        professor.setText(String.format("Prof: %s", curso.getProfessor()));
    }

    private void configuraImagem() {
        imagem = aulasFragment.findViewById(R.id.fragment_aulas_imagem);
        curso.setImagem(imagem);
    }

    private void configuraListaAulas() {
        listaAulas = aulasFragment.findViewById(R.id.fragment_aulas_lista_aulas);
        ListaAulasAdapter listaAulasAdapter = new ListaAulasAdapter(curso, this);

        listaAulas.setLayoutManager(new LinearLayoutManager(this.getContext()));
        listaAulas.setAdapter(listaAulasAdapter);
    }

    // Listener ------------------------------------------------------------------------------------
    @Override
    public void quandoClicarNaAula(int aulaIndex) {
        curso.getAulas().get(aulaIndex).setAulaVista(true);
        CursosDAO.setAulaVista(aulaIndex, curso);
    }
}