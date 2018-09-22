/* LISTAR Y MOSTRAR TRIGGERS */

SHOW TRIGGERS;


/* CREAR TRIGGERS */

/* ON INSERT *****************************************************************************************************/
/* trigger para que cada vez que se inserte un nuevo libro, este aumenta la cantidad de libros de la tabla autores */
DELIMITER //

CREATE TRIGGER after_insert_books_update
AFTER INSERT ON libros
FOR EACH ROW

BEGIN
    UPDATE autores SET cantidad_libros = cantidad_libros + 1 WHERE autor_id = NEW.autor_id;
END;
//

DELIMITER ;


/* ON DELETE ****************************************************************************************************/
DELIMITER //

CREATE TRIGGER after_delete_books_update
AFTER DELETE ON libros
FOR EACH ROW

BEGIN
    UPDATE autores SET cantidad_libros = cantidad_libros - 1 WHERE autor_id = OLD.autor_id;
END;
//

DELIMITER ;

/* ON UPDATE  ****************************************************************************************************/
DELIMITER //

CREATE TRIGGER after_update_books
AFTER UPDATE ON libros
FOR EACH ROW

BEGIN
    IF(NEW.autor_id != OLD.autor_id) THEN
        UPDATE autores SET cantidad_libros = cantidad_libros - 1 WHERE autor_id = OLD.autor_id;
        UPDATE autores SET cantidad_libros = cantidad_libros + 1 WHERE autor_id = NEW.autor_id;
    END IF;    
END;
//

DELIMITER ;

