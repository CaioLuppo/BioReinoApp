package br.fmu.bioreino.util;

import android.view.View;
import android.widget.TextView;

import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import java.util.ArrayList;

import br.fmu.bioreino.R;
import br.fmu.bioreino.adapter.ListaSeusCursosAdapter;
import br.fmu.bioreino.model.Curso;
import br.fmu.bioreino.ui.activity.MainActivity;
import br.fmu.bioreino.ui.fragments.HomeFragment;

public class SessaoSeusCursosUtil {

    private final View homeFragmentView;
    private final HomeFragment fragment;
    private final ArrayList<Curso> listaSeusCursosData;

    public SessaoSeusCursosUtil(View homeFragmentView, HomeFragment fragment, ArrayList<Curso> listaSeusCursosData) {
        this.homeFragmentView = homeFragmentView;
        this.fragment = fragment;
        this.listaSeusCursosData = listaSeusCursosData;
    }

    public void configuraSessaoSeusCursos() {
        configuraMostrarMais();
        configuraListaSeusCursos();
    }

    private void configuraMostrarMais() {
        TextView mostarMais = homeFragmentView.findViewById(R.id.sessao_seus_cursos_mostrar_tudo);
        mostarMais.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                MainActivity mainActivity = (MainActivity) fragment.getActivity();
                if (mainActivity != null) {
                    mainActivity.mostraMensagemAindaNaoDisponivel(fragment.getContext());
                }
            }
        });
    }

    private void configuraListaSeusCursos() {
        // Seus Cursos
        RecyclerView cursosRecyclerView =
                homeFragmentView.findViewById(R.id.sessao_seus_cursos_lista_seus_cursos);

        LinearLayoutManager linearLayoutManager = new LinearLayoutManager(
                fragment.getContext(),
                RecyclerView.HORIZONTAL,
                false
        );

        ListaSeusCursosAdapter listaSeusCursosAdapter = new ListaSeusCursosAdapter(
                fragment, listaSeusCursosData
        );

        cursosRecyclerView.setLayoutManager(linearLayoutManager);
        cursosRecyclerView.setAdapter(listaSeusCursosAdapter);

    }

}
