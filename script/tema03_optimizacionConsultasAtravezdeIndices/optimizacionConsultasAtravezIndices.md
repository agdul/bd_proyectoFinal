# TEMA 3 : Optimización de Consultas a través de Índices 

## **Introduccion**: <br>
Un índice en una base de datos es una estructura adicional que se crea para permitir búsquedas rápidas en una o varias columnas de una tabla. Actúa como un índice en un libro, permitiendo encontrar información rápidamente sin tener que recorrer toda la tabla.

Es una estructura de disco asociada, contiene claves generadas a partir de una o varias columnas de la tabla o la vista. Dichas claves están almacenadas en una estructura (árbol b) que permite que SQL Server busque de forma rápida y eficiente la fila o filas asociadas a los valores de cada clave. 

###Observaciones:<br>
### CitasMedica (Sin indice)
Rendimiento de la consulta sin índice agrupado: Al ejecutar la consulta sin índice,
el motor de SQL Server tendrá que realizar un escaneo completo de la tabla, lo cual puede ser lento si la tabla tiene muchos registros.


### CitasMedica (Con indice) utilizando solo una columna
Mejora con el índice agrupado sobre fecha_nacimiento: 
Crear un índice agrupado sobre fecha_nacimiento mejora el rendimiento de las consultas que filtran por esa columna, 
ya que los datos estarán físicamente ordenados por esa columna, lo que permite un acceso más rápido.

### CitasMedica (Con indice) utilizando mas de una columna
Mejora adicional con el índice agrupado que incluye las columnas seleccionadas: 
Incluir las columnas adicionales en el índice agrupado mejora aún más el rendimiento, ya que cubre toda la consulta. 
Esto significa que SQL Server no tiene que realizar una búsqueda adicional de datos en la tabla; 
toda la información necesaria está contenida en el índice.

Impacto de los planes de ejecución: El plan de ejecución mostrará cambios en la forma en que SQL Server accede a los datos.
Con un índice agrupado, deberías ver que se está utilizando un índice de búsqueda más eficiente en lugar de un escaneo de tabla.

Tiempos de respuesta: Los tiempos de respuesta deberían disminuir considerablemente después de crear el índice,
y más aún con el índice cubierto que incluye las columnas seleccionadas.

##Conclusiones:<br>
AL crear un índice agrupado sobre una  columna, como fecha_nacimiento, mejora la eficiencia de la consulta.
Pero si se  crea un índice utilizando mas columnas, el rendimiento mejorará aún más, 
ya que SQL Server utilizará solo el índice para resolver la consulta sin tener que acceder a la tabla principal.


