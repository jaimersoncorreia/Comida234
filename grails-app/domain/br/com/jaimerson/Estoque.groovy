package br.com.jaimerson

class Estoque {
//    o id é automático para grails, ou seja, é implícito
//    Integer id
    Integer quantidade
    Integer quantidadeMinima

    Produto produto

    static constraints = {
        quantidade min: 0
        quantidadeMinima min: 0
        produto nullable: false
    }

    static mapping = {
        produto column: "id_produto"
    }
}