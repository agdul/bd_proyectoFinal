-- INDICE NO AGRUPADO CLUSTER 
CREATE NONCLUSTERED COLUMNSTORE INDEX Columnar_CitasMedicaNew 
ON CitasMedicaNew (id_mascota, id_veterinario);


--INDICE AGRUPADO CLUESTER
CREATE COLUMNSTORE INDEX IX_Columnar_CitasMedicaNew ON CitasMedicaNew (id_mascota, id_veterinario);


-- Consulta en la tabla original sin índice columnar
SET STATISTICS TIME ON;
SELECT * FROM CitasMedica 
where motivo_visita like 'Consulta%'
SET STATISTICS TIME OFF;


-- Consulta en la tabla nueva con índice columnar
SET STATISTICS TIME ON;
SELECT * FROM CitasMedicaNew 
WHERE motivo_visita  like 'Consulta%';
SET STATISTICS TIME OFF;



--Elimina el indice IDX_gastoNEW de la tabla gastoNew
  DROP INDEX IX_NONColumnar_CitasMedicaNew ON CitasMedicaNew; 



-- Otra consultas 


-- Consulta en la tabla original sin índice columnar
SET STATISTICS TIME ON;
SELECT * FROM CitasMedica 
where observaciones_citaMedica like 'Problemas%'
SET STATISTICS TIME OFF;


-- Consulta en la tabla nueva con índice columnar
SET STATISTICS TIME ON;
SELECT * FROM CitasMedicaNew 
where observaciones_citaMedica like 'Problemas%'
SET STATISTICS TIME OFF;



-- Otra consultas 

-- Consulta en la tabla original sin índice columnar
SET STATISTICS TIME ON;
SELECT * FROM CitasMedica 
where id_mascota = 30 
SET STATISTICS TIME OFF;


-- Consulta en la tabla nueva con índice columnar
SET STATISTICS TIME ON;
SELECT * FROM CitasMedicaNew 
where id_mascota = 30 
SET STATISTICS TIME OFF;
