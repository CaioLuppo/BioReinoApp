package br.fmu.bioreino.dao;

import java.util.ArrayList;

import br.fmu.bioreino.model.Aula;
import br.fmu.bioreino.model.Categoria;
import br.fmu.bioreino.model.Curso;

public class CursosDAO {

    /// Lista de todos os cursos que formos adicionar, simula um banco de dados
    private static final ArrayList<Curso> cursos = new ArrayList<>();
    public static Curso ultimoCurso;

    /// Retorna a lista de todos os cursos
    public static ArrayList<Curso> getCursos() {
        return cursos;
    }

    /// Adiciona um curso à lista estática
    public static void adicionaCurso(Curso curso) {
        cursos.add(curso);
    }

    /// Liste de categorias
    private static final ArrayList<Categoria> categorias = new ArrayList<>();

    public static void adicionaCategoria(Categoria categoria) {
        categorias.add(categoria);
    }

    public static ArrayList<Categoria> getCategorias() {
        return categorias;
    }

    /// Lista de aulas
    public static void setAulaVistaTrue(int aulaIndex, Curso curso) {
        cursos.get(cursos.indexOf(curso)).getAulas().get(aulaIndex).setAulaVista(true);
    }

    public static void setUltimaAula(int aulaIndex, Curso cursoInformado) {
        Curso curso = cursos.get(cursos.indexOf(cursoInformado));
        Aula aula = curso.getAulas().get(aulaIndex);
        curso.setUltimaAula(aula);
    }

    public static Aula getUltimaAula(Curso curso) {
        return cursos.get(cursos.indexOf(curso)).getUltimaAula();
    }


}
