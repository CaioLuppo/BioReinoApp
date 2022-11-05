package br.fmu.bioreino.ui.activity;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.os.Bundle;

import java.util.ArrayList;

import br.fmu.bioreino.R;
import br.fmu.bioreino.adapters.CursoCardAdapter;
import br.fmu.bioreino.dao.CursosDAO;

public class HomeActivity extends AppCompatActivity {

    RecyclerView cursosView;

    ArrayList<String> dataSource;

    LinearLayoutManager linearLayoutManager;

    CursoCardAdapter cursoCardAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home);

        cursosView = findViewById(R.id.activity_home_lista_seus_cursos);

        linearLayoutManager = new LinearLayoutManager(this, RecyclerView.HORIZONTAL, false);
        cursoCardAdapter = new CursoCardAdapter(CursosDAO.getCursos(), this);

        cursosView.setLayoutManager(linearLayoutManager);
        cursosView.setAdapter(cursoCardAdapter);

    }

}