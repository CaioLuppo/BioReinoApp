package br.fmu.bioreino.controller.util

import android.view.View
import android.widget.ImageView
import android.widget.TextView
import androidx.constraintlayout.widget.ConstraintLayout
import br.fmu.bioreino.R
import br.fmu.bioreino.model.dao.CursosDAO
import br.fmu.bioreino.view.fragments.HomeFragment

class SessaoUltimoCursoUtil(private val homeFragment: HomeFragment, private val view: View) {
    fun mostraConteudoUltimoCurso(comunicator: Comunicator?) {
        val sessaoUltimoCurso =
            view.findViewById<ConstraintLayout>(R.id.sessao_ultimo_curso_conteudo)
        sessaoUltimoCurso.removeAllViews()
        val conteudoUltimoCurso: ConstraintLayout
        val parametros: ConstraintLayout.LayoutParams
        if (CursosDAO.ultimoCurso == null) {
            conteudoUltimoCurso = layoutVazio
            parametros = layoutVazioParams
        } else {
            conteudoUltimoCurso = cardAula
            parametros = cardAulaParams
            configuraConteudoUltimoCurso(conteudoUltimoCurso)
            configuraAulaUltimoCurso(conteudoUltimoCurso)
            configuraClick(comunicator, conteudoUltimoCurso)
        }
        sessaoUltimoCurso.addView(conteudoUltimoCurso)
        configuraConstraints(parametros, conteudoUltimoCurso, sessaoUltimoCurso)
    }

    private fun configuraConstraints(
        parametros: ConstraintLayout.LayoutParams,
        conteudoUltimoCurso: ConstraintLayout,
        sessaoUltimoCurso: ConstraintLayout
    ) {
        parametros.startToStart = sessaoUltimoCurso.id
        parametros.endToEnd = sessaoUltimoCurso.id
        parametros.topToTop = sessaoUltimoCurso.id
        parametros.bottomToBottom = sessaoUltimoCurso.id
        conteudoUltimoCurso.layoutParams = parametros
    }

    // Helpers -------------------------------------------------------------------------------------
    private val layoutVazioParams: ConstraintLayout.LayoutParams
        get() {
            return ConstraintLayout.LayoutParams(
                ConstraintLayout.LayoutParams.WRAP_CONTENT,
                ConstraintLayout.LayoutParams.WRAP_CONTENT
            )
        }
    private val layoutVazio: ConstraintLayout
        get() = pegaLayout(R.layout.layout_ultimo_curso_vazio) as ConstraintLayout
    private val cardAula: ConstraintLayout
        get() = pegaLayout(R.layout.item_card_aula_ultimo_curso) as ConstraintLayout

    private fun configuraConteudoUltimoCurso(conteudoUltimoCurso: ConstraintLayout) {
        val titulo =
            conteudoUltimoCurso.findViewById<TextView>(R.id.item_card_aula_ultimo_curso_titulo)
        val professor =
            conteudoUltimoCurso.findViewById<TextView>(R.id.item_card_aula_ultimo_curso_professor)
        val imagem =
            conteudoUltimoCurso.findViewById<ImageView>(R.id.item_card_aula_ultimo_curso_imagem)
        titulo.text = CursosDAO.ultimoCurso?.titulo
        professor.text = String.format("Prof: %s", CursosDAO.ultimoCurso?.professor)
        CursosDAO.ultimoCurso?.setImagem(imagem)
    }

    private fun configuraAulaUltimoCurso(conteudoUltimoCurso: ConstraintLayout) {
        val tituloAula = conteudoUltimoCurso.findViewById<TextView>(R.id.item_aulas_curso_titulo)
        val subtituloAula =
            conteudoUltimoCurso.findViewById<TextView>(R.id.item_aulas_curso_descricao)
        val ultimaAula = CursosDAO.ultimoCurso?.let { CursosDAO.getUltimaAula(it) }
        if (ultimaAula != null) {
            tituloAula.text = ultimaAula.titulo
            subtituloAula.text = ultimaAula.subtitulo
        } else {
            tituloAula.setText(R.string.curso_sem_aula_titulo)
            subtituloAula.setText(R.string.curso_sem_aula_sub)
        }
    }

    private val cardAulaParams: ConstraintLayout.LayoutParams
        get() {
            return ConstraintLayout.LayoutParams(
                ConstraintLayout.LayoutParams.MATCH_PARENT,
                ConstraintLayout.LayoutParams.MATCH_PARENT
            )
        }

    private fun configuraClick(comunicator: Comunicator?, conteudoUltimoCurso: ConstraintLayout) {
        conteudoUltimoCurso.setOnClickListener { CursosDAO.ultimoCurso?.let { curso ->
            comunicator?.enviaCurso(
                curso
            )
        } }
    }

    private fun pegaLayout(layout: Int): View {
        return homeFragment.layoutInflater.inflate(layout, null)
    }
}