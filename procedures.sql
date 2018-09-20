
/* PROCEDIMIENTOS ALMACENADOS */

/* MOSTRAR PROCEDIMIENTO EXISTENTES */
SHOW PROCEDURE STATUS WHERE db=DATABASE();

/* CREAR PROCEDIMIENTO */

DELIMITER //

CREATE PROCEDURE prestamo(libro INT, usuario INT, OUT cantidad INT)

BEGIN
    SET cantidad = (
        SELECT stock FROM libros WHERE libro_id = libro
    );
    IF cantidad > 0 THEN
        INSERT INTO libros_usuarios(libro_id, usuario_id)
        VALUES(libro, usuario);
        UPDATE libros l SET stock = stock - 1 WHERE libro_id = libro;
        SET cantidad = cantidad - 1;
    ELSE
        SET @titulo = (
            SELECT titulo FROM libros WHERE libro_id = libro
        );
        SELECT CONCAT('El libro ', @titulo, ' No es posible realizar el prestamo ya que el libro no posee STOCK suficiente') AS mensaje_error;
    END IF;
    SELECT cantidad AS stock_final_libro;
END//

DELIMITER ;

/* LLAMAR UN PROCEDIMIENTO */

CALL prestamo(aegumento1, argumento2, etc);

/* ELIMINAR PROCEDIMIENTO */

DROP PROCEDURE prestamo;



/* CREAR PROCEDIMIENTO */

DELIMITER //

CREATE PROCEDURE tipo_lector(usuario INT)

BEGIN

    SET @cantidad = (
        SELECT COUNT(*) FROM libros_usuarios WHERE usuario_id = 1
    );

    CASE
        WHEN @cantidad > 20 THEN
            SELECT 'Fanatico' AS mensaje;
        WHEN @cantidad > 10 AND @cantidad < 20 THEN
            SELECT 'Aficionado' AS mensaje;
        WHEN @cantidad > 5 AND @cantidad < 10 THEN
            SELECT 'Promedio' AS mensaje;
        ELSE
            SELECT 'Noob' AS mensaje;
    END CASE;            

    SELECT @cantidad AS libros_prestados;
END//

DELIMITER ;

/* CREAR PROCEDIMIENTO CON CICLOS WHILE y REPEAT */

/* WHILE */
DELIMITER //

CREATE PROCEDURE libros_azar()
BEGIN
    SET @ciclo = 0;
    WHILE @ciclo < 5 DO
        SELECT libro_id, titulo
        FROM libros
        ORDER BY RAND() LIMIT 1;
        SET @ciclo = @ciclo + 1;
    END WHILE;
END//

DELIMITER ;

/* REPEAT */
DELIMITER //

CREATE PROCEDURE libros_azar()
BEGIN
    SET @ciclo = 0;
    REPEAT
        SELECT libro_id, titulo
        FROM libros
        ORDER BY RAND() LIMIT 1;
        SET @ciclo = @ciclo + 1;
    UNTIL @ciclo >= 5;
END//

DELIMITER ;