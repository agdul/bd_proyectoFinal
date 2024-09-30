USE gestion_veterinaria;

GO;
CREATE PROCEDURE InsertMascota
	--Como validar los datos desde aqui?
    @id_mascota INT,
    @nombre_mascota VARCHAR(10),
    @fecha_nacimiento DATE,
    @peso_mascota FLOAT,
    @condicion_mascota VARCHAR(50),
    @id_dueno INT,
    @id_raza INT
AS
BEGIN
    INSERT INTO Mascota (id_mascota, nombre_mascota, fecha_nacimiento, peso_mascota, condicion_mascota, id_dueno, id_raza)
    VALUES (@id_mascota, @nombre_mascota, @fecha_nacimiento, @peso_mascota, @condicion_mascota, @id_dueno, @id_raza);
END;

GO;
CREATE PROCEDURE ObtenerMascotaPorID
    @id INT
AS
BEGIN
    SELECT *
    FROM Mascota 
    WHERE id_mascota = @id;
END;

GO;
CREATE PROCEDURE InsertarEspecie
    @id INT,
    @nombre VARCHAR(30)
AS
BEGIN
    INSERT INTO Especie (id_especie, nombre_especie)
    VALUES (@id, @nombre);
END;

GO;
CREATE PROCEDURE InsertarRaza
    @id_raza INT,
    @nombre_raza VARCHAR(30),
    @id_especie INT
AS
BEGIN
    INSERT INTO Raza (id_raza, nombre_raza, id_especie)
    VALUES (@id_raza, @nombre_raza, @id_especie);
END;

GO;
CREATE PROCEDURE InsertarDueno
    @id_dueno INT,
    @nombre_dueno VARCHAR(50),
    @apellido_dueno VARCHAR(50),
    @dni_dueno VARCHAR(8),
    @telefono_dueno BIGINT,
    @email_dueno VARCHAR(50),
    @direccion_dueno VARCHAR(50)
AS
BEGIN
    INSERT INTO Dueno (id_dueno, nombre_dueno, apellido_dueno, dni_dueno, telefono_dueno, email_dueno, direccion_dueno)
    VALUES (@id_dueno, @nombre_dueno, @apellido_dueno, @dni_dueno, @telefono_dueno, @email_dueno, @direccion_dueno);
END;

GO;
CREATE PROCEDURE InsertarEspecialidad
    @id INT,
    @nombre VARCHAR(30)
AS
BEGIN
    INSERT INTO Especialidad (id_especialidad, nombre_especialidad)
    VALUES (@id, @nombre);
END;

GO;
CREATE PROCEDURE InsertarLaboratorio
    @id_laboratorio INT,
    @nombre_lab VARCHAR(20)
AS
BEGIN
    INSERT INTO Laboratorio (id_laboratorio, nombre_lab)
    VALUES (@id_laboratorio, @nombre_lab);
END;

GO;
CREATE PROCEDURE InsertarMedicamento
    @id INT,
    @nombre_comercial VARCHAR(50),
    @monodroga_medic VARCHAR(50),
    @presentacion_medic VARCHAR(50),
    @id_laboratorio INT
AS
BEGIN
    INSERT INTO Medicamento (id_medicamento, nombre_comercial, monodroga_medic, presentacion_medic, id_laboratorio)
    VALUES (@id, @nombre_comercial, @monodroga_medic, @presentacion_medic, @id_laboratorio);
END;

GO;
CREATE PROCEDURE InsertarVeterinario
    @id INT,
    @nro_licProfesional INT,
    @nombre_profesional VARCHAR(30),
    @hora_entrada TIME,
    @hora_salida TIME,
    @id_especialidad INT
AS
BEGIN
    INSERT INTO Veterinario (id_veterinario, nro_licProfesional, nombre_profesional, hora_entrada, hora_salida, id_especialidad)
    VALUES (@id, @nro_licProfesional, @nombre_profesional, @hora_entrada, @hora_salida, @id_especialidad);
