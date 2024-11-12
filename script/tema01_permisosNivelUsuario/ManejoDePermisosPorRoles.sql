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



