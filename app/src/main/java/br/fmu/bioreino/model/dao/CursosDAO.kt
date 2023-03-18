package br.fmu.bioreino.model.dao

import br.fmu.bioreino.model.entities.Aula
import br.fmu.bioreino.model.entities.Categoria
import br.fmu.bioreino.model.entities.Curso

object CursosDAO {
    /// Retorna a lista de todos os cursos
    /// Lista de todos os cursos que formos adicionar, simula um banco de dados
    @JvmStatic
    val cursos = ArrayList<Curso>()
    @JvmField
    var ultimoCurso: Curso? = null

    /// Adiciona um curso à lista estática
    fun adicionaCurso(curso: Curso) {
        cursos.add(curso)
    }

    /// Liste de categorias
    val categorias = ArrayList<Categoria>()
    fun adicionaCategoria(categoria: Categoria) {
        categorias.add(categoria)
    }

    /// Lista de aulas
    @JvmStatic
    fun setAulaVistaTrue(aulaIndex: Int, curso: Curso) {
        cursos[cursos.indexOf(curso)].aulas[aulaIndex].setAulaVista(true)
    }

    @JvmStatic
    fun setUltimaAula(aulaIndex: Int, cursoInformado: Curso) {
        val curso = cursos[cursos.indexOf(cursoInformado)]
        val aula = curso.aulas[aulaIndex]
        curso.ultimaAula = aula
    }

    fun getUltimaAula(curso: Curso): Aula? {
        return cursos[cursos.indexOf(curso)].ultimaAula
    }
}