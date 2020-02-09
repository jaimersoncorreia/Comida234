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
    </style>
    
    <script>
        $(document).ready(function () {
            carregarListaUsuarios()
        })
        
        function carregarListaUsuarios() {
            $.ajax({
                method: "POST",
                url: "listar",
                data: {},
                success:function (data) {
                    $("#divListaUsuario").html(data)
                    console.log(data)
                }
            })
        }
        
        function retornoSalvarUsuario(data) {
            console.log(data)
            if(data.mensagem != 'OK'){
                $("#divMensagemUsuario").html("Não foi possíveel salvar o usuário!")
                carregarListaUsuarios()
                return
            }
            $("#divMensagemUsuario").html("Usuário salvo com sucesso!")
            $("input[name=login]").val('')
            carregarListaUsuarios()
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
        <table>
            <thead>
                <tr>
                    <th>Permissão</th>
                </tr>
            </thead>
            
            <tbody>
                <g:each in="${permissoes}" var="permissao">
                    <tr>
                        <td>${permissao.authority}</td>
                    </tr>
                </g:each>
            </tbody>
        </table>
    </div>
</body>
</html>