USE Lank;

DELIMITER //
CREATE FUNCTION UsuarioTieneSuscripcionActiva(userID INT) 
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE suscripcion_activa BOOLEAN;
    SELECT EXISTS(SELECT 1 FROM Suscripciones WHERE userID = userID AND CURDATE() BETWEEN fecha_de_inicio AND fecha_de_vencimiento) INTO suscripcion_activa;
    RETURN suscripcion_activa;
END//
DELIMITER ;

DELIMITER //
CREATE FUNCTION ObtenerPlataformaMasVendida(P_PlataformaID INT) 
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE plataforma_mas_vendida VARCHAR(255);
    SELECT nombre_plataforma INTO plataforma_mas_vendida 
    FROM Plataformas WHERE PlataformaID = (SELECT PlataformaID FROM Ventas WHERE PlataformaID = P_PlataformaID
    GROUP BY PlataformaID ORDER BY COUNT(*) DESC LIMIT 1);
    RETURN plataforma_mas_vendida;
END//
DELIMITER ;
