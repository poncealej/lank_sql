USE mysql;

CREATE ROLE IF NOT EXISTS todos_los_permisos;
CREATE ROLE IF NOT EXISTS solo_lectura;
CREATE ROLE IF NOT EXISTS lectura_insercion;

GRANT ALL PRIVILEGES ON Lank.* TO todos_los_permisos;
GRANT SELECT ON Lank.* TO solo_lectura;
GRANT SELECT, INSERT ON Lank.* TO lectura_insercion;


CREATE USER IF NOT EXISTS 'Ale'@'%' IDENTIFIED BY '111';
CREATE USER IF NOT EXISTS 'Euge'@'%' IDENTIFIED BY '222';
CREATE USER IF NOT EXISTS 'Guada'@'%' IDENTIFIED BY '333';

GRANT todos_los_permisos TO 'Ale'@'%';
GRANT solo_lectura TO 'Euge'@'%';
GRANT lectura_insercion TO 'Guada'@'%';

SET DEFAULT ROLE todos_los_permisos TO 'Ale'@'%';
SET DEFAULT ROLE solo_lectura TO 'Euge'@'%';
SET DEFAULT ROLE lectura_insercion TO 'Guada'@'%';