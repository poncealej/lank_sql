DELIMITER //
CREATE PROCEDURE EliminarUsuario(IN userID INT)
BEGIN
    DELETE FROM Usuarios WHERE userID = userID;
END//
DELIMITER ;


DELIMITER //
CREATE PROCEDURE ActualizarCorreoUsuario(
    IN userID INT,
    IN nuevo_correo_electronico VARCHAR(255)
)
BEGIN
    UPDATE Usuarios SET correo_electronico = nuevo_correo_electronico WHERE userID = userID;
END//
DELIMITER ;