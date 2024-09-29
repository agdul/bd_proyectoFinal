
# PRESENTACIÓN: Sistema de Gestion de Informacion para Clinica Veterinaria

**Asignatura**: Bases de Datos I (FaCENA-UNNE)

**Integrantes**:
 - Beck, Pablo 
 - Belucci, Lautaro
 - Hamm, Abdul
 - Silva, Estela Maris

**Año**: 2024

# Indice
- **Capítulo I:** Introducción
- **Capítulo II:** Marco Conceptual o Referencial
- **Capítulo III:** Metodología
- **Capítulo IV:** Desarrollo del Tema/Resultados
- **Capítulo V:** Conclusiones
- **Capítulo VI:** Bibliografía

## CAPÍTULO I: INTRODUCCIÓN
### *Caso de estudio*

Una clínica veterinaria desea implementar una base de datos para gestionar la información de
sus pacientes (mascotas), dueños, citas médicas y tratamientos.<br>

- Cada mascota tiene un código único de identificación. Se desea almacenar el nombre,
especie (perro, gato, ave, etc.), raza, fecha de nacimiento, peso y cualquier condición
médica especial en caso de existir. Ej: Alérgico a droga (Nombre droga)<br>
- Los dueños de las mascotas son registrados con un número de identificación único.
Además, se almacenan datos personales como DNI, nombre, dirección, teléfono y
correo electrónico.<br>
- Las citas medicas son espontaneas y se registran al momento de la visita de la mascota
a la veterinaria.<br>
- Se registra el motivo de la cita, el veterinario asignado y cualquier observación posterior
a la cita. Una cita está asociada a una única mascota y a un único veterinario.<br>
- De cada veterinario se desea guardar su número de licencia profesional, nombre
completo, especialidad (si la tiene, por ejemplo, ortopedia, oftalmología, etc.) y horario
de atención.<br>
- Si a una mascota se le prescribe un tratamiento, se desea registrar el nombre del
tratamiento, duración, Medicamentos indicados y cualquier otra indicación relevante.<br>
- El tratamiento, en caso de existir, debe estar asociado a una cita.<br>
- En una misma cita, el veterinario puede indicar mas de un tratamiento.<br>
- Un tratamiento debe permitir la aplicación de varios medicamentos<br>
- De los medicamentos se necesita conocer: Nombre comercial, monodroga, presentación
y laboratorio que lo comercializa.<br>

Se deben considerar las siguientes restricciones en el diseño físico:<br>
- La longitud del campo ‘dni’ debe ser igual o menor a 8 caracteres<br>
- El campo ‘correo_electronico’ debe ser un valor único.<br>
- El campo ‘fecha’ por defecto toma la fecha actual.<br>
- La edad de la mascota no puede superar los 30 años.<br>
- Se debe registrar en forma automática la fecha del sistema y usuario de base de datos
que crean los registros de citas. Agregar estos dos campos a la tabla.<br>

### Tema: Implementacion de una Base de datos para la Gestion de una Clinica Veterinaria.

**Definicion del Problema:** La clínica veterinaria necesita una solución para gestionar eficientemente la información de sus pacientes, dueños, citas médicas y tratamientos.<br>

### *Objetivo del Trabajo Práctico (qué se va a hacer)*
**Objetivo General:** Desarrollar una base de datos que permita la gestión integral de la información en una clínica veterinaria.<br>
**Objetivos Específicos:**
- Implementar el manejo de permisos a nivel de usuarios.
- Crear procedimientos y funciones almacenadas para la gestión de datos.<br>
- Optimizar consultas mediante el uso de índices.<br>

**Requisitos:**<br>
- *Mascotas:* Código único, nombre, especie, raza, fecha de nacimiento, peso, condiciones médicas especiales.
- *Dueños:* Número de identificación único, DNI, nombre, dirección, teléfono, correo electrónico.
- *Citas Médicas:* Motivo de la cita, veterinario asignado, observaciones, asociada a una mascota y un veterinario.
- *Veterinarios:* Número de licencia profesional, nombre completo, especialidad, horario de atención.
- *Tratamientos:* Nombre del tratamiento, duración, medicamentos indicados, indicaciones relevantes, asociado a una cita.
- *Medicamentos:* Nombre comercial, monodroga, presentación, laboratorio.

**Alcance**<br>
- Mejorar la organización y acceso a la información de mascotas y dueños.<br>
- Facilitar el registro y seguimiento de citas médicas y tratamientos.<br>
- Asegurar la integridad y seguridad de los datos.<br>



## CAPITULO II: MARCO CONCEPTUAL O REFERENCIAL

