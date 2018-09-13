
/* INNER JOIN */

SELECT libros.titulo, CONCAT(autores.nombre, ' ', autores.apellido), libros.fecha_creacion
FROM libros
    INNER JOIN autores ON libros.autor_id = autores.autor_id;

/* INNER JOIN (otra forma para reemplazar el ON, USING señala cual es la columna compartida entre tablas, en este caso es autor_id */
SELECT libros.titulo, CONCAT(autores.nombre, ' ', autores.apellido), libros.fecha_creacion
FROM libros
    INNER JOIN autores USING(autor_id);
/* IMPORTANTE!! USANDO USING no se puede condicionar la query usando WHERE */



/* LEFT JOIN */

SELECT a.seudonimo AS nombre_autor, l.titulo
FROM libros AS l
    LEFT JOIN autores AS a ON l.autor_id = a.autor_id
WHERE a.seudonimo = 'J.K Rowling';

/**/
SELECT a.seudonimo AS nombre_autor, SUM(l.ventas) AS total_ventas
FROM libros AS l
    LEFT JOIN autores AS a ON l.autor_id = a.autor_id
GROUP BY a.seudonimo ORDER BY l.ventas DESC;

/**/
SELECT CONCAT(nombre, ' ', apellido) AS nombre,
       lu.libro_id
FROM usuarios u
    LEFT JOIN libros_usuarios lu ON u.usuario_id = lu.usuario_id;



/* RIGHT JOIN */

SELECT CONCAT(nombre, ' ', apellido) AS nombre,
       lu.libro_id
FROM libros_usuarios lu
    RIGHT JOIN usuarios u ON u.usuario_id = lu.usuario_id;

/* JOIN DE MAS DE DOS TABLAS */

SELECT
    CONCAT(u.nombre, ' ', u.apellido) AS nombre_usuario,
    l.titulo,
    CONCAT(a.nombre, ' ', a.apellido) AS nombre_autor
FROM usuarios AS u
    INNER JOIN libros_usuarios AS lu ON u.usuario_id = lu.usuario_id
    INNER JOIN libros AS l ON lu.libro_id = l.libro_id
    INNER JOIN autores AS a ON l.autor_id = a.autor_id;