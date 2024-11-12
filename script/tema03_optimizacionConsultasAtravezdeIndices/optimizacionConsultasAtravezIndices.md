# TEMA 3 : Optimización de Consultas a través de Índices 

## **Introduccion**: <br>
Un índice en una base de datos es una estructura adicional que se crea para permitir búsquedas rápidas en una o varias columnas de una tabla. Actúa como un índice en un libro, permitiendo encontrar información rápidamente sin tener que recorrer toda la tabla.









## **Pruebas**: <br>
### CitasMedica (Sin indice) vs CitasMedicaNew (con indice agrupado por (fecha_citaMedica, id_mascota, id_veterinario))
![img_prueba1_tema03](img/tema03_img_1.png)

### CitasMedica (Sin indice) vs CitasMedicaNew (con indice agrupado por (fecha_citaMedica))
![img_prueba2_tema03](img/tema03_img_2.png)

### CitasMedica (con indice agrupado por (fecha_citaMedica, id_mascota, id_veterinario)) vs CitasMedicaNew (con indice agrupado por (fecha_citaMedica))
