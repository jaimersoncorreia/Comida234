package br.com.jaimerson

class Produto {

    String nome
    Double preco

    Estoque estoque

    static hasMany = [clientes: Cliente, itens: ItemPedido]

    static belongsTo = [Cliente]

    static constraints = {
        nome nullable: false, blank: false
        preco min: new Double(0)
    }

    static mapping = {
        estoque column: "id_estoque"
        /*
        *   Nome da Tabela: preferencias_clientes
        *   Nome de Referência dessa tabela: id_produto
        *   Nome de Referência da tabela Cliente: id_cliente
        * */
        clientes joinTable: [name:"preferencias_clientes", key:"id_produto", column: "id_cliente"]
    }
}
