# TEMA 2 : Procedimientos y Funciones Almacenadas

## **Procedimientos Almacenados**: <br>
Un procedimiento almacenado en SQL Server es un conjunto de instrucciones SQL o una referencia a un método .NET CLR, similar a funciones en otros lenguajes de programación. Los procedimientos almacenados permiten:
-- Aceptar parámetros de entrada y salida.
-- Incluir instrucciones de programación y llamadas a otros procedimientos.
-- Devolver un estado para indicar éxito o error.


### **Ventajas de los procedimientos almacenados**
*Reducción del tráfico de red:* Al ejecutarse en un solo lote, solo se envía la llamada del procedimiento, disminuyendo la cantidad de datos transmitidos.
*Mayor seguridad:* Permiten acceso indirecto a objetos sin dar permisos directos; su uso de parámetros evita ataques de inyección SQL, y pueden cifrarse para proteger el código.
*Reutilización del código:* Facilitan la centralización de código común, evitando duplicación e inconsistencias.
*Mantenimiento sencillo:* Al centralizar la lógica en la base de datos, los cambios solo afectan esta capa, sin modificar el código de aplicaciones cliente.
*Rendimiento mejorado:* Se compilan en la primera ejecución, reutilizando el plan de ejecución en posteriores ejecuciones. Para cambios de datos significativos, se puede recrear el procedimiento para optimizar el rendimiento.


### **Tipos de procedimientos almacenados**
*Definidos por el usuario:* Creación en bases de datos de usuario, en Transact-SQL o .NET CLR.
*Temporales:* Almacenados en tempdb, visibles solo en la conexión actual o para todos los usuarios, según su tipo.
*Del sistema:* Incluidos en SQL Server, con el prefijo sp_, utilizados para mantenimiento y accesibles en bases de datos de usuario.
*Extendidos:* Permiten rutinas externas en otros lenguajes, sin embargo, se recomienda reemplazarlos con procedimientos CLR, ya que serán eliminados en futuras versiones de SQL Server.

