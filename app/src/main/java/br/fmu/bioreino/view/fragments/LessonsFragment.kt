package br.fmu.bioreino.view.fragments

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView
import androidx.fragment.app.Fragment
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import br.fmu.bioreino.R
import br.fmu.bioreino.viewModel.adapter.ListaAulasAdapter
import br.fmu.bioreino.viewModel.util.Comunicator
import br.fmu.bioreino.viewModel.util.ListaAulasInterface
import br.fmu.bioreino.model.dao.CursosDAO.setAulaVistaTrue
import br.fmu.bioreino.model.dao.CursosDAO.setUltimaAula
import br.fmu.bioreino.model.entities.Curso

class LessonsFragment : Fragment(), ListaAulasInterface {
    private var aulasFragment: View? = null
    private var comunicator: Comunicator? = null
    private var listaAulas: RecyclerView? = null
    private var titulo: TextView? = null
    private var professor: TextView? = null
    private var imagem: ImageView? = null
    var curso: Curso? = null
    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        aulasFragment = inflater.inflate(R.layout.fragment_aulas, container, false)
        configuraBotaoVoltarSistema()
        recebeCurso()
        configuraListaAulas()
        configuraTituloProfessor()
        configuraImagem()
        return aulasFragment
    }

    // Comunicação ---------------------------------------------------------------------------------
    private fun recebeCurso() {
        if (arguments != null) {
            curso = requireArguments().getSerializable("curso") as Curso
        } else {
            comunicator?.changeFragment(HomeFragment())
        }
    }

    // Configurações -------------------------------------------------------------------------------
    private fun configuraTituloProfessor() {
        titulo = aulasFragment!!.findViewById(R.id.fragment_aulas_titulo)
        professor = aulasFragment!!.findViewById(R.id.fragment_aulas_professor)
        titulo?.text = curso!!.titulo
        professor?.text = String.format("Prof: %s", curso!!.professor)
    }

    private fun configuraImagem() {
        imagem = aulasFragment!!.findViewById(R.id.fragment_aulas_imagem)
        curso!!.setImagem(imagem)
    }

    private fun configuraListaAulas() {
        listaAulas = aulasFragment!!.findViewById(R.id.fragment_aulas_lista_aulas)
        val listaAulasAdapter = ListaAulasAdapter(curso!!, this)
        listaAulas?.layoutManager = LinearLayoutManager(this.context)
        listaAulas?.adapter = listaAulasAdapter
    }

    private fun configuraBotaoVoltarSistema() {
        comunicator = activity as Comunicator?
        comunicator?.configuraBotaoVoltarSistema(this)
    }

    // Listener ------------------------------------------------------------------------------------
    override fun quandoClicarNaAula(aulaIndex: Int) {
        curso!!.aulas[aulaIndex].setAulaVista(true)
        curso!!.adicionaProgresso()
        setAulaVistaTrue(aulaIndex, curso!!)
        setUltimaAula(aulaIndex, curso!!)
    }
}