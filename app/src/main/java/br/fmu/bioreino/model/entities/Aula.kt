package br.fmu.bioreino.model.entities

class Aula(val titulo: String, val subtitulo: String) {
    var aulaFoiVista = false
        private set

    fun setAulaVista(aulaVista: Boolean) {
        aulaFoiVista = aulaVista
    }
}