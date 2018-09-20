/* TRANSACCIONES */

START TRANSACTION;

    SET @libro = 20, @usuario = 2;

    UPDATE libros SET stock = stock - 1 WHERE libro_id = @libro;
    SELECT stock FROM libros WHERE libro_id = @libro;

    INSERT INTO libros_usuarios(libro_id, usuario_id)
    VALUES(@libro, @usuario);

    SELECT * FROM libros_usuarios;

COMMIT;
/* O ROLLBACK EN CASO DE QUE ALGO FALLE */



/* TRANSACCION DENTRO DE UN STORE PROCEDURE */

DELIMITER //

CREATE PROCEDURE prestamo_libro(libro INT, usuario INT)

BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SELECT 'Ocurrió un error al procesar la transacción, por favor revise sus datos';
        ROLLBACK;
    END;

    START TRANSACTION;
        INSERT INTO libros_usuarios(libro_id, usuario_id) VALUES(libro, usuario);
        UPDATE libros l SET stock = stock - 1 WHERE libro_id = libro;
    COMMIT;
    SELECT titulo AS libro_prestado, stock AS stock_final FROM libros WHERE libro_id = libro;
END//

DELIMITER ;