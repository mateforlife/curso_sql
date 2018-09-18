/* VISTAS */

/* CREAR VISTA */

CREATE VIEW prestamos_usuarios_vw AS
SELECT
    u.usuario_id,
    u.nombre,
    u.email,
    u.username,
    COUNT(u.usuario_id) AS total_prestamos
FROM usuarios u
INNER JOIN libros_usuarios lu ON u.usuario_id = lu.usuario_id
GROUP BY u.usuario_id;

/* a una vista se le puede tratar como una tabla ej: SELEC * FROM prestamos_usuarios_vw; */

/*******************************************************************************************************************************/

/* EDITAR UNA VISTA EXISTENTE */

CREATE OR REPLACE VIEW prestamos_usuarios_vw AS
SELECT
    u.usuario_id,
    u.nombre,
    u.email,
    u.username,
    COUNT(u.usuario_id) AS total_prestamos
FROM usuarios u
INNER JOIN libros_usuarios lu ON u.usuario_id = lu.usuario_id
           AND lu.fecha_creacion >= CURDATE() - INTERVAL 5 DAY
GROUP BY u.usuario_id;
