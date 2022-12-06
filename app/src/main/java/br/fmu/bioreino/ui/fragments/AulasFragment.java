package br.fmu.bioreino.ui.fragments;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.RecyclerView;

import br.fmu.bioreino.R;
import br.fmu.bioreino.adapter.ListaAulasAdapter;
import br.fmu.bioreino.dao.CursosDAO;
import br.fmu.bioreino.model.Curso;
import br.fmu.bioreino.util.Comunicador;

public class AulasFragment extends Fragment {

    View aulasFragment;
    Comunicador comunicador;

    RecyclerView listaAulas;
    TextView titulo;
    TextView professor;

    Curso curso;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        aulasFragment = inflater.inflate(R.layout.fragment_aulas, container, false);

        recebeCurso();
        configuraListaAulas();
        configuraTituloSubtitulo();

        return aulasFragment;
    }

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

    private void configuraTituloSubtitulo() {
        titulo = aulasFragment.findViewById(R.id.fragment_aulas_titulo);
        professor = aulasFragment.findViewById(R.id.fragment_aulas_professor);

        titulo.setText(curso.getTitulo());
        professor.setText(curso.getProfessor());
    }

    private void configuraListaAulas() {
        listaAulas = aulasFragment.findViewById(R.id.fragment_aulas_lista_aulas);
        ListaAulasAdapter adapter = new ListaAulasAdapter(CursosDAO.getCursos().get(1));
    }


}