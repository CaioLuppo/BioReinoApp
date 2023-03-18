package br.fmu.bioreino.view.fragments

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Spinner
import androidx.fragment.app.Fragment
import br.fmu.bioreino.R
import br.fmu.bioreino.controller.util.*
import br.fmu.bioreino.model.componentes.CategoriesSessionSpinner.CategoriesSpinnerListener
import br.fmu.bioreino.model.dao.CursosDAO
import br.fmu.bioreino.model.dao.CursosDAO.cursos

class HomeFragment : Fragment(), CategoriesSpinnerListener, ListaCursosInterface, CategoriaInterface {
    // Binding
    private var homeFragmentView: View? = null

    // Sessões
    private var categoriasUtil: SessaoCategoriasUtil? = null
    private var ultimoCursoUtil: SessaoUltimoCursoUtil? = null
    private var seusCursosUtil: SessaoSeusCursosUtil? = null

    // Comunicator
    private var comunicator: Comunicator? = null

    // DataSet
    private val listaSeusCursosData = cursos
    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        homeFragmentView = inflater.inflate(R.layout.fragment_home, container, false)
        configuraSessaoCategorias()
        configuraSessaoUltimoCurso()
        configuraSessaoSeusCursos()
        return homeFragmentView
    }

    // Configurações -------------------------------------------------------------------------------
    private fun configuraSessaoCategorias() {
        categoriasUtil = SessaoCategoriasUtil(
            this,
            homeFragmentView!!.findViewById(R.id.fragment_home_sessao_categorias)
        )
        categoriasUtil!!.configuraSessaoCategorias(this)
        categoriasUtil!!.atualizaTemaSeletor()
    }

    private fun configuraSessaoUltimoCurso() {
        ultimoCursoUtil = SessaoUltimoCursoUtil(this, homeFragmentView!!)
        ultimoCursoUtil!!.mostraConteudoUltimoCurso(activity as Comunicator?)
    }

    private fun configuraSessaoSeusCursos() {
        seusCursosUtil = SessaoSeusCursosUtil(homeFragmentView!!, this, listaSeusCursosData)
        seusCursosUtil!!.configuraSessaoSeusCursos()
    }

    // Interfaces ----------------------------------------------------------------------------------
    override fun quandoClicarNoCurso(posicao: Int) {
        comunicator = activity as Comunicator?
        if (comunicator != null) {
            CursosDAO.ultimoCurso = cursos[posicao]
            comunicator!!.enviaCurso(listaSeusCursosData[posicao])
        }
    }

    override fun quandoClicarNaCategoria(categoria: String?) {
        comunicator = activity as Comunicator?
        if (comunicator != null) {
            comunicator!!.enviaCategoria(categoria!!)
        }
    }

    // SessaoCategoriaSpinner ----------------------------------------------------------------------
    override fun aberturaPopUp(spinner: Spinner?) {
        spinner!!.background = categoriasUtil!!.backgroundSpinnerAberto
    }

    override fun fechamentoPopUp(spinner: Spinner?) {
        spinner!!.background = categoriasUtil!!.backgroundSpinnerFechado
    }
}