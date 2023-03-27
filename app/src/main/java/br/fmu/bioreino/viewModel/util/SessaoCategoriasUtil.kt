package br.fmu.bioreino.viewModel.util

import android.content.res.Configuration
import android.graphics.drawable.Drawable
import android.view.View
import android.widget.AdapterView
import android.widget.TextView
import androidx.core.content.res.ResourcesCompat
import androidx.recyclerview.widget.RecyclerView
import br.fmu.bioreino.R
import br.fmu.bioreino.viewModel.adapter.ListaCategoriasAdapter
import br.fmu.bioreino.viewModel.adapter.SpinnerCategoriasAdapter
import br.fmu.bioreino.model.componentes.CategoriesSessionSpinner
import br.fmu.bioreino.model.componentes.CategoriesSessionSpinner.CategoriesSpinnerListener

class SessaoCategoriasUtil(private val categoriesSpinnerListener: CategoriesSpinnerListener, val view: View) {
    private var listaCategoriasAdapter: ListaCategoriasAdapter? = null

    private val abertoLight: Drawable? = ResourcesCompat.getDrawable(
        view.resources,
        R.drawable.bg_spinner_aberto_light,
        view.context.theme
    )
    private val fechadoLight: Drawable? = ResourcesCompat.getDrawable(
        view.resources,
        R.drawable.bg_spinner_fechado_light,
        view.context.theme
    )
    private val abertoDark: Drawable? = ResourcesCompat.getDrawable(
        view.resources,
        R.drawable.bg_spinner_aberto_dark,
        view.context.theme
    )
    private val fechadoDark: Drawable? = ResourcesCompat.getDrawable(
        view.resources,
        R.drawable.bg_spinner_fechado_dark,
        view.context.theme
    )

    @JvmField
    var backgroundSpinnerAberto: Drawable? = null

    @JvmField
    var backgroundSpinnerFechado: Drawable? = null

    init {
        atualizaTemaSeletor()
    }

    // Lista
    fun configuraSessaoCategorias(categoriaInterface: CategoriaInterface) {
        configuraListaCategorias(categoriaInterface)
        configuraSpinner()
    }

    private fun configuraListaCategorias(categoriaInterface: CategoriaInterface) {
        val categoriasRecyclerView = view.findViewById<RecyclerView>(R.id.sessao_categorias_lista)
        listaCategoriasAdapter = ListaCategoriasAdapter(categoriaInterface)
        categoriasRecyclerView.adapter = listaCategoriasAdapter
    }

    // Spinner
    private fun configuraSpinner() {
        val spinner: CategoriesSessionSpinner = view.findViewById(R.id.sessao_categorias_spinner)
        val spinnerAdapter = SpinnerCategoriasAdapter(
            view.resources.getStringArray(R.array.categorias)
        )
        spinner.adapter = spinnerAdapter
        spinner.categoriesSpinnerListener = categoriesSpinnerListener
        spinner.background = backgroundSpinnerFechado
        spinner.setSelection(0)
        setFiltroCategoria(spinner)
        listaCategoriasAdapter!!.filter.filter("Kids")
    }

    fun atualizaTemaSeletor() {
        val nightModeFlags = view
            .context.applicationContext
            .resources.configuration.uiMode and Configuration.UI_MODE_NIGHT_MASK
        when (nightModeFlags) {
            Configuration.UI_MODE_NIGHT_YES -> {
                backgroundSpinnerAberto = abertoDark
                backgroundSpinnerFechado = fechadoDark
            }
            Configuration.UI_MODE_NIGHT_NO, Configuration.UI_MODE_NIGHT_UNDEFINED -> {
                backgroundSpinnerAberto = abertoLight
                backgroundSpinnerFechado = fechadoLight
            }
        }
    }

    private fun setFiltroCategoria(spinner: CategoriesSessionSpinner) {
        spinner.onItemSelectedListener = object : AdapterView.OnItemSelectedListener {
            override fun onItemSelected(adapterView: AdapterView<*>?, view: View?, i: Int, l: Long) {
                filtraLista(spinner)
            }

            override fun onNothingSelected(adapterView: AdapterView<*>?) {}
        }
    }

    private fun filtraLista(spinner: CategoriesSessionSpinner) {
        val opcaoSelecionada = spinner.selectedView
        if (opcaoSelecionada != null) {
            val texto = opcaoSelecionada.findViewById<TextView>(R.id.item_plano_categoria_label)
            listaCategoriasAdapter!!.filter.filter(texto.text)
        }
    }
}