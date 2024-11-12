-- Medir tiempos de ejecución antes de la consulta
-- SET STATISTICS TIME ON;
-- SET STATISTICS PROFILE ON;

-- Búsqueda de registros en un periodo específico (sin índice)
SELECT * 
FROM CitasMedica
WHERE fecha_citaMedica BETWEEN '2012-01-01' AND '2024-12-31';


SELECT * 
FROM CitasMedicaNew
WHERE fecha_citaMedica BETWEEN '2012-01-01' AND '2024-12-31';
-- Medir tiempos de ejecución después de la consulta
-- SET STATISTICS TIME OFF;
-- SET STATISTICS PROFILE OFF;



