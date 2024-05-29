## Diagrama entidad relación
<center>
<img src="/workspaces/lank_sql/Diagrama de entidad.png" style="width: 100% ; aspect-ratio:16/9">
</center>
## Listado de Tablas y Descripción

El script para la creación y definición de la base de datos se encuentra en el archivo database_structure.sql, ubicado en la carpeta structure.

A continuación se presenta la descripción de cada una de las tablas de la base de datos.

---

### Tabla `Usuarios`

| Campo               | Tipo         | Null | Key  | Default | Extra          |
|---------------------|--------------|------|------|---------|----------------|
| userID              | INT          | NO   | PRI  | NULL    | AUTO_INCREMENT |
| nombre              | VARCHAR(255) | YES  |      | NULL    |                |
| correo_electronico  | VARCHAR(255) | YES  |      | NULL    |                |
| contrasena          | VARCHAR(255) | YES  |      | NULL    |                |
| telefono            | VARCHAR(20)  | YES  |      | NULL    |                |
| fecha_de_registro   | DATE         | YES  |      | NULL    |                |
| tipo_usuario        | VARCHAR(20)  | YES  |      | "Null"  |                |
| IDuser              | INT          | YES  |      | NULL    |                |

### Tabla `Suscripciones`

| Campo               | Tipo         | Null | Key  | Default | Extra          |
|---------------------|--------------|------|------|---------|----------------|
| subscriptionID      | INT          | NO   | PRI  | NULL    | AUTO_INCREMENT |
| userID              | INT          | YES  | FK   | NULL    |                |
| tipo_de_suscripcion | VARCHAR(255) | YES  |      | NULL    |                |
| fecha_de_inicio     | DATE         | YES  |      | NULL    |                |
| fecha_de_vencimiento| DATE         | YES  |      | NULL    |                |

### Tabla `Grupos`

| Campo   | Tipo | Null | Key  | Default | Extra |
|---------|------|------|------|---------|-------|
| groupID | INT  | NO   | PRI  | NULL    |       |
| userID  | INT  | NO   | PRI  | NULL    | FK    |

### Tabla `Empresa`

| Campo           | Tipo         | Null | Key  | Default | Extra |
|-----------------|--------------|------|------|---------|-------|
| empresaID       | INT          | NO   | PRI  | NULL    |       |
| nombre_empresa  | VARCHAR(255) | YES  |      | NULL    |       |
| direccion       | VARCHAR(255) | YES  |      | NULL    |       |
| telefono        | VARCHAR(20)  | YES  |      | NULL    |       |
| correo_electronico | VARCHAR(255) | YES |    | NULL    |       |

### Tabla `Medios_de_Pago`

| Campo        | Tipo         | Null | Key  | Default | Extra          |
|--------------|--------------|------|------|---------|----------------|
| medioID      | INT          | NO   | PRI  | NULL    | AUTO_INCREMENT |
| nombre_medio | VARCHAR(255) | YES  |      | NULL    |                |

### Tabla `Facturacion`

| Campo         | Tipo          | Null | Key  | Default | Extra          |
|---------------|---------------|------|------|---------|----------------|
| facturaID     | INT           | NO   | PRI  | NULL    | AUTO_INCREMENT |
| userID        | INT           | YES  | FK   | NULL    |                |
| medioID       | INT           | YES  | FK   | NULL    |                |
| empresaID     | INT           | YES  | FK   | NULL    |                |
| subscriptionID| INT           | YES  | FK   | NULL    |                |
| monto         | DECIMAL(10,2) | YES  |      | NULL    |                |
| fecha         | DATE          | YES  |      | NULL    |                |

### Tabla `Plataformas`

| Campo            | Tipo         | Null | Key  | Default | Extra          |
|------------------|--------------|------|------|---------|----------------|
| PlataformaID     | INT          | NO   | PRI  | NULL    | AUTO_INCREMENT |
| nombre_plataforma| VARCHAR(255) | YES  |      | NULL    |                |

### Tabla `Ventas`

