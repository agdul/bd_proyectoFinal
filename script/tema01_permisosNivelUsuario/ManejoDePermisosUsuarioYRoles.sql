--Pasa saber si esta en modo mixto 
EXEC xp_instance_regread 
    N'HKEY_LOCAL_MACHINE', 
    N'SOFTWARE\Microsoft\MSSQLServer\MSSQLServer', 
    N'LoginMode';

--Manejo de permisos a nivel de usuarios
USE gestion_veterinaria;
GO

--Crear Usuario:

---Crear el usuario admin_usuario---
CREATE USER admin_usuario FOR LOGIN admin_usuario;
CREATE LOGIN admin_usuario WITH PASSWORD = 'Admin1234';

---Crear el usuario lectura_usuario---
CREATE USER lectura_usuario FOR LOGIN lectura_usuario;
CREATE LOGIN lectura_usuario WITH PASSWORD = 'Lectura1234';

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

CREATE PROCEDURE InsertarDueno
    @nombre_dueno VARCHAR(50),
    @apellido_dueno VARCHAR(50),
    @dni_dueno VARCHAR(8),
    @telefono_dueno BIGINT,
    @email_dueno VARCHAR(50),
    @direccion_dueno VARCHAR(50)
AS
BEGIN
    INSERT INTO Dueno (nombre_dueno, apellido_dueno, dni_dueno, telefono_dueno, email_dueno, direccion_dueno)
    VALUES (@nombre_dueno, @apellido_dueno, @dni_dueno, @telefono_dueno, @email_dueno, @direccion_dueno);
END;

-- otorgamos el permiso de ejecución del procedimiento al usuario lectura_usuario:
GRANT EXECUTE ON ObtenerDuenoPorDNI TO lectura_usuario;

GRANT EXECUTE ON InsertarDueno TO lectura_usuario;


--Manejo de permisos a nivel de Rol

-- Crear los usuarios
CREATE LOGIN user_role1 WITH PASSWORD = 'RoleUser123';
CREATE LOGIN user_role2 WITH PASSWORD = 'RoleUser456';
CREATE USER user_role1 FOR LOGIN user_role1;
CREATE USER user_role2 FOR LOGIN user_role2;

--  crear un rol con permisos de solo lectura sobre la tabla dueno.
CREATE ROLE RolSoloLectura;
GRANT SELECT ON dueno TO RolSoloLectura;

-- Asignar RolSoloLectura a uno de los usuarios
ALTER ROLE RolSoloLectura ADD MEMBER user_role1;