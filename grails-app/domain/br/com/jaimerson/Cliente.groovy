package br.com.jaimerson

import com.sun.xml.internal.stream.StaxErrorReporter

class Cliente {

    String nome
    String email
    String senha

    static hasMany = [pedidos:Pedido, produtosPreferidos:Produto]

    static constraints = {
        nome nullable: false,blank: false
        email email: true, unique: true
        senha size: 6..10
    }

    static mapping = {
        /*
        *   Nome da Tabela: preferencias_clientes
        *   Nome de Referência dessa tabela: id_cliente
        *   Nome de Referência da tabela Produto: id_produto
        * */
        produtosPreferidos joinTable: [name:"preferencias_clientes", key:"id_cliente", column: "id_produto"]
    }
}