| Campo        | Tipo          | Null | Key  | Default | Extra          |
|--------------|---------------|------|------|---------|----------------|
| ventaID      | INT           | NO   | PRI  | NULL    | AUTO_INCREMENT |
| userID       | INT           | YES  | FK   | NULL    |                |
| medioID      | INT           | YES  | FK   | NULL    |                |
| PlataformaID | INT           | YES  | FK   | NULL    |                |
| cantidad     | INT           | YES  |      | NULL    |                |
| monto_total  | DECIMAL(10,2) | YES  |      | NULL    |                |
| fecha_venta  | DATETIME      | YES  |      | NULL    |                |

Estas tablas ahora tienen "FK" en lugar de "MUL" para las claves foráneas (foreign keys).


## Ingesta de Datos

* La ingesta de datos en las tablas se realiza por medio del archivo population.sql que se encuentra en la carpeta structure.

## Objetos de la Base de Datos

Los objetos de la base de dajos se encuentran en la carpeta objects, con un archivo sql para cada tipo de objeto, a saber:
- Funciones : funtions.sql
- Triggers : triggers.sql
- Prodecimientos almacenados : stored_procedures.sql
- Vistas : views.sql
- Roles, permisos y usuarios : roles_users.sql 

A continuación, se desarrolla la documentación de cada uno de ellos.

### Documentación de Funciones 

Listado de Funciones

1. Función: UsuarioTieneSuscripcionActiva

Descripción:
Esta función verifica si un usuario tiene una suscripción activa en la base de datos.

Parámetros:
userID (INT): El ID del usuario para el cual se desea verificar la suscripción.

Valor Retornado:
BOOLEAN: Retorna TRUE si el usuario tiene una suscripción activa, FALSE en caso contrario.

Ejemplo de Uso:
SELECT UsuarioTieneSuscripcionActiva(12345) AS SuscripcionActiva;

Muestra de Resultado:
+------------------+
| SuscripcionActiva|
+------------------+
| 1                |
+------------------+


2. Función: ObtenerPlataformaMasVendida

Descripción:
Esta función devuelve el nombre de la plataforma más vendida dado un PlataformaID.

Parámetros:
P_PlataformaID (INT): El ID de la plataforma para la cual se desea obtener la plataforma más vendida.

Valor Retornado:
VARCHAR(255): Retorna el nombre de la plataforma más vendida.

Ejemplo de Uso:
SELECT ObtenerPlataformaMasVendida(1) AS PlataformaMasVendida;

Muestra de Resultado:
+--------------------+
| PlataformaMasVendida |
+--------------------+
| PlayStation        |
+--------------------+

---

### Documentación de Triggers 

---

Listado de Triggers

1. Trigger: RegistroCambiosUsuarios

Descripción:
Este trigger se activa después de insertar un registro en la tabla `Usuarios`. Registra la acción, la tabla afectada, el usuario que realizó la acción y la fecha y hora en la tabla `RegistroCambios`.

Detalle:
Tipo: AFTER INSERT
Tabla: Usuarios

Ejemplo de Uso:
INSERT INTO Usuarios (nombre, email) VALUES ('Juan', 'juan@example.com');

Muestra de Resultado en RegistroCambios:
+----------+--------+-------------+----------------+---------------------+
| CambiosID| accion | usuario     | tabla_afectada | fecha_hora          |
+----------+--------+-------------+----------------+---------------------+
| 1        | INSERT | root@localhost | Usuarios       | 2024-05-28 10:45:30|
+----------+--------+-------------+----------------+---------------------+

2. Trigger: ActualizarFechaRegistro

Descripción:
Este trigger se activa antes de insertar un registro en la tabla `Usuarios`. Actualiza la columna `fecha_de_registro` con la fecha y hora actual. Si la fecha de registro es igual a la fecha actual, se lanza un error.

Detalle:
Tipo: BEFORE INSERT
Tabla: Usuarios

Ejemplo de Uso:
INSERT INTO Usuarios (nombre, email) VALUES ('Maria', 'maria@example.com');

Muestra de Resultado en Usuarios:
+--------+-------+--------------------+---------------------+
| userID | nombre| email              | fecha_de_registro   |
+--------+-------+--------------------+---------------------+
| 1      | Maria | maria@example.com  | 2024-05-28 10:45:30 |
+--------+-------+--------------------+---------------------+

