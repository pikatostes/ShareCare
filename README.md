# Documentación del Proyecto ShareCare

El principal objetivo del proyecto era crear una plataforma llamada ShareCare en la que los usuarios pueden registrarse, escribir una petición y otro usuario con conocimientos en la materia puede aceptarla. Es una página orientada a personas mayores.

## Objetivo del Proyecto

El objetivo principal del proyecto era desarrollar ShareCare, una plataforma donde los usuarios pueden registrarse, crear solicitudes de ayuda y otros usuarios con habilidades relevantes pueden aceptar y proporcionar asistencia. El enfoque de la plataforma es brindar apoyo a personas mayores.

## Lenguajes Utilizados

Los lenguajes de programación utilizados en el proyecto, en orden de mayor presencia en el código, son:

- JSP (Java Server Pages): Para la lógica del servidor y la generación de contenido dinámico.
- CSS (Cascading Style Sheets): Para el diseño y la presentación visual de las páginas web.
- HTML (HyperText Markup Language): Para la estructura y el marcado de las páginas web.
- JavaScript: Para agregar interactividad y funcionalidades adicionales en el cliente.

## Componentes Principales

Los componentes principales del proyecto son:

- <a href="src/main/webapp/index.jsp">`index.jsp`</a>: Página de inicio que muestra una descripción general de la plataforma y enlaces relevantes.
- <a href="src/main/webapp/login.jsp">`login.jsp`</a>: Página de inicio de sesión donde los usuarios pueden ingresar sus credenciales para acceder a su cuenta.
- <a href="src/main/webapp/registro.jsp">`registro.jsp`</a>: Página de registro donde los nuevos usuarios pueden crear una cuenta en la plataforma.
- <a href="src/main/webapp/profile.jsp">`profile.jsp`</a>: Página de perfil de usuario que muestra información personal y permite editarla.
- <a href="src/main/webapp/request.jsp">`request.jsp`</a>: Página donde los usuarios pueden crear y enviar solicitudes de ayuda.
- <a href="src/main/webapp/admin/admin.jsp">`admin.jsp`</a>: Página de administrador para gestionar el sitio y las solicitudes de ayuda.
- <a href="src/main/webapp/admin/requests.jsp">`requests.jsp`</a>: Página que muestra todas las solicitudes de ayuda recibidas.

## Clases

Las clases creadas para el proyecto son las siguientes:
- <a href="src/main/java/com/daw1/ong01/User.java">`User.java`</a>: clase no implementada por errores
- <a href="src/main/java/com/daw1/ong01/Request.java">`Request.java`</a>: representa una solicitud con sus atributos y métodos asociados
- <a href="src/main/java/com/daw1/ong01/Requests.java">`Requests.java`</a>: proporciona métodos estáticos para interactuar con la base de datos y realizar operaciones relacionadas con las solicitudes
- <a href="src/main/java/com/daw1/ong01/UserDB.java">`UserDB.java`</a>: proporciona un método estático para insertar un nuevo usuario en la base de datos. (podriamos haberlo incluido en la clase usuario pero ésta erraba)

## Base de Datos

Se utilizó SQLite como sistema de gestión de bases de datos y se creó la base de datos llamada <a href="project.db">`project.db`</a> y se crearon las siguientes tablas:

- Tabla `Requests`:
        La tabla `Requests` almacena las solicitudes de ayuda realizadas por los usuarios.
        Tiene las siguientes columnas:
    
    ```sqlite
    create table Requests
    (
        ID          integer
            primary key autoincrement,
        skill       INTEGER
            references Skill,
        User        TEXT,
        Description TEXT,
        Date        DATE,
        accepted    BOOLEAN,
        contributor TEXT
    );
    ```

    1. `ID`: Es una columna de tipo entero que actúa como identificador único de cada solicitud. Se genera automáticamente con la opción `primary key autoincrement`.
    
    2. `skill`: Es una columna de tipo entero que hace referencia a la tabla `Skill`. Indica la habilidad asociada a la solicitud.
    
    3. `User`: Es una columna de tipo texto que almacena el nombre del usuario que realizó la solicitud.
    
    4. `Description`: Es una columna de tipo texto que contiene la descripción de la solicitud.
    
    5. `Date`: Es una columna de tipo fecha que registra la fecha en que se realizó la solicitud.
    
    6. `accepted`: Es una columna de tipo booleano que indica si la solicitud ha sido aceptada o no.
    
    7. `contributor`: Es una columna de tipo texto que almacena el nombre del usuario que acepta la solicitud y proporciona la ayuda.
    
