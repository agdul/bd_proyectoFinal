# TEMA 2 : Procedimientos y Funciones Almacenadas

## **Procedimientos Almacenados**: <br>
Un procedimiento almacenado en SQL Server es un conjunto de instrucciones SQL o una referencia a un método .NET CLR, similar a funciones en otros lenguajes de programación. Los procedimientos almacenados permiten: <br>
-- Aceptar parámetros de entrada y salida. <br>
-- Incluir instrucciones de programación y llamadas a otros procedimientos.<br>
-- Devolver un estado para indicar éxito o error.<br>


### **Ventajas de los procedimientos almacenados**
*Reducción del tráfico de red:* Al ejecutarse en un solo lote, solo se envía la llamada del procedimiento, disminuyendo la cantidad de datos transmitidos.<br>
*Mayor seguridad:* Permiten acceso indirecto a objetos sin dar permisos directos; su uso de parámetros evita ataques de inyección SQL, y pueden cifrarse para proteger el código.<br>
*Reutilización del código:* Facilitan la centralización de código común, evitando duplicación e inconsistencias.<br>
*Mantenimiento sencillo:* Al centralizar la lógica en la base de datos, los cambios solo afectan esta capa, sin modificar el código de aplicaciones cliente.<br>
*Rendimiento mejorado:* Se compilan en la primera ejecución, reutilizando el plan de ejecución en posteriores ejecuciones. Para cambios de datos significativos, se puede recrear el procedimiento para optimizar el rendimiento.<br>


### **Tipos de procedimientos almacenados**
*Definidos por el usuario:* Creación en bases de datos de usuario, en Transact-SQL o .NET CLR.<br>
*Temporales:* Almacenados en tempdb, visibles solo en la conexión actual o para todos los usuarios, según su tipo.<br>
*Del sistema:* Incluidos en SQL Server, con el prefijo sp_, utilizados para mantenimiento y accesibles en bases de datos de usuario.<br>
*Extendidos:* Permiten rutinas externas en otros lenguajes, sin embargo, se recomienda reemplazarlos con procedimientos CLR, ya que serán eliminados en futuras versiones de SQL Server.<br>

## **Funciones**: <br>
Las funciones definidas por el usuario (UDF) en SQL Server permiten la creación de rutinas que realizan operaciones específicas, devolviendo un valor escalar o un conjunto de resultados.<br>

### **Ventajas de las funciones definidas por el usuario**
*Programación modular:* Al igual que las funciones en otros lenguajes de programación, se pueden definir una sola vez y luego reutilizar múltiples veces dentro de las consultas, facilitando la gestión y el mantenimiento del código.<br>
*Ejecución más rápida:* Las funciones son almacenadas y sus planes de ejecución se guardan en caché, lo que reduce el tiempo de compilación en ejecuciones repetidas, mejorando así el rendimiento.<br>
*Reducción del tráfico de red:* Se pueden realizar cálculos complejos dentro de una función y luego usarla en la cláusula WHERE, lo que permite reducir la cantidad de datos enviados al cliente.<br>

### **Directrices para las funciones** 
*No puede haber efectos secundarios:* Las funciones no pueden modificar el estado de la base de datos ni realizar operaciones que afecten a objetos fuera del ámbito de la función (por ejemplo, no pueden modificar tablas directamente).<br>
*Limitación en la ejecución paralela:* Las funciones definidas por el usuario pueden afectar la ejecución paralela de consultas, ya que solo pueden ejecutarse en un único subproceso (plan de ejecución en serie).<br>
*Determinismo:* Las funciones deterministas siempre devuelven el mismo resultado con el mismo conjunto de entradas. Las no deterministas pueden devolver diferentes resultados en cada ejecución, incluso si los valores de entrada son los mismos (por ejemplo, GETDATE()).<br>

### **Instrucciones válidas en una función**
*DECLARE:* Se puede utilizar para declarar variables locales y cursores.<br>
*SELECT:* Para asignar valores a variables locales dentro de la función.<br>
*INSERT, UPDATE, DELETE:* Se pueden usar para modificar variables de tipo tabla locales.<br>
*EXECUTE:* Para llamar a procedimientos almacenados extendidos.<br>


## Entonces en que se parecen y en que se diferencian

### Similitudes entre procedimientos almacenados y funciones
*Modularidad:* Ambos permiten encapsular y reutilizar lógica SQL, facilitando la programación modular.<br>
*Parámetros de entrada:* Ambos pueden recibir parámetros de entrada (aunque los procedimientos almacenados también pueden tener parámetros de salida).<br>
*Mantenimiento de código:* Ambos permiten centralizar el código SQL, simplificando el mantenimiento al evitar duplicación.<br>
*Seguridad:* Al encapsular lógica compleja, ambos pueden ayudar a evitar inyecciones SQL y a mejorar el control de acceso.<br>

### Diferencias entre procedimientos almacenados y funciones

**Tipos de retorno:**<br>
*Procedimientos almacenados:* No necesariamente devuelven un valor, aunque pueden devolver un valor de estado (éxito o error) o pasar datos mediante parámetros de salida. Sin embargo, también pueden devolver conjuntos de resultados con SELECT.<br>
*Funciones:* Siempre devuelven un valor, ya sea escalar (como un INT o VARCHAR) o un conjunto de resultados (como una tabla), por lo que son útiles en cálculos o lógicas que devuelvan algo específico.<br>

**Modificación de datos:**<br>
*Procedimientos almacenados:* Pueden modificar el estado de la base de datos directamente, como realizar INSERT, UPDATE o DELETE en tablas.<br>
*Funciones:* No pueden modificar datos fuera de su propio contexto. Esto significa que no pueden alterar el estado de la base de datos, lo que las hace "sin efectos secundarios".<br>

**Uso en consultas SQL:**<br>
*Procedimientos almacenados:* No se pueden usar directamente en consultas SELECT, WHERE o JOIN.<br>
*Funciones:* Se pueden utilizar en sentencias SQL como SELECT, WHERE, JOIN, etc., lo cual es útil para realizar cálculos y filtros dentro de consultas.<br>

**Parámetros de salida:**<br>
*Procedimientos almacenados:* Permiten parámetros de salida, lo que facilita devolver múltiples valores de salida.<br>
*Funciones:* No permiten parámetros de salida; solo pueden devolver un único valor escalar o una tabla.<br>

**Paralelismo y determinismo:**<br>
*Funciones:* Al tener limitaciones sobre su paralelismo y ejecución determinista, pueden ser restrictivas en ciertas operaciones complejas y lentas para grandes volúmenes de datos.<br>
*Procedimientos almacenados:* No tienen estas restricciones, y pueden utilizarse de forma más flexible, permitiendo optimizaciones y paralelismo en consultas complejas.<br>

### ¿Cuándo usar procedimientos almacenados vs. funciones?
**Procedimientos almacenados son ideales cuando:**<br> 
Necesitas realizar operaciones que modifican datos (inserciones, actualizaciones o eliminaciones).<br> 
La lógica implica múltiples pasos o llamas a otros procedimientos.<br> 
La operación no debe usarse en una consulta SELECT o JOIN, sino ejecutarse como un proceso independiente.<br> 
Deseas un mayor control en la administración de permisos y accesos indirectos.<br> 
**Funciones son ideales cuando:**
Necesitas un valor calculado o una tabla como resultado que puede ser utilizado en una consulta.<br>
Requieres un cálculo que se debe reutilizar en múltiples consultas SQL, especialmente en filtros (WHERE) o agrupaciones (GROUP BY).<br>
El resultado de la operación es un cálculo o transformación que no necesita modificar los datos en la base.<br>