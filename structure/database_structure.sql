DROP DATABASE IF EXISTS Lank; -- DATABASE IF EXISTS

CREATE DATABASE Lank; 

USE Lank; 

-- Crear la tabla de Usuarios

CREATE TABLE Usuarios (
    userID INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255),
    correo_electronico VARCHAR(255),
    contrasena VARCHAR(255),
    telefono VARCHAR(20), 
    fecha_de_registro DATE,
    tipo_usuario VARCHAR(20) DEFAULT "Null",
    IDuser INT -- Hace referncia al tipo de usuario.
);

-- Suscripciones hace referencia al tiempo de la compras 
CREATE TABLE suscripciones (
    subscriptionID INT AUTO_INCREMENT PRIMARY KEY,
    userID INT,
    tipo_de_suscripcion VARCHAR(255),
    fecha_de_inicio DATE,
    fecha_de_vencimiento DATE,
    FOREIGN KEY (userID) REFERENCES Usuarios(userID)
);


-- Hace referencia a usuarios que se unieron a grupos. 
CREATE TABLE Grupos (
    groupID INT AUTO_INCREMENT, 
    userID INT,
    PRIMARY KEY (groupID, userID),
    FOREIGN KEY (userID) REFERENCES Usuarios(userID)
);

-- Crear la tabla de Empresa

CREATE TABLE Empresa (
    empresaID INT PRIMARY KEY,
    nombre_empresa VARCHAR(255),
    direccion VARCHAR(255),
    telefono VARCHAR(20),
    correo_electronico VARCHAR(255)
);

-- Crear la tabla de Medios de Pago
CREATE TABLE Medios_de_Pago (
    medioID INT AUTO_INCREMENT PRIMARY KEY,
    nombre_medio VARCHAR(255)
    
);
-- Crear la tabla de Facturación

CREATE TABLE Facturacion (
    facturaID INT AUTO_INCREMENT PRIMARY KEY,
    userID INT,
    medioID INT, 
    empresaID INT,
    subscriptionID INT,
    monto DECIMAL(10, 2),
    fecha DATE,
    FOREIGN KEY (userID) REFERENCES Usuarios(userID),
    FOREIGN KEY (empresaID) REFERENCES Empresa(empresaID),
    FOREIGN KEY (subscriptionID) REFERENCES Suscripciones(subscriptionID),
    FOREIGN KEY (medioID) REFERENCES Medios_de_Pago(medioID)
);

-- Crear tabla plataformas 

CREATE TABLE Plataformas (
    PlataformaID INT AUTO_INCREMENT PRIMARY KEY,
    nombre_plataforma VARCHAR(255)
);

-- Crear tablas ventas 

CREATE TABLE Ventas (
    ventaID INT AUTO_INCREMENT PRIMARY KEY,
    userID INT,
    medioID INT, 
    PlataformaID INT,
    cantidad INT,
    monto_total DECIMAL(10, 2),
    fecha_venta DATETIME, -- Cambio a DATETIME para incluir la hora de la compra
    FOREIGN KEY (userID) REFERENCES Usuarios(userID),
    FOREIGN KEY (medioID) REFERENCES Medios_de_Pago(medioID),
    FOREIGN KEY (plataformaID) REFERENCES plataformas(plataformaID)
);




-- Lo de FK que está arriba se puede hacer reemplazando lo de Altertable 

/*-- Modificar las restricciones de clave externa en la tabla Usuarios
ALTER TABLE Usuarios ADD CONSTRAINT fk_userID FOREIGN KEY (userID) REFERENCES Usuarios(userID);

-- Modificar las restricciones de clave externa en la tabla suscripciones
ALTER TABLE suscripciones ADD CONSTRAINT fk_userID FOREIGN KEY (IDuser) REFERENCES Usuarios(userID);

-- Modificar las restricciones de clave externa en la tabla owner_d
ALTER TABLE owner_d ADD CONSTRAINT fk_userID FOREIGN KEY (userID) REFERENCES Usuarios(userID);

-- Modificar las restricciones de clave externa en la tabla Suscriptores
ALTER TABLE Suscriptores ADD CONSTRAINT fk_groupID FOREIGN KEY (groupID) REFERENCES Owner_d(groupID);
ALTER TABLE Suscriptores ADD CONSTRAINT fk_userID FOREIGN KEY (userID) REFERENCES Usuarios(userID);

-- Modificar las restricciones de clave externa en la tabla Facturacion
ALTER TABLE Facturacion ADD CONSTRAINT fk_userID FOREIGN KEY (userID) REFERENCES Usuarios(userID);
ALTER TABLE Facturacion ADD CONSTRAINT fk_empresaID FOREIGN KEY (empresaID) REFERENCES Empresa(empresaID);
ALTER TABLE Facturacion ADD CONSTRAINT fk_subscriptionID FOREIGN KEY (subscriptionID) REFERENCES suscripciones(subscriptionID);
ALTER TABLE Facturacion ADD CONSTRAINT fk_medioID FOREIGN KEY (medioID) REFERENCES Medios_de_Pago(medioID);

-- Modificar las restricciones de clave externa en la tabla Ventas
ALTER TABLE Ventas ADD CONSTRAINT fk_userID FOREIGN KEY (userID) REFERENCES Usuarios(userID);
ALTER TABLE Ventas ADD CONSTRAINT fk_medioID FOREIGN KEY (medioID) REFERENCES Medios_de_Pago(medioID)); */
