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

- <a href="">`index.jsp`</a>: Página de inicio que muestra una descripción general de la plataforma y enlaces relevantes.
- `login.jsp`: Página de inicio de sesión donde los usuarios pueden ingresar sus credenciales para acceder a su cuenta.
- `register.jsp`: Página de registro donde los nuevos usuarios pueden crear una cuenta en la plataforma.
- `profile.jsp`: Página de perfil de usuario que muestra información personal y permite editarla.
- `request.jsp`: Página donde los usuarios pueden crear y enviar solicitudes de ayuda.
- `admin.jsp`: Página de administrador para gestionar el sitio y las solicitudes de ayuda.
- `requests.jsp`: Página que muestra todas las solicitudes de ayuda recibidas.

## Clases

Las clases creadas para el proyecto son las siguientes:
- <a href="src/main/java/com/daw1/ong01/User.java">`User.java`</a>: clase no implementada por errores
- <a href="src/main/java/com/daw1/ong01/Request.java">`Request.java`</a>: representa una solicitud con sus atributos y métodos asociados
- <a href="src/main/java/com/daw1/ong01/Requests.java">`Requests.java`</a>: proporciona métodos estáticos para interactuar con la base de datos y realizar operaciones relacionadas con las solicitudes
- <a href="src/main/java/com/daw1/ong01/UserDB.java">`UserDB.java`</a>: proporciona un método estático para insertar un nuevo usuario en la base de datos. (podriamos haberlo incluido en la clase usuario pero ésta erraba)

## Base de Datos

Se utilizó SQLite como sistema de gestión de bases de datos y se crearon las siguientes tablas:

- Tabla "Requests":
        La tabla "Requests" almacena las solicitudes de ayuda realizadas por los usuarios.
        Tiene las siguientes columnas:
            - "ID": Es una columna de tipo entero que actúa como identificador único de cada solicitud. Se genera automáticamente con la opción "primary key autoincrement".
            - "skill": Es una columna de tipo entero que hace referencia a la tabla "Skill". Indica la habilidad asociada a la solicitud.
            - "User": Es una columna de tipo texto que almacena el nombre del usuario que realizó la solicitud.
            - "Description": Es una columna de tipo texto que contiene la descripción de la solicitud.
            - "Date": Es una columna de tipo fecha que registra la fecha en que se realizó la solicitud.
            - "accepted": Es una columna de tipo booleano que indica si la solicitud ha sido aceptada o no.
            - "contributor": Es una columna de tipo texto que almacena el nombre del usuario que acepta la solicitud y proporciona la ayuda.

- Tabla "Skill":
        La tabla "Skill" almacena las habilidades disponibles para las solicitudes.
        Tiene las siguientes columnas:
            "id": Es una columna de tipo entero que actúa como identificador único de cada habilidad.
            "name": Es una columna de tipo texto que contiene el nombre de la habilidad.

- Tabla "User":
        La tabla "User" almacena la información de los usuarios registrados en la plataforma.
        Tiene las siguientes columnas:
            "id": Es una columna de tipo entero que actúa como identificador único de cada usuario. Se genera automáticamente con la opción "primary key autoincrement".
            "userName": Es una columna de tipo texto que almacena el nombre de usuario.
            "password": Es una columna de tipo texto que almacena la contraseña del usuario.
            "name": Es una columna de tipo texto que guarda el nombre del usuario.
            "phone": Es una columna de tipo texto que almacena el número de teléfono del usuario.
            "email": Es una columna de tipo texto que guarda la dirección de correo electrónico del usuario.
            "skill": Es una columna de tipo entero que hace referencia a la tabla "Skill". Indica la habilidad asociada al usuario.
            "contributor": Es una columna de tipo booleano que indica si el usuario es un colaborador o no.

## Funcionalidades Principales

Las principales funcionalidades del proyecto incluyen:

- Registro de usuarios: Los usuarios pueden crear una cuenta en la plataforma.
- Inicio de sesión: Los usuarios pueden ingresar a su cuenta con sus credenciales.
- Creación de solicitudes de ayuda: Los usuarios pueden crear solicitudes de ayuda especificando la categoría y descripción.
- Aceptación de solicitudes: Otros usuarios con habilidades relevantes pueden aceptar y proporcionar ayuda para las solicitudes.
- Edición de perfil: Los usuarios pueden ver y editar su información personal y de contacto en su perfil.
- Eliminación de solicitudes: Los usuarios pueden eliminar sus solicitudes de ayuda.
- Administración de la página: Los administradores pueden acceder a un panel de administración para gestionar las solicitudes y otras funcionalidades del sitio.

## Comentario sobre el Código

El código proporcionado muestra un fragmento en JSP que maneja la autenticación de usuarios. Sin embargo, es recomendable mejorar el enfoque de seguridad en el almacenamiento de contraseñas utilizando técnicas de hashing y salting. Esto ayudará a proteger la información confidencial de los usuarios.

En cuanto a la gestión de errores, el código muestra un manejo básico de excepciones al conectar con la base de datos y redireccionar al usuario en caso de autenticación exitosa o fallida. Solo se muestra información de error al usuario en caso de errores de conexión con la base de datos.

## Ejecución del Proyecto

Para ejecutar el proyecto, se recomienda seguir estos pasos:

1. Descarga o clona el repositorio de GitHub.
2. Configura un servidor web compatible con Java Servlets y JSP, como Tomcat o TomEE.
3. Despliega la aplicación en el servidor web.
4. Accede a la plataforma ShareCare a través del navegador web.

Ten en cuenta que estos pasos son una guía general y pueden variar dependiendo de tu entorno de desarrollo y configuración específica.
