package br.fmu.bioreino.util;

import android.content.res.Configuration;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.widget.AdapterView;
import android.widget.TextView;

import androidx.core.content.res.ResourcesCompat;
import androidx.recyclerview.widget.RecyclerView;

import br.fmu.bioreino.R;
import br.fmu.bioreino.adapter.ListaCategoriasAdapter;
import br.fmu.bioreino.adapter.SeletorCategoriasAdapter;
import br.fmu.bioreino.componentes.SessaoCategoriaSpinner;
import br.fmu.bioreino.ui.activity.HomeActivity;

public class SessaoCategoriasUtil {

    private SessaoCategoriaSpinner spinner;
    private ListaCategoriasAdapter listaCategoriasAdapter;

    private final Drawable abertoLight;
    private final Drawable fechadoLight;
    private final Drawable abertoDark;
    private final Drawable fechadoDark;

    public Drawable backgroundSpinnerAberto;
    public Drawable backgroundSpinnerFechado;

    final HomeActivity context;

    public SessaoCategoriasUtil(HomeActivity context) {
        this.context = context;

        this.abertoLight = ResourcesCompat.getDrawable(context.getResources() ,R.drawable.bg_spinner_aberto_light, context.getTheme());
        this.fechadoLight = ResourcesCompat.getDrawable(context.getResources() ,R.drawable.bg_spinner_fechado_light, context.getTheme());
        this.abertoDark = ResourcesCompat.getDrawable(context.getResources() ,R.drawable.bg_spinner_aberto_dark, context.getTheme());
        this.fechadoDark = ResourcesCompat.getDrawable(context.getResources() ,R.drawable.bg_spinner_fechado_dark, context.getTheme());
        atualizaTemaSeletor();

    }


    // Lista
    public void configuraSessaoCategorias() {
        configuraListaCategorias();
        configuraSpinner();
    }

    public void configuraListaCategorias() {
        RecyclerView categoriasRecyclerView = context.findViewById(R.id.activity_home_sessao_categorias_lista);
        listaCategoriasAdapter = new ListaCategoriasAdapter(context);
        categoriasRecyclerView.setAdapter(listaCategoriasAdapter);
    }


    // Spinner
    private void configuraSpinner() {
        spinner = context.findViewById(R.id.activity_home_sessao_categorias_spinner);
        SeletorCategoriasAdapter spinnerAdapter =
                new SeletorCategoriasAdapter(
                        context,
                        context.getResources().getStringArray(R.array.categorias)
                );

        spinner.setAdapter(spinnerAdapter);
        spinner.setSpinnerListener(context);
        spinner.setBackground(backgroundSpinnerFechado);
        setFiltroCategoria();
    }

    public void atualizaTemaSeletor() {
        int nightModeFlags = context.getApplicationContext().getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK;

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
