--Pasa saber si esta en modo mixto 
EXEC xp_instance_regread 
    N'HKEY_LOCAL_MACHINE', 
    N'SOFTWARE\Microsoft\MSSQLServer\MSSQLServer', 
    N'LoginMode';

--Manejo de permisos a nivel de usuarios

--Crear dos usuarios de base de datos:

USE gestion_veterinaria;
GO

---Crear el usuario admin_usuario---
CREATE LOGIN admin_usuario WITH PASSWORD = 'Admin1234';
CREATE USER admin_usuario FOR LOGIN admin_usuario;

---Crear el usuario lectura_usuario---
CREATE LOGIN lectura_usuario WITH PASSWORD = 'Lectura1234';
CREATE USER lectura_usuario FOR LOGIN lectura_usuario;

--Asignar permisos:

--Permisos de administrador (db_owner).
--Esto da permisos de administrador (acceso total) al usuario admin_usuario.
ALTER ROLE db_owner ADD MEMBER admin_usuario;

--Permisos de solo lectura (db_datareader).
--Esto le permite realizar consultas SELECT, pero no puede modificar los datos.
ALTER ROLE db_datareader ADD MEMBER lectura_usuario;

-- Crear el procedimiento almacenado:
CREATE PROCEDURE ObtenerDuenoPorDNI
    @dni VARCHAR(8)
AS
BEGIN
    SELECT * 
    FROM dueno
    WHERE dni_dueno = @dni;
END; 

-- otorgamos el permiso de ejecución del procedimiento al usuario lectura_usuario:
GRANT EXECUTE ON ObtenerDuenoPorDNI TO lectura_usuario;