Nota: Si la fecha de registro ya es igual a la fecha actual, se lanza un error:
Error: No tiene permiso para realizar este cambio

3. Trigger: ValidarCantidadSuscripcionesPorUsuario

Descripción:
Este trigger se activa antes de insertar un registro en la tabla `Suscripciones`. Verifica si un usuario ya tiene una suscripción activa y lanza un error si es así.

Detalle:
Tipo: BEFORE INSERT
Tabla: Suscripciones

Ejemplo de Uso:
INSERT INTO Suscripciones (userID, fecha_de_inicio, fecha_de_vencimiento) VALUES (12345, '2024-05-01', '2024-06-01');

Muestra de Resultado:
Si el usuario ya tiene una suscripción activa:
Error: El usuario ya tiene una suscripción activa

Si el usuario no tiene una suscripción activa (no se lanza error y se inserta el registro):
+---------+--------+---------------------+----------------------+
| subID   | userID | fecha_de_inicio     | fecha_de_vencimiento |
+---------+--------+---------------------+----------------------+
| 1       | 12345  | 2024-05-01          | 2024-06-01           |
+---------+--------+---------------------+----------------------+

### Documentación de Procedimientos Almacenados

---

### Listado de procedimientos almacenados
Listado de Procedimientos Almacenados

1. Procedimiento: EliminarUsuario

Descripción:
Este procedimiento elimina un usuario de la tabla `Usuarios` dado su `userID`.

Parámetros:
IN userID (INT): El ID del usuario que se desea eliminar.

Valor Retornado:
Ninguno.

Ejemplo de Uso:
CALL EliminarUsuario(12345);

Muestra de Resultado:
Antes de ejecutar el procedimiento:
SELECT * FROM Usuarios WHERE userID = 12345;
+--------+--------+-------------------+
| userID | nombre | correo_electronico|
+--------+--------+-------------------+
| 12345  | Juan   | juan@example.com  |
+--------+--------+-------------------+

Después de ejecutar el procedimiento:
CALL EliminarUsuario(12345);
SELECT * FROM Usuarios WHERE userID = 12345;
+--------+--------+-------------------+
| (No rows returned)                  |
+--------+--------+-------------------+

2. Procedimiento: ActualizarCorreoUsuario

Descripción:
Este procedimiento actualiza el correo electrónico de un usuario en la tabla `Usuarios` dado su `userID` y el nuevo correo electrónico.

Parámetros:
IN userID (INT): El ID del usuario cuyo correo electrónico se desea actualizar.
IN nuevo_correo_electronico (VARCHAR(255)): El nuevo correo electrónico del usuario.

Valor Retornado:
Ninguno.

Ejemplo de Uso:
CALL ActualizarCorreoUsuario(12345, 'nuevo_correo@example.com');

Muestra de Resultado:
Antes de ejecutar el procedimiento:
SELECT * FROM Usuarios WHERE userID = 12345;
+--------+--------+--------------------+
| userID | nombre | correo_electronico |
+--------+--------+--------------------+
| 12345  | Juan   | juan@example.com   |
+--------+--------+--------------------+

Después de ejecutar el procedimiento:
CALL ActualizarCorreoUsuario(12345, 'nuevo_correo@example.com');
SELECT * FROM Usuarios WHERE userID = 12345;
+--------+--------+--------------------------+
| userID | nombre | correo_electronico       |
+--------+--------+--------------------------+
| 12345  | Juan   | nuevo_correo@example.com |
+--------+--------+--------------------------+

---


### Documentación de Vistas

---

### Listado de Vistas

* Vista 1 :  vw_1_informe_inventario
* Vista 2 :  vw_2_valor_inventario
* Vista 3 :  vw_3_valor_total_inventario
* Vista 4 :  vw_4_productos_inventario
* Vista 5 :  vw_5_entradas_productos
* Vista 6 :  vw_6_salidas_productos

---

### Vista 1 :  `vw_1_informe_inventario`

