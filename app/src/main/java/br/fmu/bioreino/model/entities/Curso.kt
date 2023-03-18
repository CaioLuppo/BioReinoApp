package br.fmu.bioreino.model.entities

import android.widget.ImageView
import com.squareup.picasso.Picasso
import java.io.Serializable

/// Modelo de curso
class Curso(// Identificador
    val id: Int,
    categoria: String,
    titulo: String,
    professor: String,
    plano: String,
    aulas: ArrayList<Aula>,
    linkImagem: String
) : Serializable {
    val categoria: String

    // Constantes para o card
    val titulo: String
    val professor: String
    private val linkImagem: String

    // Variáveis de progresso
    private val etapas: Int
    private var etapaAtual = 0.0

    // Aulas do curso
    val plano: String
    val aulas: ArrayList<Aula>
    var ultimaAula: Aula?

    init {
        this.categoria = categoria.lowercase()
        this.titulo = titulo
        this.professor = professor
        etapas = aulas.size
        this.plano = plano
        this.aulas = aulas
        ultimaAula = if (aulas.size > 0) aulas[0] else null
        this.linkImagem = linkImagem
    }

    val progresso: Int
        get() = Math.round(etapaAtual / etapas * 100).toInt()

    fun adicionaProgresso() {
        if (etapaAtual <= etapas) etapaAtual++
    }

    fun setImagem(target: ImageView?) {
        Picasso.get().load(linkImagem).into(target)
    }
}