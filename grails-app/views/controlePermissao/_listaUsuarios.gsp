<table>
    <thead>
        <tr><th colspan="3">Nome do Usuário</th></tr>
    </thead>
    <tbody>
        <g:each in="${usuarios}" var="usuario">
            <tr>
                <td>${usuario.username}</td>
                <td><a href="javascript: alterarUsuario(${usuario.id})">Alterar</a></td>
                <td><a href="javascript: excluirUsuario(${usuario.id})">Excluir</a></td>
            </tr>
        </g:each>
    </tbody>
</table>