### **TEMA 1: Manejo de Permisos a Nivel de Usuarios** 
### *¿Qué es?*
El manejo de permisos a nivel de usuario en una base de datos implica la asignación de derechos y privilegios específicos a diferentes usuarios o roles dentro del sistema. Estos permisos determinan qué acciones pueden realizar los usuarios, como leer, escribir, actualizar o eliminar datos. Por ejemplo, un administrador puede tener permisos completos, mientras que un recepcionista solo puede registrar citas y actualizar información de contacto de los dueños.<br>

### *Importancia y Uso*
En el contexto de la clínica veterinaria, el manejo de permisos a nivel de usuario es crucial por varias razones:<br>

- **Seguridad:** Al asignar permisos específicos, se protege la integridad y confidencialidad de la información. Solo los usuarios autorizados pueden acceder a datos sensibles, como historiales médicos de las mascotas o información personal de los dueños.
- **Control de Acceso:** Permite definir claramente quién puede realizar ciertas acciones dentro de la base de datos. Por ejemplo, solo los veterinarios pueden actualizar los registros de tratamientos y diagnósticos, mientras que el personal administrativo puede gestionar las citas y la información de contacto.
- **Prevención de Errores:** Al limitar los permisos, se reduce el riesgo de errores accidentales. Por ejemplo, un usuario con permisos limitados no podrá eliminar registros importantes por error.
- **Auditoría y Cumplimiento:** Facilita el seguimiento de las acciones realizadas por cada usuario, lo que es esencial para auditorías y para cumplir con regulaciones de privacidad y protección de datos.

### **TEMA 2: Procedimientos y Funciones Almacenadas** 
### *¿Qué son?*
- **Procedimientos Almacenados:** Son bloques de código SQL que se guardan en la base de datos y se pueden ejecutar múltiples veces. Por ejemplo, puedes tener un procedimiento que registre una nueva cita médica para una mascota.

- **Funciones Almacenadas:** Son similares a los procedimientos, pero su propósito principal es devolver un valor. Por ejemplo, puedes tener una función que calcule la edad de una mascota a partir de su fecha de nacimiento.

### *Importancia y Uso*
En el contexto de la clínica veterinaria, los procedimientos y funciones almacenadas ofrecen varias ventajas:
- **Eficiencia:** Permiten ejecutar operaciones complejas de manera rápida y repetitiva sin necesidad de reescribir código. Por ejemplo, un procedimiento puede registrar automáticamente una cita y asociarla a la mascota y al veterinario correspondiente.

- **Seguridad:** Se pueden otorgar permisos específicos a los usuarios para ejecutar estos procedimientos y funciones, manteniendo la integridad de la base de datos. Así, el personal puede registrar citas sin tener acceso completo a toda la base de datos.

- **Mantenimiento:** Facilitan el mantenimiento del código. Si se necesita realizar un cambio en la forma en que se registra una cita, solo hay que actualizar el procedimiento almacenado una vez, en lugar de cambiar cada consulta SQL que se use en la aplicación.<br>

Los procedimientos y funciones almacenadas son herramientas poderosas en la gestión de bases de datos. En una clínica veterinaria, su implementación no solo optimiza el manejo de datos, sino que también mejora la seguridad y el mantenimiento de la información crítica sobre mascotas, dueños, citas y tratamientos. Al utilizarlas, puedes asegurar un sistema de gestión más eficiente y confiable.

### **TEMA 3: Optimización de Consultas a través de Índices** 
### *¿Qué son?*
Los índices en bases de datos son estructuras que mejoran la velocidad de las operaciones de consulta en las tablas. Funcionan de manera similar a un índice en un libro, permitiendo un acceso rápido a los datos sin tener que recorrer toda la tabla. Por ejemplo, un índice sobre el campo nombre de la tabla de mascotas permite encontrar rápidamente todas las mascotas con un nombre específico.

### *Importancia y Uso*
En el contexto de la clínica veterinaria, la optimización de consultas a través de índices ofrece varias ventajas:

- **Rendimiento:** Los índices mejoran significativamente el rendimiento de las consultas, especialmente en tablas grandes. Por ejemplo, al buscar todas las citas de un veterinario específico, un índice sobre el campo veterinario_id puede acelerar la consulta.
- **Eficiencia:** Reducen el tiempo de respuesta de las consultas, lo que es crucial para operaciones en tiempo real. Esto es particularmente importante en la clínica veterinaria, donde el personal necesita acceder rápidamente a la información de las mascotas y sus tratamientos.
- **Escalabilidad:** Facilitan el manejo de grandes volúmenes de datos. A medida que la clínica crece y se acumulan más registros, los índices aseguran que las consultas sigan siendo rápidas y eficientes.

