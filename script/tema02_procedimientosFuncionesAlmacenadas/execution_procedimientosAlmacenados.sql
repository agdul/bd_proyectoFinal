USE gestion_veterinaria;
GO
-----------------------------------------------------------------------------------------------------------------------------
SELECT * FROM Especie 
SELECT * FROM Raza 
-----------------------------------------------------------------------------------------------------------------------------
-- Inserciones de Mascota
EXEC InsertMascota @nombre_mascota = 'Maxsyle', @fecha_nacimiento = '2020-01-10', @peso_mascota = 5.5, @condicion_mascota = 'Saludable', @id_dueno = 1, @id_raza = 1;

EXEC InsertMascota @nombre_mascota = 'BellaVista', @fecha_nacimiento = '2019-03-20', @peso_mascota = 8.2, @condicion_mascota = 'Vacunada', @id_dueno = 2, @id_raza = 2;

EXEC InsertMascota @nombre_mascota = 'RickyMaravilla', @fecha_nacimiento = '2018-08-15', @peso_mascota = 12.4, @condicion_mascota = 'En tratamiento', @id_dueno = 1, @id_raza = 1;
-----------------------------------------------------------------------------------------------------------------------------
-- Chequeo de insercion 
SELECT * FROM Mascota 
WHERE nombre_mascota = 'Maxsyle'

SELECT * FROM Mascota 
WHERE nombre_mascota = 'BellaVista'

SELECT * FROM Mascota 
WHERE nombre_mascota = 'RickyMarav'

SELECT * FROM Mascota 
WHERE nombre_mascota like 'RickyMarav%'
-----------------------------------------------------------------------------------------------------------------------------
--Inseciones de Especie

SELECT * FROM Especie 

EXEC InsertarEspecie @nombre = 'Canino';
EXEC InsertarEspecie @nombre = 'Felino';
EXEC InsertarEspecie @nombre = 'Ave';

--Chequeo de las inserciones
SELECT * FROM Especie WHERE nombre_especie = 'Canino'
SELECT * FROM Especie WHERE nombre_especie = 'Felino'
SELECT * FROM Especie WHERE nombre_especie = 'Ave'
-----------------------------------------------------------------------------------------------------------------------------
--Inseciones de Raza
SELECT * FROM Raza 

EXEC InsertarRaza @nombre_raza = 'Labrador', @id_especie = 51;
EXEC InsertarRaza @nombre_raza = 'Persa', @id_especie = 52;
EXEC InsertarRaza @nombre_raza = 'Canario', @id_especie = 53;

--Chequeo de las inserciones
SELECT * FROM Raza WHERE nombre_raza = 'Labrador'
SELECT * FROM Raza WHERE nombre_raza = 'Persa'
SELECT * FROM Raza WHERE nombre_raza = 'Canario'

-----------------------------------------------------------------------------------------------------------------------------
-- Modificaciones
EXEC UpdateMascota @id_mascota = 1, @nombre_mascota = 'Maximus', @fecha_nacimiento = '2020-01-10', @peso_mascota = 6.0, @condicion_mascota = 'Muy saludable', @id_dueno = 1, @id_raza = 1;
EXEC UpdateEspecie @id = 1, @nombre = 'Perro';
EXEC UpdateRaza @id_raza = 1, @nombre_raza = 'Golden Retriever', @id_especie = 1;


-----------------------------------------------------------------------------------------------------------------------------
-- Eliminaciones
EXEC DeleteMascota @id_mascota = 3;
EXEC DeleteEspecie @id = 3;
EXEC DeleteRaza @id_raza = 3;

GO