**Descripción:** 

Esta vista muestra la informacion de todos los productos del inventario, agregando además datos de las tablas productos, marca y categoria para mayor claridad de quien recibe el informe.


**Columnas:**

| Columna            | Descripción                                            | Origen           |
|--------------------|--------------------------------------------------------|------------------|
| id_producto        | id del producto                                        | tabla inventario |
| descripcion        | descripción del producto                               | tabla productos  |
| marca              | marca del producto                                     | tabla marcas     |
| categoria          | categoria del producto                                 | tabla categorias |
| inventario_inicial | cantidad de productos al iniciar el inventario         | tabla inventario |
| total_entradas     | cantidad total de productos que entraron al inventario | tabla inventario |
| total_salidas      | cantidad total de productos que salieron al inventario | tabla inventario |
| stock              | cantidad de artículos disponibles                      | tabla inventario |
| ultimo_precio_$    | último precio del producto registrado                  | tabla inventario |


**Ejemplo de consulta:** 

```sql
SELECT * 
FROM control_inventario.vw_1_informe_inventario;
```

**Muestra del resultado de la consulta:**

---

### Vista 2 :  `vw_2_valor_inventario`

**Descripción:** 

Esta vista muestra el valor del inventario y el porcentaje que corresponde a cada porducto ordenado en forma descendente.

**Columnas:**

| Columna                     | Descripción                                                                                                                                                                                                                                                            | Origen                      |
|-----------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------|
| id_producto                 | id del producto                                                                                                                                                                                                                                                        | tabla inventario            |
| descripcion                 | descripción del producto                                                                                                                                                                                                                                               | tabla productos             |
| stock                       | cantidad de artículos disponibles                                                                                                                                                                                                                                      | tabla inventario            |
| ultimo_precio_$             |  último precio registrado del producto                                                                                                                                                                                                                                   | tabla inventario            |
| valor_inventario            | campo calculado según la fórmula: valor_inventario = stock * ultimo_precio_$                                                                                                                                                                                           | campo calculado en la vista |
| porcentaje_valor_inventario | corresponde al porcentaje que cada artículo aporta al total del valor del inventario. Se calcula por la formula: % valor inventario = valor_inventario / valor total del inventario  | campo calculado en la vista. El valor total del inventario se calcula en la función fn_4_valor_total_inventario() |


**Ejemplo de consulta:**

```sql
SELECT * 
FROM control_inventario.vw_2_valor_inventario;

```

**Muestra del resultado de la consulta:**

---


### Vista 3 :  `vw_3_valor_total_inventario`

**Descripción:** 

Esta vista muestra el valor total del inventario.

**Columnas:**

| Columna                | Descripción                                                                                | Origen                                                                                |
|------------------------|--------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------|
| valor_total_inventario | se calcula por medio de la función SUM de la siguiente forma: SUM(stock * ultimo_precio_$) | campo calculado en la vista. Los valores de stock y ultimo_precio_$ provienen de la tabla inventario |

**Ejemplo de consulta:**

```sql
SELECT * 
FROM control_inventario.vw_3_valor_total_inventario;
```
**Muestra del resultado de la consulta:**

---

### Vista 4 :  `vw_4_productos_inventario`

**Descripción:** 

Esta vista muestra todos los productos del inventario, incluyendo descripción, marca, categoría, ubicación y stock.

**Columnas:**

| Columna     | Descripción                               | Origen            |
|-------------|-------------------------------------------|-------------------|
| id_producto | id del producto                           | tabla inventario  |
| descripcion | descripción del producto                  | tabla productos   |
| marca       | marca del producto                        | tabla marcas      |
| categoria   | categoría del producto                    | tabla categorias  |
| ubicacion   | ubicación del producto dentro del almacén | tabla ubicaciones |
| stock       | cantidad de artículos disponibles         | tabla inventario  |


**Ejemplo de consulta:**

```sql
SELECT * 
FROM control_inventario.vw_4_productos_inventario;
```

**Muestra del resultado de la consulta:**

---

### Vista 5 :  `vw_5_entradas_productos`

**Descripción:** 

