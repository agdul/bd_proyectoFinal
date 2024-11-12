
--------------------------------------------------------------------------------------------------------------------
-- INDICE NO AGRUPADO CLUSTER 
CREATE NONCLUSTERED COLUMNSTORE INDEX Columnar_CitasMedicaNew 
ON CitasMedicaNew (id_citaMedica, id_mascota, id_veterinario, fecha_citaMedica);


--INDICE AGRUPADO CLUESTER
CREATE COLUMNSTORE INDEX IX_Columnar_CitasMedicaNew ON CitasMedicaNew (id_citaMedica, id_mascota, id_veterinario, fecha_citaMedica);


--Elimina el indice IDX_gastoNEW de la tabla gastoNew
DROP INDEX IX_Columnar_CitasMedicaNew ON CitasMedicaNew; 

--------------------------------------------------------------------------------------------------------------------
-- Ver Indices asociados a una tabla
SELECT name 
FROM sys.indexes 
WHERE object_id = OBJECT_ID('CitasMedicaNew') 
  AND is_primary_key = 0 
  AND is_unique = 0;



--------------------------------------------------------------------------------------------------------------------
--Esta consulta calcula la cantidad total de citas, el promedio de días desde cada cita hasta la fecha actual y el máximo de días transcurridos, considerando solo aquellas con observaciones específicas.

--SET STATISTICS TIME ON;
SELECT 
    COUNT(*) AS total_citas,
    AVG(DATEDIFF(day, fecha_citaMedica, GETDATE())) AS promedio_dias,
    MAX(DATEDIFF(day, fecha_citaMedica, GETDATE())) AS max_dias
FROM CitasMedica
WHERE observaciones_citaMedica LIKE 'Obser%'
--SET STATISTICS TIME OFF;

--SET STATISTICS TIME ON;
SELECT 
    COUNT(*) AS total_citas,
    AVG(DATEDIFF(day, fecha_citaMedica, GETDATE())) AS promedio_dias,
    MAX(DATEDIFF(day, fecha_citaMedica, GETDATE())) AS max_dias
FROM CitasMedicaNew
WHERE observaciones_citaMedica LIKE 'Obser%'
--SET STATISTICS TIME OFF;

--------------------------------------------------------------------------------------------------------------------
--Filtra las citas por una fecha específica y ordena por fecha_citaMedica y id_mascota, lo cual debería beneficiarse de un índice en esas columnas.

--SET STATISTICS TIME ON;
SELECT *
FROM CitasMedica
WHERE fecha_citaMedica BETWEEN '2023-01-01' AND '2024-01-01'
ORDER BY fecha_citaMedica DESC, id_mascota
--SET STATISTICS TIME OFF;

--SET STATISTICS TIME ON;
SELECT *
FROM CitasMedicaNew
WHERE fecha_citaMedica BETWEEN '2023-01-01' AND '2024-01-01'
ORDER BY fecha_citaMedica DESC, id_mascota
--SET STATISTICS TIME OFF;

--------------------------------------------------------------------------------------------------------------------
--Cuenta el número de citas y calcula el peso promedio de las mascotas atendidas por cada veterinario, realizando un JOIN con la tabla Mascota.

SET STATISTICS TIME ON;
SELECT 
    v.id_veterinario,
    COUNT(cm.id_citaMedica) AS total_citas,
    AVG(m.peso_mascota) AS peso_promedio
FROM CitasMedica AS cm
JOIN Mascota AS m ON cm.id_mascota = m.id_mascota
JOIN Veterinario AS v ON cm.id_veterinario = v.id_veterinario
GROUP BY v.id_veterinario
SET STATISTICS TIME OFF;


SET STATISTICS TIME ON;
SELECT 
    v.id_veterinario,
    COUNT(cm.id_citaMedica) AS total_citas,
    AVG(m.peso_mascota) AS peso_promedio
FROM CitasMedicaNew AS cm
JOIN Mascota AS m ON cm.id_mascota = m.id_mascota
JOIN Veterinario AS v ON cm.id_veterinario = v.id_veterinario
GROUP BY v.id_veterinario
SET STATISTICS TIME OFF;

----------------------------------------------------------------------------------
-- Esta consulta encuentra citas recientes y muestra el total de tratamientos asociados a cada cita.

SET STATISTICS TIME ON;
SELECT cm.id_citaMedica, cm.fecha_citaMedica, 
       (SELECT COUNT(*) FROM Tratamiento AS t WHERE t.id_citaMedica = cm.id_citaMedica) AS total_tratamientos
FROM CitasMedica AS cm
WHERE cm.fecha_citaMedica >= DATEADD(YEAR, -1, GETDATE())
SET STATISTICS TIME OFF;

SET STATISTICS TIME ON;
SELECT cm.id_citaMedica, cm.fecha_citaMedica, 
       (SELECT COUNT(*) FROM Tratamiento AS t WHERE t.id_citaMedica = cm.id_citaMedica) AS total_tratamientos
FROM CitasMedicaNew AS cm
WHERE cm.fecha_citaMedica >= DATEADD(YEAR, -1, GETDATE())
SET STATISTICS TIME OFF;


---------------------------------------------------------------------------------------
--Esta consulta cuenta la cantidad de citas por id_veterinario, pero solo muestra los veterinarios que tienen más de 500 citas en el sistema.

SET STATISTICS TIME ON;
SELECT id_veterinario, COUNT(*) AS total_citas
FROM CitasMedica
GROUP BY id_veterinario
HAVING COUNT(*) > 500
SET STATISTICS TIME OFF;

SET STATISTICS TIME ON;
SELECT id_veterinario, COUNT(*) AS total_citas
FROM CitasMedicaNew
GROUP BY id_veterinario
HAVING COUNT(*) > 500
SET STATISTICS TIME OFF;

--------------------------------------------------------------------------------------------------