END;


GO;
CREATE PROCEDURE InsertarCitaMedica
    @id_citaMedica INT,
    @fecha_citaMedica DATE,
    @observaciones_citaMedica VARCHAR(70),
    @usuario VARCHAR(50),
    @motivo_visita VARCHAR(50),
    @id_mascota INT,
    @id_veterinario INT
AS
BEGIN
    INSERT INTO CitasMedica (id_citaMedica, fecha_citaMedica, observaciones_citaMedica, usuario, motivo_visita, id_mascota, id_veterinario)
    VALUES (@id_citaMedica, @fecha_citaMedica, @observaciones_citaMedica, @usuario, @motivo_visita, @id_mascota, @id_veterinario);
END;

GO;
CREATE PROCEDURE InsertarTratamiento
    @id_tratamiento INT,
    @nombre_tratamiento VARCHAR(50),
    @inicio_tratamiento DATE,
    @fin_tratamiento DATE,
    @id_citaMedica INT
AS
BEGIN
    INSERT INTO Tratamiento (id_tratamiento, nombre_tratamiento, inicio_tratamiento, fin_tratamiento, id_citaMedica)
    VALUES (@id_tratamiento, @nombre_tratamiento, @inicio_tratamiento, @fin_tratamiento, @id_citaMedica);
END;

GO;
CREATE PROCEDURE InsertarTratamientoMedicamento
    @id_medicamento INT,
    @id_tratamiento INT,
    @id_citaMedica INT
AS
BEGIN
    INSERT INTO Tratamiento_medicamento (id_medicamento, id_tratamiento, id_citaMedica)
    VALUES (@id_medicamento, @id_tratamiento, @id_citaMedica);
END;

GO;
CREATE PROCEDURE ObtenerEspeciePorID
    @id_especie INT
AS
BEGIN
    SELECT * FROM Especie WHERE id_especie = @id_especie;
END;

GO;
CREATE PROCEDURE ObtenerRazaPorID
    @id_raza INT
AS
BEGIN
    SELECT * FROM Raza WHERE id_raza = @id_raza;
END;

GO;
CREATE PROCEDURE ObtenerDuenoPorDNI
    @dni VARCHAR(8)
AS
BEGIN
    SELECT * FROM Dueno WHERE dni_dueno = @dni;
END;

GO;
CREATE PROCEDURE ObtenerEspecialidadPorID
    @id_especialidad INT
AS
BEGIN
    SELECT * FROM Especialidad WHERE id_especialidad = @id_especialidad;
END;

GO;
CREATE PROCEDURE ObtenerLaboratorioPorID
    @id_laboratorio INT
AS
BEGIN
    SELECT * FROM Laboratorio WHERE id_laboratorio = @id_laboratorio;
END;

GO;
CREATE PROCEDURE ObtenerMascotaId
    @id_mascota INT
AS
BEGIN
    SELECT m.id_mascota, m.nombre_mascota, m.fecha_nacimiento, m.peso_mascota, 
           d.nombre_dueno, r.nombre_raza
    FROM Mascota m
    JOIN Dueno d ON m.id_dueno = d.id_dueno
    JOIN Raza r ON m.id_raza = r.id_raza
    WHERE m.id_mascota = @id_mascota;
END;

GO;
CREATE PROCEDURE ObtenerMedicamentoPorID
    @id_medicamento INT
AS
BEGIN
    SELECT * FROM Medicamento WHERE id_medicamento = @id_medicamento;
END;

GO;
CREATE PROCEDURE ObtenerVeterinarioPorNroLicencia
    @nro_licencia INT
AS
BEGIN
    SELECT * FROM Veterinario WHERE nro_licProfesional = @nro_licencia;
END;


GO;
CREATE PROCEDURE ObtenerCitaMedicaPorID
    @id_citaMedica INT
AS
BEGIN
    SELECT * FROM CitasMedica WHERE id_citaMedica = @id_citaMedica;
END;
