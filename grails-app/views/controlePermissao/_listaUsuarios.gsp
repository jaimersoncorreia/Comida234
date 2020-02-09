<table>
    <thead>
        <tr><th>Nome do Usuário</th></tr>
    </thead>
    <tbody>
        <g:each in="${usuarios}" var="usuario">
            <tr><td>${usuario.username}</td></tr>
        </g:each>
    </tbody>
</table>