# Manejo de Permisos a Nivel de Usuarios

## ¿Qué es?

El manejo de permisos a nivel de usuario en una base de datos implica la asignación de derechos y privilegios específicos a diferentes usuarios o roles dentro del sistema. Estos permisos determinan qué acciones pueden realizar los usuarios, como leer, escribir, actualizar o eliminar datos. Por ejemplo, un administrador puede tener permisos completos, mientras que un recepcionista solo puede registrar citas y actualizar información de contacto de los dueños.

## Importancia y Uso
En el contexto de la clínica veterinaria, el manejo de permisos a nivel de usuario es crucial por varias razones:

### Seguridad:
Al asignar permisos específicos, se protege la integridad y confidencialidad de la información. Solo los usuarios autorizados pueden acceder a datos sensibles, como historiales médicos de las mascotas o información personal de los dueños.

### Control de Acceso: 
Permite definir claramente quién puede realizar ciertas acciones dentro de la base de datos. Por ejemplo, solo los veterinarios pueden actualizar los registros de tratamientos y diagnósticos, mientras que el personal administrativo puede gestionar las citas y la información de contacto.

### Prevención de Errores: 
Al limitar los permisos, se reduce el riesgo de errores accidentales. Por ejemplo, un usuario con permisos limitados no podrá eliminar registros importantes por error.

### Auditoría y Cumplimiento: 
Facilita el seguimiento de las acciones realizadas por cada usuario, lo que es esencial para auditorías y para cumplir con regulaciones de privacidad y protección de datos.

## Desarrollo del tema/Resultados
como primera intancion creamos dos usuarios de base de datos los cuales se van a ocupar para realizar las pruebas en cada uno 

![CreacionDeUsuarios](https://github.com/user-attachments/assets/be9a42f2-0056-4f80-a886-70ef77b3d87b)

Una vez realizado eso tenemos que asignarle a cada usuario que permisos tendra cada uno, el usuario administrador tendra el acceso total a toda la base de dato en cambio el otro usuario solo podra realizar lecturas 

![AsignacionPermisosUsuarios](https://github.com/user-attachments/assets/df5dc0a6-0907-453f-a66c-0e1f86139b91)

Cuando ya tenemos cada usuario con sus respectivos permisos, Utilizaremos un procedimientos almacenados creados anteriormente, este se utilizara para otorgar el permiso de ejecución del procedimiento al usuario lectura_usuario.

![ProcedimientoAlmacenado](https://github.com/user-attachments/assets/809e8b32-08c4-4c37-a40f-f363116c111e)

### Prueba en cada Usuarios
Realizamos las pruebas en cada usuarios, en cada unos tratamos de insertar datos en la tabla dueño, en el usuario adminsitrador nos permite poder insertar ese dueño lo cual esta correcto devido a los permisos que les asignamos en cambio a usuario que solo le permitimos la lectura me meustra un mensaje de error diciendome que no tiene esso permisos para ralizar esa insercion 
