<table>
    <thead>
    <tr>
        <th colspan="3">Permissão</th>
    </tr>
    </thead>
    
    <tbody>
    <g:each in="${permissoes}" var="permissao">
        <tr>
            <td>${permissao.authority}</td>
            <td><a href="javascript: alterarPermissao(${permissao.id})">Alterar</a></td>
            <td><a href="javascript: excluirPermissao(${permissao.id})">Excluir</a></td>
        </tr>
    </g:each>
    </tbody>
</table>