Esta vista muestra el registro de todas las entradas de productos al almacén.

**Columnas:**

| Columna     | Descripción                                         | Origen                 |
|-------------|-----------------------------------------------------|------------------------|
| id_entrada  | id del registro de entrada de productos             | tabla entradas         |
| fecha       | fecha en la que se registra la entrada de productos | tabla entradas         |
| id_producto | id del producto                                     | tabla detalle_entradas |
| descripcion | descripción del producto                            | tabla productos        |
| cantidad    | cantidad de productos que ingresaron                | tabla detalle_entradas |


**Ejemplo de consulta:**

```sql
SELECT * 
FROM control_inventario.vw_5_entradas_productos;
```

**Muestra del resultado de la consulta:**

---

### Vista 6 :  `vw_6_salidas_productos`

**Descripción:**

Esta vista muestra el registro de todas las salidas de productos del almacén.

**Columnas:**


| Columna     | Descripción                                        | Origen                |
|-------------|----------------------------------------------------|-----------------------|
| id_salida   | id del registro de salida de productos             | tabla salidas         |
| fecha       | fecha en la que se registra la salida de productos | tabla salidas         |
| id_producto | id del producto                                    | tabla detalle_salidas |
| descripcion | descripción del producto                           | tabla productos       |
| cantidad    | cantidad de productos que salieron                 | tabla detalle_salidas |


**Ejemplo de consulta:**

```sql
SELECT * 
FROM control_inventario.vw_6_salidas_productos;
```

**Muestra del resultado de la consulta:**

---

## Roles, Permisos y Usuarios


Se generaron **tres roles:**


todos_los_permisos: Este rol tiene permisos para realizar cualquier operación (CRUD: Crear, Leer, Actualizar, Eliminar) en todas las tablas de la base de datos Lank.
solo_lectura: Este rol tiene permisos solo para leer (SELECT) todas las tablas de la base de datos Lank.
lectura_insercion: Este rol tiene permisos para leer (SELECT) e insertar (INSERT) datos en todas las tablas de la base de datos Lank.
Además, tomando en cuenta la tabla de usuarios, se crearon tres usuarios:


Ale: Este usuario tiene asignado el rol todos_los_permisos, por lo que puede realizar cualquier operación en la base de datos Lank.
Euge: Este usuario tiene asignado el rol solo_lectura, por lo que solo puede consultar datos en la base de datos Lank.
Guada: Este usuario tiene asignado el rol lectura_insercion, por lo que puede consultar e insertar datos en la base de datos Lank.
Todos los roles, permisos y usuarios se definen en el archivo roles_users.sql.

---

## Backup de la Base de Datos

El backup generado es del tipo self-contained file y contiene estructura y datos. Los backups se almacenan en la carpeta backup.

También se puede generar un backup a través del comando `make backup-db` que permite ejecutar un backup de manera manual.

---

## Herramientas y Tecnologías Usadas
* MySQL (motor de bases de datos, version 8.0.36)
* MySQL Workbench (interfaz gráfica, version 8.0.36)
* Microsoft Word, Excel, PowerPoint
* Visual Studio Code (para desarrollar el documento README.md)
* Google Drive y Zoom (para ver el contenido de las clases)
* https://mockaroo.com/ (para generar datos ficticios)
* https://www.tablesgenerator.com/ (para transformar tablas de formato csv a markdown)
* Makefile (para generar una interfaz sencilla de procesos)
* Docker (para generar un container)
* GitHub (para entregar el proyecto)

---

## Instrucciones para Levantar el Proyecto en CodeSpaces GitHub

* env : archivo con contraseñas y data secretas
* Makefile : abstracción de creacción del proyecto
* docker-compose.yml : permite generar las bases de datos en forma de contenedores

### Pasos para arrancar el proyecto

* En la terminal de linux escribir :
    - `make` _si da un error de que no conexion al socket, volver al correr el comando `make`_
    - `make clean-db` limpia la base de datos
    - `make test-db` para observar los datos de cada tabla
    - `make backup-db` para realizar un backup de la base de datos
    - `make access-db` para acceder a la base de datos