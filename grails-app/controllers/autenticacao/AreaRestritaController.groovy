package autenticacao

class AreaRestritaController {

    def springSecurityService

    def index() { }

    def logar(){
        render(view: "/areaRestrita/logar")
    }

    def admin(){
        String usuario = springSecurityService.principal.username
        render(view: "/areaRestrita/admin", model: [usuario:usuario])
    }

    def logout(){
        redirect(action: "logar")
    }
}
