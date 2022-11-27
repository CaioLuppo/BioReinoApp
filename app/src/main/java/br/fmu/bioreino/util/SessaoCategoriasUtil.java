package br.fmu.bioreino.util;

import android.content.res.Configuration;
import android.graphics.drawable.Drawable;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.TextView;

import androidx.core.content.res.ResourcesCompat;
import androidx.recyclerview.widget.RecyclerView;

import br.fmu.bioreino.R;
import br.fmu.bioreino.adapter.ListaCategoriasAdapter;
import br.fmu.bioreino.adapter.SeletorCategoriasAdapter;
import br.fmu.bioreino.componentes.SessaoCategoriaSpinner;

public class SessaoCategoriasUtil {

    private SessaoCategoriaSpinner spinner;
    private ListaCategoriasAdapter listaCategoriasAdapter;

    private final Drawable abertoLight;
    private final Drawable fechadoLight;
    private final Drawable abertoDark;
    private final Drawable fechadoDark;

    public Drawable backgroundSpinnerAberto;
    public Drawable backgroundSpinnerFechado;

    final SessaoCategoriaSpinner.SpinnerListener spinnerListener;
    final View view;

    public SessaoCategoriasUtil(SessaoCategoriaSpinner.SpinnerListener spinnerListener, View view) {
        this.spinnerListener = spinnerListener;
        this.view = view;

        this.abertoLight = ResourcesCompat.getDrawable(view.getResources() ,R.drawable.bg_spinner_aberto_light, view.getContext().getTheme());
        this.fechadoLight = ResourcesCompat.getDrawable(view.getResources() ,R.drawable.bg_spinner_fechado_light, view.getContext().getTheme());
        this.abertoDark = ResourcesCompat.getDrawable(view.getResources() ,R.drawable.bg_spinner_aberto_dark, view.getContext().getTheme());
        this.fechadoDark = ResourcesCompat.getDrawable(view.getResources() ,R.drawable.bg_spinner_fechado_dark, view.getContext().getTheme());
        atualizaTemaSeletor();

    }


    // Lista
    public void configuraSessaoCategorias() {
        configuraListaCategorias();
        configuraSpinner();
    }

    public void configuraListaCategorias() {
        RecyclerView categoriasRecyclerView = view.findViewById(R.id.sessao_categorias_lista);
        listaCategoriasAdapter = new ListaCategoriasAdapter(view.getContext());
        categoriasRecyclerView.setAdapter(listaCategoriasAdapter);
    }


    // Spinner
    private void configuraSpinner() {
        spinner = view.findViewById(R.id.sessao_categorias_spinner);
        SeletorCategoriasAdapter spinnerAdapter =
                new SeletorCategoriasAdapter(
                        view.getContext(),
                        view.getResources().getStringArray(R.array.categorias)
                );

        spinner.setAdapter(spinnerAdapter);
        spinner.setSpinnerListener(spinnerListener);
        spinner.setBackground(backgroundSpinnerFechado);
        setFiltroCategoria();
        Log.d("teste", "configurou spinner");
    }

    public void atualizaTemaSeletor() {
        int nightModeFlags = view.getContext().getApplicationContext().getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK;

        switch (nightModeFlags) {
            case Configuration.UI_MODE_NIGHT_YES:
                backgroundSpinnerAberto = abertoDark;
                backgroundSpinnerFechado = fechadoDark;
                break;

            case Configuration.UI_MODE_NIGHT_NO:
            case Configuration.UI_MODE_NIGHT_UNDEFINED:
                backgroundSpinnerAberto = abertoLight;
                backgroundSpinnerFechado = fechadoLight;
                break;
        }

    }

    public void setFiltroCategoria() {
        spinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> adapterView, View view, int i, long l) {
                View layout = spinner.getSelectedView();
                TextView texto = layout.findViewById(R.id.item_plano_categoria_label);
                listaCategoriasAdapter.getFilter().filter(texto.getText());
            }

            @Override
            public void onNothingSelected(AdapterView<?> adapterView) {

            }
        });
    }
}