- Tabla `Skill`:
        La tabla `Skill` almacena las habilidades disponibles para las solicitudes.
        Tiene las siguientes columnas:

    ```sqlite
    create table Skill
    (
        id   INTEGER
            primary key,
        name TEXT
    );
    ```

    1. `id`: Es una columna de tipo entero que actúa como identificador único de cada habilidad.

    2. `name`: Es una columna de tipo texto que contiene el nombre de la habilidad.

- Tabla `User`:
        La tabla `User` almacena la información de los usuarios registrados en la plataforma.
        Tiene las siguientes columnas:

    ```sqlite
    create table User
    (
        id          INTEGER
            primary key autoincrement,
        userName    TEXT,
        password    TEXT,
        name        TEXT,
        phone       TEXT,
        email       TEXT,
        skill       INTEGER
            references Skill,
        contributor BOOLEAN
    );
    ```

    1. `id`: Es una columna de tipo entero que actúa como identificador único de cada usuario. Se genera automáticamente con la opción `primary key autoincrement`.
    2. `userName`: Es una columna de tipo texto que almacena el nombre de usuario.
    3. `password`: Es una columna de tipo texto que almacena la contraseña del usuario.
    4. `name`: Es una columna de tipo texto que guarda el nombre del usuario.
    5. `phone`: Es una columna de tipo texto que almacena el número de teléfono del usuario.
    6. `email`: Es una columna de tipo texto que guarda la dirección de correo electrónico del usuario.
    7. `skill`: Es una columna de tipo entero que hace referencia a la tabla "Skill". Indica la habilidad asociada al usuario.
    8. `contributor`: Es una columna de tipo booleano que indica si el usuario es un colaborador o no.


### Diagrama de la base de datos
| User       |                             | Requests   |                     | Skill     |
|------------|-----------------------------|------------|---------------------|-----------|
| id         | --------- < 1:N > --------> | ID         | --------- < 1:1 > --------> | id        |
| userName   |                             | skill      |                     | name      |
| password   |                             | User       |                     |           |
| name       |                             | Description|                     |           |
| phone      |                             | Date       |                     |           |
| email      |                             | accepted   |                     |           |
| skill      | ----- < references > ---->  | contributor|                     |           |
| contributor|

## Funcionalidades Principales

Las principales funcionalidades del proyecto incluyen:

- Registro de usuarios: Los usuarios pueden crear una cuenta en la plataforma.
- Inicio de sesión: Los usuarios pueden ingresar a su cuenta con sus credenciales.
- Creación de solicitudes de ayuda: Los usuarios pueden crear solicitudes de ayuda especificando la categoría y descripción.
- Aceptación de solicitudes: Otros usuarios con habilidades relevantes pueden aceptar y proporcionar ayuda para las solicitudes.
- Edición de perfil: Los usuarios pueden ver y editar su información personal y de contacto en su perfil.
- Eliminación de solicitudes: Los usuarios pueden eliminar sus solicitudes de ayuda.
- Administración de la página: Los administradores pueden acceder a un panel de administración para gestionar las solicitudes y otras funcionalidades del sitio.

## Ejecución del Proyecto

Para ejecutar el proyecto, se recomienda seguir estos pasos:

1. Descarga o clona el repositorio de GitHub.
2. Configura un servidor web compatible con Java Servlets y JSP, como Tomcat o TomEE.
3. Despliega la aplicación en el servidor web.
4. Accede a la plataforma ShareCare a través del navegador web.

Ten en cuenta que estos pasos son una guía general y pueden variar dependiendo de tu entorno de desarrollo y configuración específica.
