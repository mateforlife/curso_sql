/* SENTENCIAS */

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

