--Casos de prueba para manejo de permisos a nivel de usuarios

--Caso de prueba para admnistrador 

--Este insert se realizo dentro del usuario como adminisrador 
INSERT INTO dueno (nombre_dueno, apellido_dueno, dni_dueno, telefono_dueno, email_dueno, direccion_dueno)
VALUES ('Pedro', 'Lopez', '12345918', 1234567890, 'pedro.lopez@mail.com', 'Calle 123');

select *from dueno where nombre_dueno = 'pedro'

--Caso de prueba para Lectura

--Este insert se realizo dentro del usuario como lectura 
INSERT INTO dueno (nombre_dueno, apellido_dueno, dni_dueno, telefono_dueno, email_dueno, direccion_dueno)
VALUES ('Ana', 'Garcia', '87654321', 9876543210, 'ana.garcia@mail.com', 'Avenida 456');

EXEC InsertarDueno 
  @nombre_dueno = 'Ana',
  @apellido_dueno = 'Garcia',
  @dni_dueno = '87654321',
  @telefono_dueno = 9876543210,
  @email_dueno = 'ana.garcia@mail.com',
  @direccion_dueno = 'Avenida 456';


--Este usuario puede ejecutar el procedimiento, ya que se le otorgó el permiso de ejecución, pero no podrá realizar INSERT 
--directamente en la tabla.
EXEC ObtenerDuenoPorDNI @dni = '12345678';


--Casos de prueba para manejo de permisos a nivel de rol

SELECT * FROM dueno;

