# TEMA 4 : Indices Columnares 


## **Introduccion**: <br>
Los índices columnares son una estructura de datos utilizada en bases de datos para almacenar y recuperar datos más eficientemente cuando las consultas requieren acceder solo a ciertas columnas, en lugar de toda la fila de datos. En los índices columnares, cada columna de una tabla se almacena por separado, lo cual permite optimizar consultas analíticas y de lectura intensiva. 

## Principales características:<br> 
### Almacenamiento por columna
A diferencia del almacenamiento tradicional (por filas), en los índices columnares cada columna se guarda por separado. Esto significa que una consulta que necesite solo ciertas columnas puede ignorar el resto, ahorrando tiempo y espacio en la lectura.

### Compresión
Al tener datos de una misma columna juntos, se facilita la compresión de datos. Por ejemplo, si muchos registros tienen valores similares en una columna, se pueden almacenar de manera comprimida, reduciendo el espacio y acelerando las consultas

### Optimización para consultas de análisis
Los índices columnares están diseñados para consultas de análisis (como SUM, AVG, COUNT, etc.) y consultas que necesitan procesar grandes volúmenes de datos

## Conclusion 
Los índices columnares son ideales para consultas donde se requiere acceder a ciertas columnas de una tabla y realizar análisis complejos, esto permite leer solo las columnas necesarias para la consulta, optimizando el rendimiento en análisis de datos y grandes volúmenes.

La diferencia básica entre índices agrupados y no agrupados es que los registros de un índice agrupado están ordenados y almacenados de forma secuencial en función de su clave, lo que evita tener que hacer muchas lectura. Esto hace que las consultas sean más eficientes y rápidas cuando devuelven mas de un registro.

## CAPÍTULO IV: DESARROLLO DEL TEMA/RESULTADOS 

Como primera instancia realizamos la creación de la tabla de mayor ocurrencia del modelo de la tabla origen a y adaptándola a nuestras necesidades, la cuel se va a llamar CitasMedicaNew. El script utilizado para ello es el que se describe a continuación:

![Tabla](https://github.com/user-attachments/assets/1d89a5a8-0dd7-4419-b52d-3e918f24323f)

### Generación de lotes 

Para la generación del lote de pruebas con un millón de registros en la tabla citasMedicaNew lo primero que hicimos fue igresar lotes de datos de las tablas de mascota y veterinario, una vez que ingresamos una sierta cantidad de datos lo que hicimos fue duplicar esos datos por medio de consultas:

![consulta para duplicar](https://github.com/user-attachments/assets/d53b066f-f3bf-4bd1-98fc-5f171773d23f)

Una vez realizado esto pudimos realizar una carga masiva de por lo menos 1 millón de registros sobre la tabla recién creada. donde se repetiron los registros ya existentes.

![1000000](https://github.com/user-attachments/assets/98d5e19e-664f-4ca1-ae26-3ccfec69dd22)

### Cantidad de datos ingresados

![Select](https://github.com/user-attachments/assets/6df037fd-8b17-450d-a73e-5edcd7c056fa)

### Generación de Índice columnar 

A continuación, creamos los índices columnares que utilizaremos en la tabla citasMedicas

![realizar indice](https://github.com/user-attachments/assets/451264ca-a399-4cb5-9b26-4c3383dc9460)

### Preparaciones previas a las pruebas: 

Para la medición de las pruebas utilizamos la siguiente sentencia para ver las operaciones que entrada/salida y el tiempo de ejecución de las consultas, Además, activamos el plan de ejecución que nos mostrará qué índice utiliza el motor de base de datos para la consulta. Esta función se encuentra en la barra de tareas en la parte superior de SQL server management:

![operaciones entradaSalida](https://github.com/user-attachments/assets/95be4ea8-d77c-494a-b0c9-868ff6f34088)

Prueba 1<br>

Esta consulta cuenta la cantidad de citas por id_veterinario, pero solo muestra los veterinarios que tienen más de 500 citas en el sistema.

Sin indices columnares <br>

![sin indice](https://github.com/user-attachments/assets/4711a7aa-a6f6-4ace-847f-6981f7a3bda3)

Rendimiento<br>

![rendimento1](https://github.com/user-attachments/assets/622fe30d-6dcb-445f-82c4-31d4684132f3)

![rendimento2](https://github.com/user-attachments/assets/b9ef8ad2-4e73-475f-ad36-57b50ce57070)

con indices columnares <br>

![con indice](https://github.com/user-attachments/assets/465d7b23-429f-4edc-b49f-dedba3a8689b)

Rendimiento<br>

![rendimento1 1](https://github.com/user-attachments/assets/de033209-a393-46ed-8692-68e074fff414)

![rendimento2 2](https://github.com/user-attachments/assets/efd707c6-07ea-46be-acdb-41127043edba)

Prueba 2 <br>

Cuenta el número de citas y calcula el peso promedio de las mascotas atendidas por cada veterinario, realizando un JOIN con la tabla Mascota.

Sin indices columnares <br>

![image 1](https://github.com/user-attachments/assets/7012eae1-a51b-4e6e-aefa-3426ae36940e)

Rendimiento <br>
![ult1](https://github.com/user-attachments/assets/f35ca2f5-3a14-4062-b335-c33d3c11d0ce)

![ult](https://github.com/user-attachments/assets/37358c6b-0f15-4d7a-a763-42d4fab97199)

Con indices columnares <br>

![image 2](https://github.com/user-attachments/assets/4fe5d7ca-b63c-4f7a-bb70-1040fb9b0d93)

rendimiento <br>

![imagen 1 3](https://github.com/user-attachments/assets/244c5ec7-5a59-48ec-8db8-2b75906bb0ee)

![imagen 1 4](https://github.com/user-attachments/assets/cc15a1f4-2450-4cc3-8878-74012a55feca)

