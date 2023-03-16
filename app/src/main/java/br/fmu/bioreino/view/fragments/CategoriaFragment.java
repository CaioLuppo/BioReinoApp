package br.fmu.bioreino.view.fragments;

import android.os.Bundle;

import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import br.fmu.bioreino.R;
import br.fmu.bioreino.controller.adapter.ListaCursoCategoriaAdapter;
import br.fmu.bioreino.controller.util.Comunicador;


public class CategoriaFragment extends Fragment {

    RecyclerView listaCursosDaCategoria;
    String categoria;

    Comunicador comunicador;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View fragment = inflater.inflate(R.layout.fragment_categoria, container, false);

        configuraBotaoVoltarSistema();
        configuraLista(fragment);

        return fragment;
    }


    //  Helpers ------------------------------------------------------------------------------------
    private void configuraBotaoVoltarSistema() {
        comunicador = (Comunicador) getActivity();
        if (comunicador != null) comunicador.configuraBotaoVoltarSistema(this);
    }

    private void configuraLista(View fragment) {
        listaCursosDaCategoria = fragment.findViewById(R.id.fragment_categoria_lista);

        if (getArguments() != null) {
            categoria = getArguments().getString("categoria");
        } else {
            categoria = "erro";
        }

        ListaCursoCategoriaAdapter listaCursoCategoriaAdapter = new ListaCursoCategoriaAdapter(categoria);
        LinearLayoutManager linearLayoutManager = new LinearLayoutManager(this.getContext());
        listaCursosDaCategoria.setLayoutManager(linearLayoutManager);
        listaCursosDaCategoria.setAdapter(listaCursoCategoriaAdapter);
    }

}