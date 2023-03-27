package br.fmu.bioreino.model.interfaces

interface MongodbObject {

    fun toJsonMap(): Map<String, Any>

}