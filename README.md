# **Documentación del archivo JSP: index.jsp**

El archivo `index.jsp` es una página JSP (JavaServer Pages) que representa la página de inicio de la aplicación ShareCare. Proporciona la estructura básica de la página y enlaces a otras secciones del sitio.

A continuación se presenta una descripción de las secciones principales del archivo:

1. Importaciones:

```jsp
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page import="com.daw1.ong01.HelloServlet" %>
```

En esta sección, se importan las clases necesarias para realizar operaciones de base de datos (`java.sql.Connection`, `java.sql.Statement` y `java.sql.ResultSet`) y también se importa la clase `HelloServlet` del paquete `com.daw1.ong01`. Estas importaciones permiten el acceso a funcionalidades específicas que se utilizan en el archivo.

2. Configuración y cabecera de la página:

```jsp
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

    <title>ShareCare - Index</title>
    <link rel="stylesheet" href="estilo.css">
</head>
<body>
```

Esta sección define la configuración y cabecera de la página. Configura la codificación de caracteres como UTF-8 y establece el lenguaje como Java. Luego, se incluye el código necesario para cargar los estilos de Bootstrap, utilizando enlaces a los archivos CSS y JavaScript correspondientes. Además, se establece el título de la página como "ShareCare - Index" y se vincula el archivo CSS "estilo.css".

3. Contenido de la página:

```jsp
<div id="container">
    <header>
        <div class="logo">
            <a href="index.jsp"><img src="imagen/solidarity.avif" alt=""></a>
            <a href="index.jsp"><h1>ShareCare</h1></a>
        </div>
        <nav>
            <a href="profile.jsp" class="nav-link">Lorem.</a>
            <a href="" class="nav-link">Fugiat.</a>
            <a href="" class="nav-link">Quam?</a>
            <a href="" class="nav-link">Placeat!</a>
            <a href="login.jsp" class="log-in">Log In</a>
            <a href="registro.jsp" class="register">Register</a>
        </nav>
    </header>
    <article>

    </article>
</div>
```

Esta sección representa el contenido principal de la página. Contiene un contenedor (`<div id="container">`) que engloba el encabezado y el artículo.

- Encabezado (`<header>`): Incluye el logotipo de ShareCare y un título enlazado a la página de inicio. También contiene una barra de navegación con enlaces a diferentes secciones del sitio, como "Lorem", "Fugiat", "Quam" y "Placeat". Además, se proporcionan enlaces para iniciar sesión y registrarse.
- Artículo (`<article>`): Este elemento es el espacio reservado para el contenido específico de la página. No contiene contenido en el código proporcionado.

4. Scripts al final de la página:

```jsp
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
```

En esta sección, se incluyen los scripts de jQuery y Bootstrap  necesarios para el funcionamiento de los complementos JavaScript de  Bootstrap. Los archivos JavaScript se enlazan desde las rutas `js/jquery.min.js` y `js/bootstrap.min.js`.