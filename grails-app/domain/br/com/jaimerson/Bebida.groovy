package br.com.jaimerson

class Bebida {

    Integer liquido
    String unidade

    static constraints = {
        liquido min: 0
        unidade nullable: false, blank: false, inList: ["l","ml"]
    }
}
