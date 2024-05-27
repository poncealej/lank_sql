-- Vista de Usuarios con Suscripciones

CREATE VIEW VistaUsuariosConSuscripciones AS
SELECT 
    u.userID,
    u.nombre,
    u.correo_electronico,
    s.tipo_de_suscripcion,
    s.fecha_de_inicio,
    s.fecha_de_vencimiento
    FROM Usuarios u
JOIN suscripciones s ON u.userID = s.userID;

-- Vista de Facturación Detallada

CREATE VIEW VistaFacturacionDetallada AS
SELECT 
    f.facturaID,
    u.nombre AS nombre_usuario,
    e.nombre_empresa,
    m.nombre_medio,
    f.monto,
    f.fecha
FROM Facturacion f
JOIN Usuarios u ON f.userID = u.userID
JOIN Empresa e ON f.empresaID = e.empresaID
JOIN Medios_de_Pago m ON f.medioID = m.medioID;

-- Vista de Ventas por Plataforma

CREATE VIEW VistaVentasPorPlataforma AS
SELECT 
    p.nombre_plataforma,
    COUNT(v.ventaID) AS total_ventas,
    SUM(v.monto_total) AS monto_total_ventas
FROM Ventas v
JOIN Plataformas p ON v.PlataformaID = p.PlataformaID
GROUP BY p.nombre_plataforma;


-- Vistar con plataformas más vendidas 
 
CREATE VIEW VistaPlataformaMasVentas AS
SELECT 
    p.nombre_plataforma,
    COUNT(v.ventaID) AS total_ventas,
    SUM(v.monto_total) AS monto_total_ventas
FROM Ventas v
JOIN Plataformas p ON v.PlataformaID = p.PlataformaID
GROUP BY p.nombre_plataforma
ORDER BY total_ventas DESC
LIMIT 1;

-- Vista de Medios de Pago más Utilizados

CREATE VIEW VistaMediosDePagoUtilizados AS
SELECT 
    m.nombre_medio,
    COUNT(f.facturaID) AS total_utilizado
FROM Facturacion f
JOIN Medios_de_Pago m ON f.medioID = m.medioID
GROUP BY m.nombre_medio
ORDER BY total_utilizado DESC;
