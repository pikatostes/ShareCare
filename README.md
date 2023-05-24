# Documentación del Proyecto ShareCare

El principal objetivo del proyecto era crear una plataforma llamada ShareCare en la que los usuarios pueden registrarse, escribir una petición y otro usuario con conocimientos en la materia puede aceptarla. Es una página orientada a personas mayores.

## Objetivo del Proyecto

El objetivo principal del proyecto era desarrollar ShareCare, una plataforma donde los usuarios pueden registrarse, crear solicitudes de ayuda y otros usuarios con habilidades relevantes pueden aceptar y proporcionar asistencia. El enfoque de la plataforma es brindar apoyo a personas mayores.

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

Se han creado dos clases diferentes:
- <a href="">`User.java`</a>:

## Lenguajes Utilizados

Los lenguajes de programación utilizados en el proyecto, en orden de mayor presencia en el código, son:

- JSP (Java Server Pages): Para la lógica del servidor y la generación de contenido dinámico.
- CSS (Cascading Style Sheets): Para el diseño y la presentación visual de las páginas web.
- HTML (HyperText Markup Language): Para la estructura y el marcado de las páginas web.
- JavaScript: Para agregar interactividad y funcionalidades adicionales en el cliente.

## Base de Datos

Se utilizó SQLite como sistema de gestión de bases de datos y se crearon las siguientes tablas:

- `requests`: Almacena las solicitudes de ayuda creadas por los usuarios.
- `skill`: Contiene los tipos de habilidades disponibles para las solicitudes.
- `user`: Almacena la información de los usuarios registrados en la plataforma.

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
