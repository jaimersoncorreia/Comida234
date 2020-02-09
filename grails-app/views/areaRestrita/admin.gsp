<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Area Restrica - Restaurante Comida234</title>
</head>
<body>
    <sec:ifLoggedIn>
        <p>Olá, ${usuario}</p>
        <a href="Comida234/j_spring_security_logout">Sair</a>
    </sec:ifLoggedIn>

    <sec:ifNotLoggedIn>
        <a href="logar.gsp">Entrar no sistema</a>
    </sec:ifNotLoggedIn>
</form>
</body>
</html>
