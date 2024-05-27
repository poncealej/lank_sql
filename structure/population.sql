USE Lank; 

-- Agregar datos a la tabla Usuarios
INSERT INTO Usuarios (nombre, correo_electronico, contrasena, fecha_de_registro)
VALUES 
('Juan Perez', 'juan@example.com', 'contraseña1', '2024-01-01'),
('María López', 'maria@example.com', 'contraseña2', '2024-01-02'),
('Pedro Ramirez', 'pedro@example.com', 'contraseña3', '2024-01-03'),
('Ana Martinez', 'ana@example.com', 'contraseña4', '2024-01-04'),
('Carlos Rodriguez', 'carlos@example.com', 'contraseña5', '2024-01-05'),
('Laura Gomez', 'laura@example.com', 'contraseña6', '2024-01-06'),
('Sofia Diaz', 'sofia@example.com', 'contraseña7', '2024-01-07'),
('Diego Sanchez', 'diego@example.com', 'contraseña8', '2024-01-08'),
('Elena Fernandez', 'elena@example.com', 'contraseña9', '2024-01-09'),
('Javier Ruiz', 'javier@example.com', 'contraseña10', '2024-01-10');

-- Agregar datos a la tabla Suscripciones
INSERT INTO suscripciones (userID, fecha_de_inicio, fecha_de_vencimiento)
VALUES 
(1, '2024-01-01', '2024-02-01'),
(2, '2024-01-02', '2024-02-02'),
(3, '2024-01-03', '2024-02-03'),
(4, '2024-01-04', '2024-02-04'),
(5, '2024-01-05', '2024-02-05'),
(6, '2024-01-06', '2024-02-06'),
(7, '2024-01-07', '2024-02-07'),
(8, '2024-01-08', '2024-02-08'),
(9, '2024-01-09', '2024-02-09'),
(10, '2024-01-10', '2024-02-10');




-- Agregar datos a la tabla Medios_de_Pago
INSERT INTO Medios_de_Pago (nombre_medio)
VALUES 
('Tarjeta de crédito'),
('Transferencia bancaria'),
('Tarjeta de débito'),
('Tarjeta prepaga');


-- Agregar datos a la tabla Empresa
INSERT INTO Empresa (empresaID, nombre_empresa, direccion, telefono, correo_electronico)
VALUES 
(1, 'Lank', 'Calle 123', '123456789', 'Lank@empresaA.com');




-- Agregar datos a la tabla Facturacion
INSERT INTO Facturacion (userID, medioID, empresaID, subscriptionID, monto, fecha)
VALUES 
(1, 1, 1, 1, 100.00, '2024-01-01'),
(2, 2, 1, 2, 150.00, '2024-01-02'),
(3, 3, 1, 3, 200.00, '2024-01-03'),
(4, 4, 1, 4, 250.00, '2024-01-04'),
(5, 4, 1, 5, 300.00, '2024-01-05'),
(6, 3, 1, 6, 350.00, '2024-01-06'),
(7, 3, 1, 7, 400.00, '2024-01-07'),
(8, 2, 1, 8, 450.00, '2024-01-08'),
(9, 2, 1, 9, 500.00, '2024-01-09'),
(10, 1, 1, 10, 550.00, '2024-01-10');




-- Agregar datos a la tabla Plataformas

INSERT INTO Plataformas (nombre_plataforma)
VALUES 
('AppleMusic'),
('AppleOne'),
('AppleTV+'),
('AppleTV+ MLS Season Pass'),
('AppleTV+ MLS Season Pass'),
('AppleTV+ MLS Season Pass'),
('AppleTV+ MLS Season Pass'),
('AppleTV+ MLS Season Pass'),
('AtresPlayer'),
('Avast'),
('Calm'),
('CanvaPro'),
('Combo+'),
('Crunchyroll'),
('Curiosity4K'),
('CyberGhost'),
('Deezer'),
('DirecTVGO Basico'),
('DirecTVGO Full'),
('Disney+'),
('Duolingo'),
('ExpressVPN'),
('Funimation'),
('Gaia'),
('GoogleOne'),
('HBOMax'),
('Lionsgate'),
('MasterClass'),
('MAX Estandar'),
('MAX Platino'),
('MLS'),
('MUBI'),
('NBA league pass Premium'),
('Netflix HD'),
('Netflix Ultra HD 4K'),
('Netflix+ (Miembro Extra)'),
('NintendoSwitch'),
('NintendoSwitch Expansión'),
('Nord VPN'),
('Office365'),
('Paramount+'),
('Platzi'),
('PrimeVideo'),
('Proton Family'),
('Qobuz'),
('Scribd'),
('Spotify'),
('Star+'),
('Surfashak One'),
('Surshack Starter'),
('TidalHiFi'),
('TidalHiFiPlus'),
('TunnelBearVPN'),
('Viki Pass'),
('VIX'),
('WWENetwork'),
('YouTube');


-- Agregar datos a la tabla Ventas
INSERT INTO Ventas (userID, medioID, PlataformaID,cantidad, monto_total, fecha_venta)
VALUES 
(1, 1, 1, 1, 50.00, '2024-01-01 12:00:00'),
(2, 2, 2, 2, 75.00, '2024-01-02 13:00:00'),
(3, 3, 3, 3, 100.00, '2024-01-03 14:00:00'),
(4, 4, 4, 4, 125.00, '2024-01-04 15:00:00');

