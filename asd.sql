--CREATE DATABASE gestion_veterinaria;
--GO
--USE gestion_veterinaria;
--GO
-- Corrección: cambio de nombre de la tabla dueño a dueno
CREATE TABLE Especie
(
  id_especie INT NOT NULL,
  nombre_especie VARCHAR(30) NOT NULL,
  CONSTRAINT PK_especie_id PRIMARY KEY (id_especie)
);

CREATE TABLE Raza
(
  id_raza INT NOT NULL,
  nombre_raza VARCHAR(30) NOT NULL,
  id_especie INT NOT NULL,
  CONSTRAINT PK_raza_id PRIMARY KEY (id_raza),
  CONSTRAINT FK_raza_id_especie FOREIGN KEY (id_especie) REFERENCES Especie(id_especie)
);

CREATE TABLE dueno
(
  id_dueno INT NOT NULL,
  nombre_dueno VARCHAR(50) NOT NULL,
  apellido_dueno VARCHAR(50) NOT NULL,
  dni_dueno VARCHAR(10) NOT NULL,
  telefono_dueno BIGINT NOT NULL,  -- Cambio a BIGINT para evitar errores con números grandes
  email_dueno VARCHAR(50) NOT NULL,
  direccion_dueno VARCHAR(50) NOT NULL,
  CONSTRAINT PK_dueno_id PRIMARY KEY (id_dueno),
  CONSTRAINT UQ_dueno_dni UNIQUE (dni_dueno),
  CONSTRAINT UQ_dueno_telefono UNIQUE (telefono_dueno),
  CONSTRAINT UQ_dueno_email UNIQUE (email_dueno)
);

CREATE TABLE Especialidad
(
  id_especialidad INT NOT NULL,
  nombre_especialidad VARCHAR(30) NOT NULL,
  CONSTRAINT PK_especialidad_id PRIMARY KEY (id_especialidad)
);

CREATE TABLE Laboratorio
(
  id_laboratorio INT NOT NULL,
  nombre_lab VARCHAR(20) NOT NULL,
  CONSTRAINT PK_laboratorio_id PRIMARY KEY (id_laboratorio)
);

CREATE TABLE Mascota
(
  id_mascota INT NOT NULL,
  nombre_mascota VARCHAR(10) NOT NULL,
  fecha_nacimiento DATE NOT NULL,
  peso_mascota FLOAT NOT NULL,
  condicion_mascota VARCHAR(50),
  id_dueno INT NOT NULL,
  id_raza INT NOT NULL,
  CONSTRAINT PK_mascota_id PRIMARY KEY (id_mascota),
  CONSTRAINT FK_mascota_id_dueno FOREIGN KEY (id_dueno) REFERENCES dueno(id_dueno),
  CONSTRAINT FK_mascota_id_raza FOREIGN KEY (id_raza) REFERENCES Raza(id_raza)
);

CREATE TABLE Medicamento
(
  id_medicamento INT NOT NULL,
  nombre_comercial VARCHAR(50) NOT NULL,
  monodroga_medic VARCHAR(50) NOT NULL,
  presentacion_medic VARCHAR(50) NOT NULL,
  id_laboratorio INT NOT NULL,
  CONSTRAINT PK_medicamento_id PRIMARY KEY (id_medicamento),
  CONSTRAINT FK_medicamento_id_laboratorio FOREIGN KEY (id_laboratorio) REFERENCES Laboratorio(id_laboratorio)
);

-- Corrección: hora_entrada y hora_salida deben ser TIME
CREATE TABLE Veterinario
(
  id_veterinario INT NOT NULL,
  nro_licProfesional INT NOT NULL,
  nombre_profesional VARCHAR(30) NOT NULL,
  hora_entrada TIME NOT NULL,  -- Corrección a TIME
  hora_salida TIME NOT NULL,   -- Corrección a TIME
  id_especialidad INT,
  CONSTRAINT PK_veterinario_id PRIMARY KEY (id_veterinario),
  CONSTRAINT FK_veterinario_id_especialidad FOREIGN KEY (id_especialidad) REFERENCES Especialidad(id_especialidad),
  CONSTRAINT UQ_veterinario_nro UNIQUE (nro_licProfesional)
);

CREATE TABLE CitasMedica
(
  id_citaMedica INT NOT NULL,
  fecha_citaMedica DATE NOT NULL, -- Corrección: fecha predeterminada con GETDATE()
  observaciones_citaMedica VARCHAR(70) NOT NULL,
  usuario VARCHAR(50) NOT NULL, -- Corrección de SYSTEM_USER a USER_NAME()
  motivo_visita VARCHAR(50) NOT NULL,
  id_mascota INT NOT NULL,
  id_veterinario INT NOT NULL,
  CONSTRAINT PK_citasmedicas_id PRIMARY KEY (id_citaMedica),
  CONSTRAINT FK_citasmedicas_id_mascota FOREIGN KEY (id_mascota) REFERENCES Mascota(id_mascota),
  CONSTRAINT FK_citasmedicas_id_veterinario FOREIGN KEY (id_veterinario) REFERENCES Veterinario(id_veterinario)
);

CREATE TABLE Tratamiento
(
  id_tratamiento INT NOT NULL,
  nombre_tratamiento VARCHAR(50),
  inicio_tratamiento DATE NOT NULL,
  fin_tratamiento DATE NOT NULL,
  id_citaMedica INT NOT NULL,
  CONSTRAINT PK_tratamiento_id PRIMARY KEY (id_tratamiento, id_citaMedica),
  CONSTRAINT FK_tratamiento_id_cita FOREIGN KEY (id_citaMedica) REFERENCES CitasMedica(id_citaMedica)
);

