package autenticacao

import grails.converters.JSON

class ControlePermissaoController {

    def index() {
        def listaPermissao = Permissao.list()
        render(view: "index", model:[permissoes: listaPermissao])
    }

    def listar(){
        def listaUsuarios = Usuario.list()
        render(template: "listaUsuarios", model: [usuarios: listaUsuarios])
    }

    def salvarUsuario(){
        def retorno = [:]
        Usuario usuario = new Usuario()
        usuario.username = params.login
        usuario.enabled = true
        usuario.passwordExpired = false
        usuario.accountExpired = false
        usuario.accountLocked = false
        usuario.password = "1234"
        usuario.validate()
        if(usuario.hasErrors()){
            retorno["mensagem"] = "ERRO"
            render retorno as JSON
            return
        }
        usuario.save(flush: true)
        retorno["mensagem"] = "OK"
        render retorno as JSON
    }
}
