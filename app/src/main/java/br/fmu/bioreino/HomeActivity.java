package br.fmu.bioreino;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.os.Bundle;

import java.util.ArrayList;

import br.fmu.bioreino.adapters.CoursesViewAdapter;

public class HomeActivity extends AppCompatActivity {

    RecyclerView coursesView;

    ArrayList<String> dataSource;

    LinearLayoutManager linearLayoutManager;

    CoursesViewAdapter coursesViewAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home);

        coursesView = findViewById(R.id.activity_home_courses_view);

        dataSource = new ArrayList<String>();
        dataSource.add("Bio Forense - Caio Luppo");
        dataSource.add("Reino Animal - Caio Luppo");
        dataSource.add("Reino Animal - Caio Luppo");
        dataSource.add("Reino Animal - Caio Luppo");
        dataSource.add("Reino Animal - Caio Luppo");

        linearLayoutManager = new LinearLayoutManager(this, RecyclerView.HORIZONTAL, false);
        coursesViewAdapter = new CoursesViewAdapter(dataSource, this);

        coursesView.setLayoutManager(linearLayoutManager);
        coursesView.setAdapter(coursesViewAdapter);

    }

}