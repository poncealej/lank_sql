USE Lank;

CREATE TABLE IF NOT EXISTS RegistroCambios (
CambiosID INT PRIMARY KEY AUTO_INCREMENT, 
accion VARCHAR(255), 
usuario VARCHAR(255),
tabla_afectada VARCHAR(255), 
fecha_hora TIMESTAMP
); 




DROP TRIGGER IF EXISTS RegistroCambiosUsuarios;
CREATE TRIGGER RegistroCambiosUsuarios
AFTER INSERT  ON Usuarios
FOR EACH ROW

       INSERT INTO RegistroCambios (accion, tabla_afectada, fecha)
        VALUES ('INSERT', "Usuarios", CURRENT_USER(), NOW());

DELIMITER //
CREATE TRIGGER ActualizarFechaRegistro
BEFORE INSERT ON Usuarios
FOR EACH ROW
BEGIN
    SET NEW.fecha_de_registro = NOW();
    IF Fecha_de_registro = NOW() THEN 
    SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "No tiene permiso para realizar este cambio"; 
    END IF ;
END//
DELIMITER ;



DELIMITER //
CREATE TRIGGER ValidarCantidadSuscripcionesPorUsuario
BEFORE INSERT ON suscripciones
FOR EACH ROW
BEGIN
    DECLARE cantidad_suscripciones INT;
    SET cantidad_suscripciones = (SELECT COUNT(*) FROM suscripciones WHERE userID = NEW.userID);
    IF cantidad_suscripciones >= 1 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El usuario ya tiene una suscripción activa';
        ELSE 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El usuario no tiene una suscripción activa';
    END IF;
END//
DELIMITER ;