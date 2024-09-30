CREATE DATABASE gestion_veterinaria;

USE gestion_veterinaria;

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
  dni_dueno VARCHAR(8) NOT NULL,
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

--MODIFICACIONES A LA TABLA DUENO

ALTER TABLE Dueno ADD CONSTRAINT CK_dueno_dni CHECK (LEN(dni_dueno) = 8 AND ISNUMERIC(dni_dueno) = 1);

-- Restricciones
ALTER TABLE CitasMedica ADD CONSTRAINT DF_citasMedica_fecha_citamedica DEFAULT GETDATE() FOR fecha_citaMedica;

ALTER TABLE mascota
ADD CONSTRAINT CK_mascota_fecha_nacimiento
CHECK (fecha_nacimiento >= DATEADD(YEAR, -30, GETDATE()));

ALTER TABLE CitasMedica ADD CONSTRAINT DF_citasmedicas_usario DEFAULT SYSTEM_USER FOR usuario;

ALTER TABLE dueno 
ADD CONSTRAINT chk_dni 
CHECK(len(dni_dueno) = 8 and isnumeric(dni_dueno) = 1);