CREATE TABLE Tratamiento_medicamento
(
  id_medicamento INT NOT NULL,
  id_tratamiento INT NOT NULL,
  id_citaMedica INT NOT NULL,
  CONSTRAINT PK_tratamiento_medicamento_id PRIMARY KEY (id_medicamento, id_tratamiento, id_citaMedica),
  CONSTRAINT FK_tratamiento_medicamento_id_medicamento FOREIGN KEY (id_medicamento) REFERENCES Medicamento(id_medicamento),
  CONSTRAINT FK_tratamiento_medicamento_id_tratamiento FOREIGN KEY (id_tratamiento, id_citaMedica) REFERENCES Tratamiento(id_tratamiento, id_citaMedica),
  CONSTRAINT FK_tratamiento_medicamento_id_citaMedica FOREIGN KEY (id_citaMedica) REFERENCES CitasMedica(id_citaMedica)
);
-- Restricciones
ALTER TABLE CitasMedica ADD CONSTRAINT DF_citasMedica_fecha_citamedica DEFAULT GETDATE() FOR fecha_citaMedica;

alter table dueno add constraint chk_dni check(len(dni_dueno) =8 and isnumeric(dni_dueno) = 1)

ALTER TABLE mascota
ADD CONSTRAINT CK_mascota_fecha_nacimiento
CHECK (fecha_nacimiento >= DATEADD(YEAR, -30, GETDATE()));

ALTER TABLE CitasMedica ADD CONSTRAINT DF_citasmedicas_usario DEFAULT SYSTEM_USER FOR usuario;
-- Inserciones corregidas
INSERT INTO Especie (id_especie, nombre_especie)
VALUES (1, 'Canina'), (2, 'Felina');



INSERT INTO Raza (id_raza, nombre_raza, id_especie)
VALUES (1, 'Labrador', 1), (2, 'Persa', 2);

SELECT * FROM Raza;

INSERT INTO dueno (id_dueno, nombre_dueno, apellido_dueno, dni_dueno, telefono_dueno, email_dueno, direccion_dueno)
VALUES 
(1, 'Juan', 'Pérez', '12345678', 1234567890, 'juan@example.com', 'Calle 123'),
(2, 'Ana', 'García', '87654321', 9876543210, 'ana@example.com', 'Avenida Siempre Viva 123');

INSERT INTO Especialidad (id_especialidad, nombre_especialidad)
VALUES (1, 'Cirugía'), (2, 'Cardiología');

INSERT INTO Laboratorio (id_laboratorio, nombre_lab)
VALUES (1, 'Laboratorios XYZ'), (2, 'Laboratorios ABC');

INSERT INTO Mascota (id_mascota, nombre_mascota, fecha_nacimiento, peso_mascota, condicion_mascota, id_dueno, id_raza)
VALUES 
(1, 'Rex', '2020-01-01', 30.5, 'Sano', 1, 1),
(2, 'Misi', '2019-05-05', 5.2, 'Enfermo', 2, 2);

INSERT INTO Medicamento (id_medicamento, nombre_comercial, monodroga_medic, presentacion_medic, id_laboratorio)
VALUES 
(1, 'Paracetamol', 'Paracetamol', 'Tableta', 1),
(2, 'Ibuprofeno', 'Ibuprofeno', 'Jarabe', 2);

-- Inserción con TIME para horas
INSERT INTO Veterinario (id_veterinario, nro_licProfesional, nombre_profesional, hora_entrada, hora_salida, id_especialidad)
VALUES 
(1, 12345, 'Dr. Smith', '08:00', '16:00', 1),
(2, 67890, 'Dra. López', '09:00', '17:00', 2);

INSERT INTO CitasMedica (id_citaMedica, fecha_citaMedica, observaciones_citaMedica, usuario, motivo_visita, id_mascota, id_veterinario)
VALUES 
(1, GETDATE(), 'Revisión general', USER_NAME(), 'Chequeo', 1, 1),
(2, GETDATE(), 'Dolor de estómago', USER_NAME(), 'Consulta', 2, 2);

INSERT INTO Tratamiento (id_tratamiento, nombre_tratamiento, inicio_tratamiento, fin_tratamiento, id_citaMedica)
VALUES 
(1, 'Tratamiento A', '2024-01-01', '2024-01-15', 1),
(2, 'Tratamiento B', '2024-01-01', '2024-01-10', 2);

INSERT INTO Tratamiento_medicamento (id_medicamento, id_tratamiento, id_citaMedica)
VALUES 
(1, 1, 1),
(2, 2, 2);

SELECT * FROM Especie;
SELECT * FROM Raza;
SELECT * FROM dueno;
SELECT * FROM Especialidad;
SELECT * FROM Laboratorio;
SELECT * FROM Mascota;
SELECT * FROM Medicamento;
SELECT * FROM Veterinario;
SELECT * FROM CitasMedica;
SELECT * FROM Tratamiento;
SELECT * FROM Tratamiento_medicamento;

exec sp_help Raza


-- Insertar datos de Especie
INSERT INTO Especie (id_especie, nombre_especie)
VALUES 
(1, 'Canina'), 
(2, 'Felina');


-- Insertar datos de Raza
INSERT INTO Raza (id_raza, nombre_raza, id_especie)
VALUES 
(1, 'Labrador', 1), 
(2, 'Persa', 2),
(3, 'Bulldog', 1),
(4, 'Siamés', 2),
(5, 'Golden Retriever', 1),
(6, 'Sphynx', 2);


-- Insertar datos de Dueños
DECLARE @i INT = 1;
WHILE @i <= 100
BEGIN
    delete from dueno
	where id_dueno = @i;
    SET @i = @i + 1;
END;