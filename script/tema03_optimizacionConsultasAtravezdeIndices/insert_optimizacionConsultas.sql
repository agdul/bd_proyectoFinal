
--Carga de datos esta en tema04_indicesColumnares/inserts_indicesColumnares.sql

-------------------------------------------------------------------------------------------
-- Ver Indices asociados a una tabla
SELECT name 
FROM sys.indexes 
WHERE object_id = OBJECT_ID('CitasMedicaNew') 
  AND is_primary_key = 0 
  AND is_unique = 0;
-----------------------------------------------------------------------------------------------
--Elimina el indice IDX_gastoNEW de la tabla gastoNew
DROP INDEX Columnar_CitasMedicaNew ON CitasMedicaNew; 

--INDICE AGRUPADO CLUESTER
CREATE COLUMNSTORE INDEX IX_Columnar_CitasMedicaNew ON CitasMedicaNew (fecha_citaMedica);

-------------------------------------------------------------------------------------------------
