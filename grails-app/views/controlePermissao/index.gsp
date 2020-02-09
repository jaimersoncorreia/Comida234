<!doctype html>
<html lang="pt-BR">
<head>
    <meta name="layout" content="main"/>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Controle Permissão</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <style>
        #divUsuario{
            width: 30%;
            float: left;
            border: 1px solid #000000;
            margin: 5px;
        }
        #divPermissoes{
            width: 30%;
            float: right;
            border: 1px solid #ffcc00;
            margin: 5px;
        }
        #divDetalhesUsuario{
            width: 35%;
            float: left;
            border: 1px solid #000000;
            margin: 5px;
        }
        #divFormUsuario{
            padding: 5px;
        }
        #divFormPermissao{
            padding: 5px;
        }
    </style>
    
    <script>
        $(document).ready(function () {
            carregarListaUsuarios()
            carregarListaPermissao()
        })
        
        function carregarListaUsuarios() {
            $.ajax({
                method: "POST",
                url: "listarUsuario",
                data: {},
                success:function (data) {
                    $("#divListaUsuario").html(data)
                }
            })
        }
        
        function retornoSalvarUsuario(data) {
            if(data.mensagem != 'OK'){
                $("#divMensagemUsuario").html("Não foi possíveel salvar o usuário!")
                carregarListaUsuarios()
                return
            }
            $("#divMensagemUsuario").html("Usuário salvo com sucesso!")
            $("input[name=login]").val('')
            carregarListaUsuarios()
        }
        
        function carregarListaPermissao() {
            $.ajax({
                method: "POST",
                url: "listarPermissao",
                data: {},
                success: function (data) {
                    $("#divListaPermissao").html(data)
                }
            })
        }
        
        function retornoSalvarPermissao(data){
            if(data.mensagem != 'OK'){
                $('#divMensagemPermissao').html('Não foi possível salvar a permissão!')
                carregarListaPermissao()
                return
            }
            $('#divMensagemPermissao').html("Permissao salva com sucesso")
            carregarListaPermissao()
            $("#formPermissao input[name=permissao]").val("")
            $("#formPermissao input[name=id]").val("")
        }
        
        function alterarPermissao(id) {
            $.ajax({
                method: "POST",
                url: "getPermissao",
                data: {"id":id},
                success:function (data) {
                    // $("form[name=formPermissao]").find( "input[name=permissao]").val(data.authority)
                    $("#formPermissao input[name=permissao]").val(data.authority)
                    $("#formPermissao input[name=id]").val(data.id)
                }
            })
        }
        
        function excluirPermissao(id) {
            if(confirm("Deseja realmente excluir a permissao?")){
                $.ajax({
                    method:"POST",
                    url:"excluirPermissao",
                    data:{"id":id},
                    success: function (data) {
                        data.mensagem == "OK"?carregarListaPermissao():$("#divMensagemPermissao").html("Não foi possível excluir")
                        console.log(data)
                    }
                })
            }
        }
    </script>
</head>

<body>
    <div id="divUsuario">
        <div id="divFormUsuario">
            <div id="divMensagemUsuario"></div>
            <g:formRemote name="formUsuario" url="[controller:'controlePermissao', action:'salvarUsuario']" onSuccess="retornoSalvarUsuario(data)">
                <label>Login:</label><input type="text" name="login" value=""/>
                <input type="submit" name="salvar" value="Salvar"/>
            </g:formRemote>
        </div>
        <div id="divListaUsuario"></div>
    </div>

    
    
    <div id="divDetalhesUsuario"></div>

    <div id="divPermissoes">
        <div id="divFormPermissao">
            <div id="divMensagemPermissao"></div>
            <g:formRemote id="formPermissao" name="formPermissao" url="[controller:'controlePermissao', action:'salvarPermissao']" onSuccess="retornoSalvarPermissao(data)">
                <label>Permissao:</label><input type="text" name="permissao" value=""/>
                <input type="hidden" name="id"/>
                <input type="submit" name="salvar" value="Salvar"/>
            </g:formRemote>
        </div>
        
        <div id="divListaPermissao"></div>
    </div>
</body>
</html>