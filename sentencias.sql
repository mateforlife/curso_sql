DROP DATABASE IF EXISTS curso_cf;
CREATE DATABASE curso_cf;
USE curso_cf;

DROP TABLE IF EXISTS autores;

CREATE TABLE IF NOT EXISTS autores(
    autor_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(25) NOT NULL,
    apellido VARCHAR(25) NOT NULL,
    seudonimo VARCHAR(50) UNIQUE,
    genero ENUM('M', 'F'),
    fecha_nacimiento DATE NOT NULL,
    pais_origen VARCHAR(40) NOT NULL,
    fecha_creacion DATETIME DEFAULT current_timestamp
);

CREATE TABLE libros(
    libro_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    autor_id INT UNSIGNED NOT NULL,
    titulo VARCHAR(50) NOT NULL,
    descripcion VARCHAR(250),
    paginas INT UNSIGNED,
    fecha_publicacion DATE NOT NULL,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(autor_id) REFERENCES autores(autor_id) ON DELETE CASCADE
);

ALTER TABLE libros ADD ventas INT UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE libros ADD stock INT UNSIGNED NOT NULL DEFAULT 0;

CREATE TABLE usuarios(
    usuario_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(25) NOT NULL,
    apellido VARCHAR(25),
    username VARCHAR(25) NOT NULL,
    email VARCHAR(50) NOT NULL,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO usuarios(nombre, apellido, username, email)
VALUES ('Alex', 'Rodríguez', 'DinoBass', 'rodriguez.ruiz.alex@gmail.com');

INSERT INTO autores (nombre, apellido, seudonimo, fecha_nacimiento, genero, pais_origen )
  VALUES ('Stephen Edwin', 'King', 'Richard Bachman', '1947-09-27', 'M', 'USA'),
         ('Joanne', 'Rowling', 'J.K Rowling', '1947-09-27', 'F', 'Reino unido'),
         ('Daniel', 'Brown',  NULL, '1964-06-22', 'M', 'USA'),
         ('John', 'Katzenbach ', NULL,'1950-06-23', 'M', 'USA'),
         ('John Ronald', 'Reuel Tolkien', NULL, '1892-01-03', 'M', 'Reino unido'),
         ('Miguel', 'de Unamuno', NULL, '1892-01-03', 'M', 'USA'),
         ('Arturo', 'Pérez Reverte', NULL, '1951-11-25', 'M', 'España'),
         ('George Raymond', 'Richard Martin', NULL, '1948-09-20', 'M', 'USA');

INSERT INTO libros(autor_id, titulo, fecha_publicacion)
VALUES (1, 'Carrie','1974-01-01'),
      (1, 'El misterio de Salmes Lot','1975-01-01'),
      (1, 'El resplando','1977-01-01'),
      (1, 'Rabia','1977-01-01'),
      (1, 'El umbral de la noche','1978-01-01'),
      (1, 'La danza de la muerte','1978-01-01'),
      (1, 'La larga marcha','1979-01-01'),
      (1, 'La zona muerta','1979-01-01'),
      (1, 'Ojos de fuego','1980-01-01'),
      (1, 'Cujo','1981-01-01'),
      (1, 'La torre oscura 1 El pistolero','1982-01-01'),
      (1, 'La torre oscura 2 La invocación','1987-01-01'),
      (1, 'Apocalipsis','1990-01-01'),
      (1, 'La torre oscura 3 Las tierras baldías','1991-01-01'),
      (1, 'La torre oscura 4 Bola de cristal','1997-01-01'),
      (1, 'La torre oscura 5 Los de Calla','2003-01-01'),
      (1, 'La torre oscura 6 La torre oscura','2004-01-01'),
      (1, 'La torre oscura 7 Canción de Susannah','2004-01-01'),
      (1, 'La niebla','1981-01-01'),

      (2, 'Harry Potter y la Piedra Filosofal', '1997-06-30'),
      (2, 'Harry Potter y la Cámara Secreta', '1998-07-2'),
      (2, 'Harry Potter y el Prisionero de Azkaban','1999-07-8'),
      (2, 'Harry Potter y el Cáliz de Fuego','2000-03-20'),
      (2, 'Harry Potter y la Orden del Fénix','2003-06-21'),
      (2, 'Harry Potter y el Misterio del Príncipe','2005-06-16'),
      (2, 'Harry Potter y las Reliquias de la Muerte','2007-07-21'),

      (3, 'Origen', '2017-01-01'),
      (3, 'Inferno', '2013-01-01'),
      (3, 'El simbolo perdido', '2009-01-01'),
      (3, 'El código Da Vinci', '2006-01-01'),
      (3, 'La consipiración', '2003-01-01'),

      (4, 'Al calor del verano', '1982-01-01'),
      (4, 'Un asunto pendiente', '1987-01-01'),
      (4, 'Juicio Final', '1992-01-01'),
      (4, 'La sombra', '1995-01-01'),
      (4, 'Juego de ingenios', '1997-01-01'),
      (4, 'El psicoanalista', '2002-01-01'),
      (4, 'La historia del loco', '2004-01-01'),
      (4, 'El hombre equivocado', '2006-01-01'),
      (4, 'El estudiante', '2014-01-01'),

      (5, 'El hobbit','1937-01-01'),
      (5, 'Las dos torres','1954-01-01'),
      (5, 'El señor de los anillos','1954-01-01'),
      (5, 'La comunidad del anillo','1954-01-01'),
      (5, 'El retorno del rey','1955-01-01'),

      (6, 'La niebla','1914-01-01'),

      (7, 'Eva','2017-01-01'),
      (7, 'Falcó','2016-01-01'),
      (7, 'Hombre buenos','2015-01-01'),
      (7, 'Los barcos se pierden en tierra','2011-01-01'),

      (8, 'Juego de tronos','1996-08-01'),
      (8, 'Choque de reyes','1998-11-16'),
      (8, 'Tormenta de espadas','2005-10-17'),
      (8, 'Festin de cuervos','2011-07-12'),
      (8, 'Danza de dragones','2011-07-12');

SELECT * FROM libros WHERE titulo IN ('Carrie', 'El Resplandor');

/* consulta para no traer titulos repetidos */
SELECT DISTINCT titulo FROM libros;

/* Alias */
SELECT autor_id AS autor, titulo AS nombre FROM libros AS books;

/* Actualizar */
UPDATE libros SET autor = 'Tolkien', descripcion = 'El Hobbit' WHERE titulo = 'El Hobbit';

/* Eliminar */
DELETE FROM libros WHERE autor_id = 1;

/* Restaurar tabla completa(y eliminar registros) */
TRUNCATE TABLE libros;

/* Concatenar*/
SELECT CONCAT(nombre, ' ', apellido) FROM autores;

/* funcion LENGHT */
SELECT nombre FROM autores WHERE LENGTH(nombre) > 7;

/* UPCASE LOWCASE */
SELECT UPPER(nombre), LOWER(nombre) FROM autores;

/* TRIM */
SELECT TRIM(nombre) FROM autores;

/* LEFT RIGHT */
SELECT LEFT(seudonimo, 5), RIGHT(seudonimo, 5) FROM autores;

/* NUMERO DECIMAL RANDOM */
SELECT RAND();

/* NUMERO ENTERO RANDOM */
SELECT ROUND(RAND() * 100);

/* TRUNCATE, DEJA LOS DECIMALES SEGUN SEGUNDO ARGUMENTO */
SELECT TRUNCATE(0.123456, 3);
/* RESULTADO = 0.123 */

/* ELEVAR EL 2 A LA 16 */
SELECT POW(2, 16);

/* FUNCIONES CON FECHAS
Almacenar NOW en variable: */
SET @now = NOW();

/* FECHA ACTUAL */
SELECT CURDATE();

/* funciones sobre @now */
SELECT SECOND(@now), MINUTE(@now), HOUR(@now), MONTH(@now), YEAR(@now);

SELECT DAYOFWEEK(@now), DAYOFMONTH(@now), DAYOFYEAR(@now);

/* Convertir TIMESTAMPS en DATE */
SELECT DATE(@now);

/* Sumar dias a fecha */
SELECT @now + INTERVAL 30 DAY;

/* IF */
SELECT titulo, IF(paginas > 1, 'Tiene', 'no tiene') FROM libros;

/* IFNULL */
SELECT titulo, IFNULL(paginas, 'no tiene') FROM libros;

/*Expresiones regulares */
SELECT titulo FROM libros WHERE titulo REGEXP '^[HLA]'; /* busca titulos que empiecen con H, L o A */

/* Limitar registros obtenidos */
SELECT titulo FROM libros WHERE autor_id = 2 LIMIT 10; /* LIMITA A UN MAXIMO DE 10 REGISTROS */

SELECT titulo FROM libros LIMIT 0, 5; /* ENTREGA SOLO 5 REGISTROS EMPEZANDO DESDE EL REGISTRO NUMERO 0 */

/* FUNCIONES DE AGREGACIÓN */
SELECT COUNT(ventas) AS cuenta_de_ventas FROM libros;

SELECT SUM(ventas) AS total_ventas FROM libros;

SELECT MIN(ventas) AS venta_minima FROM libros;

SELECT MAX(ventas) AS venta_maxima FROM libros;

SELECT AVG(ventas) AS promedio_ventas FROM libros;

/* CONDICIONES BAJO AGRUPAMIENTO */
SELECT autor_id, SUM(ventas) AS total_ventas 
FROM libros 
    GROUP BY autor_id 
    HAVING total_ventas > 500; /* SE USA HAVING en vez de WHERE
 
/* CONSULTAS ANIDADAS */
SELECT CONCAT(nombre, ' ', apellido)
FROM autores
WHERE autor_id IN(
    SELECT autor_id
    FROM libros
    GROUP BY autor_id
    HAVING SUM(ventas) > (SELECT AVG(ventas) FROM libros)
);

/* Left Join */
 SELECT a.seudonimo AS nombre_autor, l.titulo
    FROM libros AS l
    LEFT JOIN autores AS a ON l.autor_id = a.autor_id
    WHERE a.seudonimo = 'J.K Rowling';

/**/
SELECT a.seudonimo AS nombre_autor, SUM(l.ventas) AS total_ventas
    FROM libros AS l
    LEFT JOIN autores AS a ON l.autor_id = a.autor_id
    GROUP BY a.seudonimo ORDER BY l.ventas DESC;
