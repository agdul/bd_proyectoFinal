USE gestion_veterinaria;
-- 
GO

-- Inserciones
EXEC InsertMascota @nombre_mascota = 'Max', @fecha_nacimiento = '2020-01-10', @peso_mascota = 5.5, @condicion_mascota = 'Saludable', @id_dueno = 1, @id_raza = 1;
EXEC InsertMascota @nombre_mascota = 'Bella', @fecha_nacimiento = '2019-03-20', @peso_mascota = 8.2, @condicion_mascota = 'Vacunada', @id_dueno = 2, @id_raza = 2;
EXEC InsertMascota @nombre_mascota = 'Rocky', @fecha_nacimiento = '2018-08-15', @peso_mascota = 12.4, @condicion_mascota = 'En tratamiento', @id_dueno = 3, @id_raza = 3;

EXEC InsertarEspecie @nombre = 'Canino';
EXEC InsertarEspecie @nombre = 'Felino';
EXEC InsertarEspecie @nombre = 'Ave';

EXEC InsertarRaza @nombre_raza = 'Labrador', @id_especie = 1;
EXEC InsertarRaza @nombre_raza = 'Persa', @id_especie = 2;
EXEC InsertarRaza @nombre_raza = 'Canario', @id_especie = 3;

-- Modificaciones
EXEC UpdateMascota @id_mascota = 1, @nombre_mascota = 'Maximus', @fecha_nacimiento = '2020-01-10', @peso_mascota = 6.0, @condicion_mascota = 'Muy saludable', @id_dueno = 1, @id_raza = 1;
EXEC UpdateEspecie @id = 1, @nombre = 'Perro';
EXEC UpdateRaza @id_raza = 1, @nombre_raza = 'Golden Retriever', @id_especie = 1;

-- Eliminaciones
EXEC DeleteMascota @id_mascota = 3;
EXEC DeleteEspecie @id = 3;
EXEC DeleteRaza @id_raza = 3;

GO

