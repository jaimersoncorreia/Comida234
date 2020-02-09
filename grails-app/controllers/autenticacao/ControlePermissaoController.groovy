package autenticacao

import grails.converters.JSON

class ControlePermissaoController {

    def index() {
        render(view: "index")
    }

    def getUsuario(){

    }

    def getPermissao(){
        Permissao permissao = Permissao.get(params.id)
        render permissao as JSON
    }

    def listarPermissao(){
        def listaPermissao = Permissao.list(sort: "authority")
        render(template: "listaPermissoes", model:[permissoes: listaPermissao])
    }

    def salvarPermissao(){
        def retorno = [:]

        Permissao permissao = params.id ? Permissao.get(params.id) : new Permissao()

        permissao.authority = params.permissao
        permissao.validate()
        if(permissao.hasErrors()){
            retorno["mensagem"] = "ERRO"
            render retorno as JSON
            return
        }
        permissao.save(flush: true)
        retorno["mensagem"] = "OK"
        render retorno as JSON
    }

    def excluirUsuario(){

    }

    def excluirPermissao(){
        def retorno = [:]
        Permissao permissao = Permissao.get(params.id)
        try {
            permissao.delete(flush: true)
            retorno["mensagem"] = "OK"
        }catch(Exception ex){
            retorno["mensagem"] = "ERRO"
        }
        render retorno as JSON
    }

    def listarUsuario(){
        def listaUsuarios = Usuario.createCriteria().list {
            order("username",)
        }
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
