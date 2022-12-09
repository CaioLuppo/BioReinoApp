package br.fmu.bioreino.ui.fragments;

import android.os.Bundle;

import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import br.fmu.bioreino.R;
import br.fmu.bioreino.adapter.ListaCursoCategoriaAdapter;


public class CategoriaFragment extends Fragment {

    RecyclerView listaCursosDaCategoria;
    String categoria;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View fragment = inflater.inflate(R.layout.fragment_categoria, container, false);

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

        return fragment;
    }

}