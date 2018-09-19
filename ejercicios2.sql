/* EJERCICIOS N°2 */

/* Obtener a todos los usuarios que han realizado un préstamo en los últimos diez días. */

SELECT u.username
FROM usuarios u
    INNER JOIN libros_usuarios lu ON u.usuario_id = lu.usuario_id
        AND lu.fecha_creacion >= CURDATE() - INTERVAL 10 DAY;


/* Obtener a todos los usuarios que no ha realizado ningún préstamo. */

SELECT u.username
FROM usuarios u
    LEFT JOIN libros_usuarios lu ON u.usuario_id = lu.usuario_id
WHERE lu.usuario_id IS NULL;

/* Listar de forma descendente a los cinco usuarios con más préstamos. */

SELECT COUNT(lu.usuario_id) AS prestamos, u.username
FROM usuarios u
    INNER JOIN libros_usuarios lu ON u.usuario_id = lu.usuario_id
GROUP BY u.username
ORDER BY prestamos DESC;

/* Listar 5 títulos con más préstamos en los últimos 30 días. */

SELECT COUNT(lu.libro_id) AS prestamos, l.titulo
FROM libros l
    INNER JOIN libros_usuarios lu ON l.libro_id = lu.libro_id
GROUP BY l.titulo
ORDER BY prestamos DESC;

/* Obtener el título de todos los libros que no han sido prestados. */

SELECT l.titulo
FROM libros l
    LEFT JOIN libros_usuarios lu ON l.libro_id = lu.libro_id
WHERE lu.libro_id IS NULL;

/* Obtener la cantidad de libros prestados el día de hoy. */

SELECT COUNT(libro_id) AS libros_prestados_hoy
FROM libros_usuarios
WHERE DATE(fecha_creacion) = CURDATE();

/* Obtener la cantidad de libros prestados por el autor con id 1. */

SELECT COUNT(libro_id) AS libros_prestados
FROM libros_usuarios
WHERE libro_id IN(
    SELECT libro_id
    FROM libros
    WHERE autor_id = 1
);

/* Obtener el nombre completo de los cinco autores con más préstamos. */

SELECT COUNT(l.libro_id) AS libros_prestados, CONCAT(a.nombre, ' ', a.apellido) AS nombre_completo
FROM autores a
    INNER JOIN libros l ON a.autor_id = l.autor_id
    INNER JOIN libros_usuarios lu ON l.libro_id = lu.libro_id
GROUP BY nombre_completo
ORDER BY libros_prestados DESC LIMIT 5;

/* Obtener el título del libro con más préstamos esta semana. */

SELECT l.titulo, COUNT(lu.libro_id) AS prestamos
FROM libros l
    INNER JOIN libros_usuarios lu ON l.libro_id = lu.libro_id
GROUP BY l.titulo
ORDER BY prestamos DESC LIMIT 1;