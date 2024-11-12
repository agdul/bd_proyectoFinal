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

### Manejo de permisos a nivel de usuarios

como primera intancion creamos dos usuarios de base de datos (admin_usuario,lectura_usuario) 

![CreacionDeUsuarios](https://github.com/user-attachments/assets/be9a42f2-0056-4f80-a886-70ef77b3d87b)

Una vez realizado eso tenemos que asignarle a cada usuario que permisos tendra cada uno, el usuario administrador tendra el acceso total a toda la base de dato en cambio el otro usuario solo podra realizar lecturas 

![AsignacionPermisosUsuarios](https://github.com/user-attachments/assets/df5dc0a6-0907-453f-a66c-0e1f86139b91)

Cuando ya tenemos cada usuario con sus respectivos permisos, Utilizaremos un procedimientos almacenados creados anteriormente, este se utilizara para otorgar el permiso de ejecución del procedimiento al usuario lectura_usuario.

![ProcedimientoAlmacenado](https://github.com/user-attachments/assets/809e8b32-08c4-4c37-a40f-f363116c111e)

Prueba en cada Usuarios

Realizamos las pruebas en cada usuarios, en cada unos tratamos de insertar datos en la tabla dueño, en el usuario adminsitrador nos permite poder insertar ese dueño lo cual esta correcto devido a los permisos que les asignamos, en cambio al usuario que solo le permitimos la lectura me muestra un mensaje de error diciendo que se denegó el permiso de inserción en el objeto dueño.

Prueba en admin_usuario
![EjecutarComoAdmin](https://github.com/user-attachments/assets/6cd80795-4630-475b-9e2a-b22d90d88a50)

prueba en lectura_usuario
![EjecutarComoLectura](https://github.com/user-attachments/assets/08ccaba9-405c-42ef-8ca6-a4cd107731d3)

Despues ejecutamos el procedimiento almaceda en el usuario de lectura y realizo adecuadamente , ya que se le otorgó el permiso de ejecución.

![EjecutarComoLectura](https://github.com/user-attachments/assets/7bbac674-ee9a-4091-b581-d9926dc4f980)

### Manejo de permisos a nivel de Rol

Para Realizar tambien el manejo de permisos con roles creamos dos usuarios(user_role1,user_role2), ademas de eso tambien se creo un rol que solo permita la lectura de alguna de las tablas creadas, la cual se ocupara para dar permiso a uno de los usuarios.

![CrearUsuarioYAsignacionPermisosRoles](https://github.com/user-attachments/assets/85d45d6a-5e0f-41aa-a3d0-db1664be1328)

Despues Realizamos las pruebas en cada usuario donde en cada uno se realizo un select donde me traiga todos los datos de la tabla dueño, en donde en el user_role1 nos ejecuto correctamente y nos mostro todo los datos de la tabla dueño, en cambio en el user_role2 nos mostro un mensaje de error diciendo que se denegó el permiso.

Prueba en user_role1

![ConectarRoles1](https://github.com/user-attachments/assets/34f15031-4bb9-481e-98c7-b585f87aa4d6)

Prueba en user_role2

![ConectarRoles2](https://github.com/user-attachments/assets/83fbec4c-4c6e-4e93-bccb-99f7a04a623e)

### Conclusiones Basadas en las Pruebas

-El usuario con permisos de administrador (admin_usuario) puede realizar todas las operaciones de lectura y escritura, tanto directamente en las tablas como mediante procedimientos almacenados.

-El usuario con solo permisos de lectura (lectura_usuario) no puede insertar datos directamente en las tablas, pero puede ejecutar procedimientos almacenados si se le han concedido permisos explícitos de ejecución.

-Los usuarios que pertenecen a un rol con permisos restringidos solo pueden realizar operaciones que el rol permite. user_role1, que tiene el rol RolSoloLectura, puede consultar la tabla dueno, mientras que user_role2 no puede acceder a esta tabla.




