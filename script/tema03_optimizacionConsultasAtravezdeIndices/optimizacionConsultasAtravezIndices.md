# TEMA 3 : Optimización de Consultas a través de Índices 

## **Introduccion**: <br>
Un índice en una base de datos es una estructura adicional que se crea para permitir búsquedas rápidas en una o varias columnas de una tabla. Actúa como un índice en un libro, permitiendo encontrar información rápidamente sin tener que recorrer toda la tabla.



Un índice es una estructura de disco asociada con una tabla o una vista que acelera la recuperación de filas de la tabla o de la vista. Un índice contiene claves generadas a partir de una o varias columnas de la tabla o la vista. Dichas claves están almacenadas en una estructura (árbol b) que permite que SQL Server busque de forma rápida y eficiente la fila o filas asociadas a los valores de cada clave. 




## **Pruebas**: <br>
### CitasMedica (Sin indice) vs CitasMedicaNew (con indice agrupado por (fecha_citaMedica, id_mascota, id_veterinario))
![img_prueba1_tema03](img/tema03_img_1.png)

### CitasMedica (Sin indice) vs CitasMedicaNew (con indice agrupado por (fecha_citaMedica))
![img_prueba2_tema03](img/tema03_img_2.png)

### CitasMedica (con indice agrupado por (fecha_citaMedica, id_mascota, id_veterinario)) vs CitasMedicaNew (con indice agrupado por (fecha_citaMedica))