## CAPÍTULO III: METODOLOGÍA SEGUIDA 
El proyecto lo llevamos a cabo mediante la búsqueda individual de información respecto al funcionamiento de bases de datos en clínicas veterinarias para así tener un mejor panorama a la hora de realizar las reuniones tanto virtuales como presenciales, donde expusimos nuestras ideas y posibles problemas que pudieran surgir a medida que avanzara el proyecto.

### **Cómo se realizó el Trabajo Práctico**
Realizamos el diagrama de relación-entidad y nos dividimos en partes equitativas la investigación acerca de las diferentes técnicas de trabajo (manejo de permisos, procedimientos y funciones almacenadas, optimización de consultas a través de índices, etc.) y el desarrollo de las mismas.<br>

Fuimos proponiendo distintas fechas de reuniones para ir compartiendo lo desarrollado y acoplando las distintas partes del proyecto. Esto lo hicimos de manera virtual para tener una mejor visión del código y la búsqueda de información.<br>

El informe lo realizamos entre todos ya que fuimos aportando ideas y uniendo lo investigado, así como la carga de datos, ya que contiene muchas claves foráneas y se hacía imposible ir viendo los errores ya que algunas tablas dependen de otras.<br>

### **Herramientas (Instrumentos y procedimientos)**
Para llevar a cabo este proyecto, utilizamos una variedad de herramientas que facilitaron la comunicación, la investigación, el desarrollo y la documentación. A continuación, se detallan las principales herramientas empleadas:<br>

**WhatsApp:** Utilizamos esta aplicación de mensajería para coordinar rápidamente las reuniones y compartir información de manera ágil entre los miembros del equipo.<br>
**YouTube:** Consultamos tutoriales y videos educativos para aprender sobre técnicas específicas de manejo de bases de datos y optimización de consultas.<br>
**Google Meet:** Realizamos reuniones virtuales a través de esta plataforma, lo que nos permitió discutir avances, resolver dudas y planificar las siguientes etapas del proyecto.<br>
**GitHub:** Utilizamos esta plataforma para el control de versiones y la colaboración en el desarrollo del código. Nos permitió mantener un historial de cambios y trabajar de manera conjunta en el proyecto.<br>
**Google:** Fue nuestra principal herramienta de búsqueda para encontrar información relevante, artículos académicos y ejemplos prácticos relacionados con el diseño y gestión de bases de datos.<br>
**SQL Server Management Studio:** Esta herramienta fue fundamental para la creación, gestión y optimización de la base de datos de la clínica veterinaria.<br>
**Microsoft Word:** Utilizamos Word para la redacción y edición del informe final del proyecto, asegurando una presentación clara y profesional.<br>
**Visual Studio:** Empleamos este entorno de desarrollo integrado (IDE) para escribir y probar el código SQL, así como para desarrollar procedimientos y funciones almacenadas.<br>
**Herramientas online de IA:** Utilizamos diversas herramientas de inteligencia artificial disponibles en línea para obtener sugerencias y optimizar el código, así como para resolver problemas específicos que surgieron durante el desarrollo del proyecto.<br>



## CAPÍTULO IV: DESARROLLO DEL TEMA / PRESENTACIÓN DE RESULTADOS 

Maecenas molestie lacus tincidunt, placerat dolor et, ullamcorper erat. Mauris tortor nisl, ultricies ac scelerisque nec, feugiat in nibh. Pellentesque interdum aliquam magna sit amet rutrum. 


### Diagrama relacional
![diagrama_relacional](https://github.com/dovillegas/basesdatos_proyecto_estudio/blob/main/doc/image_relational.png)

### Diccionario de datos

Acceso al documento [PDF](doc/diccionario_datos.pdf) del diccionario de datos.


### Desarrollo TEMA 1 "----"

Fusce auctor finibus lectus, in aliquam orci fermentum id. Fusce sagittis lacus ante, et sodales eros porta interdum. Donec sed lacus et eros condimentum posuere. 

> Acceder a la siguiente carpeta para la descripción completa del tema [scripts-> tema_1](script/tema01_nombre_tema)

### Desarrollo TEMA 2 "----"

Proin aliquet mauris id ex venenatis, eget fermentum lectus malesuada. Maecenas a purus arcu. Etiam pellentesque tempor dictum. 

> Acceder a la siguiente carpeta para la descripción completa del tema [scripts-> tema_2](script/tema02_nombre_tema)

... 


## CAPÍTULO V: CONCLUSIONES

Nunc sollicitudin purus quis ante sodales luctus. Proin a scelerisque libero, vitae pharetra lacus. Nunc finibus, tellus et dictum semper, nisi sem accumsan ligula, et euismod quam ex a tellus. 



## BIBLIOGRAFÍA DE CONSULTA

 1. List item
 2. List item
 3. List item
 4. List item
 5. List item

