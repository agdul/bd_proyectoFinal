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

