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