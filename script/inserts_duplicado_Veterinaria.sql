-- Duplicar los datos

INSERT INTO Especie (nombre_especie) SELECT nombre_especie FROM Especie;

INSERT INTO Raza (nombre_raza) SELECT nombre_raza FROM Raza;

--ROW_NUMBER devuelve el número secuencial de una fila dentro de una partición de un conjunto de resultados
--OVER : Espesifica que es un funcion de ventana

-- With Tabla temporal donde colocas las variaciones que queres efectuar sobre la tabla dueno
-- El from del Insert va ser sobre CTE (nomb_generico) y el ultimo modulo ni idea

--inicio de la funcion duplicar dueno
WITH CTE AS (
    SELECT  nombre_dueno,
            apellido_dueno, 
            CAST(dni_dueno AS INT) + ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS nuevo_dni,
            telefono_dueno + ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS nuevo_telefono,
            CONCAT('correo', ROW_NUMBER() OVER (ORDER BY (SELECT NULL)), '@ejemplo.com') AS nuevo_email,
            direccion_dueno 
    FROM dueno
)
INSERT INTO dueno (nombre_dueno, apellido_dueno, dni_dueno, telefono_dueno, email_dueno, direccion_dueno)
SELECT  nombre_dueno,
        apellido_dueno, 
        nuevo_dni, 
        nuevo_telefono, 
        nuevo_email, 
        direccion_dueno 
FROM CTE
WHERE NOT EXISTS (
    SELECT 1 
    FROM dueno d 
    WHERE d.telefono_dueno = CTE.nuevo_telefono
       OR d.dni_dueno = CTE.nuevo_dni
);
--fin de la funcion duplicar dueno

INSERT INTO Especialidad (nombre_especialidad) SELECT nombre_especialidad FROM Especialidad

INSERT INTO Laboratorio (nombre_lab) SELECT nombre_lab FROM Laboratorio;

--Ejecutar varias veces para tener un lote grande de mascotas 
INSERT INTO Mascota (nombre_mascota, fecha_nacimiento, peso_mascota, condicion_mascota, id_dueno, id_raza)
SELECT nombre_mascota, fecha_nacimiento, peso_mascota, condicion_mascota, id_dueno, id_raza
FROM Mascota;

INSERT INTO Medicamento (nombre_comercial, monodroga_medic, presentacion_medic, id_laboratorio)
SELECT nombre_comercial, monodroga_medic, presentacion_medic, id_laboratorio
FROM Medicamento;

--INICIO DE LA FUNCION DUPLICAR VET 
-- Ejecutar varias veces para poder llegar al millon de insersiones en cita medica 
WITH CTE AS (
    SELECT  nro_licProfesional + ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS nuevo_nro_licProfesional,
            nombre_profesional,
            hora_entrada,
            hora_salida,
            id_especialidad
    FROM Veterinario
)
INSERT INTO Veterinario (nro_licProfesional, nombre_profesional, hora_entrada, hora_salida, id_especialidad)
SELECT  nuevo_nro_licProfesional,
        nombre_profesional,
        hora_entrada,
        hora_salida,
        id_especialidad
FROM CTE
WHERE NOT EXISTS (
    SELECT 1 
    FROM Veterinario v 
    WHERE v.nro_licProfesional = CTE.nuevo_nro_licProfesional
);

--FIN DE LA FUNCION DUPLICAR VET

INSERT INTO CitasMedica (fecha_citaMedica, observaciones_citaMedica, usuario, motivo_visita, id_mascota, id_veterinario)
SELECT fecha_citaMedica, observaciones_citaMedica, usuario, motivo_visita, id_mascota, id_veterinario
FROM CitasMedica;

INSERT INTO Tratamiento (nombre_tratamiento, inicio_tratamiento, fin_tratamiento, id_citaMedica)
SELECT nombre_tratamiento, inicio_tratamiento, fin_tratamiento, id_citaMedica
FROM Tratamiento;

-- Creacion de datos Tratamiento_medicamento

-- Crear una tabla temporal para almacenar los pares de id_medicamento e id_tratamiento
CREATE TABLE #TempTratamientoMedicamento (
    id_medicamento INT,
    id_tratamiento INT
);

-- Insertar combinaciones de id_medicamento e id_tratamiento
INSERT INTO #TempTratamientoMedicamento (id_medicamento, id_tratamiento)
SELECT m.id_medicamento, t.id_tratamiento
FROM Medicamento m
CROSS JOIN Tratamiento t;

-- Insertar en la tabla Tratamiento_medicamento asegurando que no haya duplicados
INSERT INTO Tratamiento_medicamento (id_medicamento, id_tratamiento)
SELECT id_medicamento, id_tratamiento
FROM #TempTratamientoMedicamento
WHERE NOT EXISTS (
    SELECT 1 
    FROM Tratamiento_medicamento tm 
    WHERE tm.id_medicamento = #TempTratamientoMedicamento.id_medicamento
      AND tm.id_tratamiento = #TempTratamientoMedicamento.id_tratamiento
);

-- Eliminar la tabla temporal
DROP TABLE #TempTratamientoMedicamento;


-- Contador de registro total
SELECT 
t.name
 AS tabla, SUM(p.rows) AS row_count
FROM sys.tables AS t
INNER JOIN sys.partitions AS p ON t.object_id = p.object_id
WHERE p.index_id IN (0, 1)  -- 0 para heaps (tablas sin índice clustered) y 1 para índices clustered
GROUP BY 
t.name

ORDER BY row_count DESC; 
